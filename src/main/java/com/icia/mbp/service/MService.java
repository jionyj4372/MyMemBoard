package com.icia.mbp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.mbp.dao.MDAO;
import com.icia.mbp.dto.MEMBER;
import com.icia.mbp.dto.PAGE;
import com.icia.mbp.dto.SEARCH;

@Service
public class MService {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private MDAO mdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	// 암호화하기 위해 추가하는 클래스
	@Autowired
	private BCryptPasswordEncoder pwEnc;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	// mJoin : 회원가입
	public ModelAndView mJoin(MEMBER member) throws IllegalStateException, IOException {
		
//		System.out.println("[2] controller->service\n member : "+member);
		
		// [1] 파일업로드
		//  - 파일 이름 생성
		//	- (식별자 + 파일이름)
		//	- profile폴더 생성 후 업로드
		MultipartFile memProfile = member.getMemProfile();
		
		UUID uuid = UUID.randomUUID();
		
		String profileName = uuid.toString().substring(0,8)
				+ "_" + memProfile.getOriginalFilename();
		
		// 절대경로
		//String savePath = "C:\\Users\\user\\Documents\\"
		//		+ "workspace-sts-3.9.18.RELEASE\\MEMBOARD\\"
		//		+ "src\\main\\webapp\\resources\\profile\\";
		
		// 상대경로(서버경로)
		String savePath = request.getServletContext().getRealPath("/resources/profile/");
		
		
		
		if(!memProfile.isEmpty()) {
			memProfile.transferTo(new File(savePath + profileName));
			member.setMemProfileName(profileName);
		}
		
		// [2] 주소 결합
		//	- (addr1) + addr2 + addr3
		// ex) (22223) 인천 미추홀구 매소홀로488번길 6-32, 태승빌딩 4층 // 과 같이 출력
		
		String memAddr = "("+member.getAddr1()+") " 
				+ member.getAddr2() + ", " 
				+ member.getAddr3();
		member.setMemAddr(memAddr);
		
		
//		System.out.println("암호화 전 : "+member);
		
		// 비밀번호 암호화
		// 회원가입 시 입력했던 memPw를 암호화해서 MEMBER클래스의 필드인 memPw에 저장한다.
		member.setMemPw(pwEnc.encode(member.getMemPw()));
		
//		System.out.println("암호화 후 : "+member);
		
		
		// 가입
		int result = mdao.mJoin(member);
		
//		System.out.println("[4] dao->service\n result : "+result);
		
		if(result>0) {
			mav.setViewName("redirect:pages-login");
		} else {
			mav.setViewName("pages-register");
		}
		return mav;
	}
	
	// 로그인 메소드
	public ModelAndView mLogin(MEMBER member) {

		// 암호화 했을 경우 코드
		// mapper에서 입력한 아이디에 해당하는 패스워드를 가져오는 것
		MEMBER getMember = mdao.mLogin(member);
		String encPw = getMember.getMemPw();
		
		//System.out.println("encPw : "+encPw);
		//System.out.println("getMemPw : "+member.getMemPw());
		//System.out.println("matches : "+pwEnc.matches(member.getMemPw(), encPw));
		
		// 매개변수 순서 상관x
		// member.getMemPw() : 입력한 값, encPw : DB에서 가져온 값
		if(pwEnc.matches(member.getMemPw(), encPw)) {
			session.setAttribute("loginId", member.getMemId());
			session.setAttribute("loginProfile", getMember.getMemProfileName());
			mav.setViewName("index");
		} else {
			mav.setViewName("pages-login");
		}
		return mav;
	}
	
	// mList : 회원 목록보기(관리자 계정)
	public ModelAndView mList(int page, int limit) {
		
//		System.out.println("[2] controller -> service\n page,limit :" + page + "," + limit);

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 한 화면에 보여줄 게시글 갯수
		// int limit = 5;

		// 전체 게시글 갯수 : 59
		int bCount = mdao.mCount();

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		// ceil() 함수 : 올림 기능
		int maxPage = (int) (Math.ceil((double) bCount / limit));
		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;
		int endPage = startPage + block - 1;

		// 오류 방지 코드
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		// 페이징 객체 생성
		PAGE paging = new PAGE();

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);
		
		List<MEMBER> pagingList = mdao.mList(paging);

		System.out.println("[4] controller -> service\n pagingList :" + pagingList);

		// model
		mav.addObject("pagingList", pagingList);
		mav.addObject("paging", paging);

		// view
		mav.setViewName("pages-userList");

		return mav;
	}
	
	
	// mView : 회원 상세보기(관리자 계정)
	public ModelAndView mView(String memId) {
		
//		System.out.println("[2] controller -> service\n memId : "+memId);
		
		MEMBER member = mdao.mView(memId);
		
//		System.out.println("[4] dao -> service\n member : " + member);
		
		mav.addObject("member", member);
		mav.setViewName("users-profile");
		
		return mav;
	}
	
	// idCheck : 아이디 중복 체크
	public ModelAndView idCheck(String memId) {
		
//		System.out.println("[2] controller -> service\n memId : "+memId);
		
		String checkId = mdao.idCheck(memId);
		
//		System.out.println("[4] dao -> service\n checkId : "+checkId);
		
		if(checkId == null) {	// 아이디가 사용가능할 경우
			mav.setViewName("M_Join1");
			mav.addObject("checkId", memId);
		} else {				// 이미 사용중인 아이디가 있을 경우
			mav.setViewName("M_Join2");
			mav.addObject("checkId", memId);
		}
		
		return mav;
	}
	
	// mSearch : 회원 검색
	public ModelAndView mSearch(SEARCH search) {
		
		List<MEMBER> memberList = mdao.mSearch(search);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("S_List");
		
		return mav;
	}
	
	// mModiForm : 회원 정보 수정 페이지로 이동
	public ModelAndView mModiForm(String memId) {
//		System.out.println("[2] controller -> service\n memId : "+memId);
		
		MEMBER member = mdao.mView(memId);
		
//		System.out.println("[4] dao -> service\n memId : "+memId);
		
		mav.addObject("modify", member);
		mav.setViewName("redirect:/mView?memId="+member.getMemId());
		
		return mav;
	}

	// mModify : 회원 정보 수정
	public ModelAndView mModify(MEMBER member) throws IllegalStateException, IOException {
		
//		System.out.println("[2] controller->service\n member : "+member);
		
		// [1] 파일업로드
		//  - 파일 이름 생성
		//	- (식별자 + 파일이름)
		//	- profile폴더 생성 후 업로드
		
		if(!member.getMemProfile().isEmpty()) {
			MultipartFile memProfile = member.getMemProfile();
			
			UUID uuid = UUID.randomUUID();
			
			String profileName = uuid.toString().substring(0,8)
					+ "_" + memProfile.getOriginalFilename();
			
			// 상대경로,(서버경로)
			String savePath = request.getServletContext().getRealPath("/resources/profile/");
			
			if(!member.getMemPreProfileName().isEmpty()) {
				// 기존 파일 삭제
				String deletePath = request.getServletContext().getRealPath("/resources/profile/");
				
				File deleteFile = new File(deletePath+member.getMemPreProfileName());
				
				if(deleteFile.exists()) {
					deleteFile.delete();
				} else {
					//System.out.println("기존 파일 삭제 실패");
				}
				
			}
			memProfile.transferTo(new File(savePath + profileName));
			member.setMemProfileName(profileName);
		} else {
			if(!member.getMemPreProfileName().isEmpty()) {
				
				String profileName = member.getMemPreProfileName();
				
				// 상대경로,(서버경로)
				String savePath = request.getServletContext().getRealPath("/resources/profile/");
				
				member.setMemProfileName(profileName);
			}
		}
			
		// [2] 주소 결합
		//	- (addr1) + addr2 + addr3
		// ex) (22223) 인천 미추홀구 매소홀로488번길 6-32, 태승빌딩 4층 // 과 같이 출력
		
		String memAddr = "("+member.getAddr1()+") " 
				+ member.getAddr2() + ", " 
				+ member.getAddr3();
		member.setMemAddr(memAddr);
		
		// 비밀번호 암호화
		// 회원가입 시 입력했던 memPw를 암호화해서 MEMBER클래스의 필드인 memPw에 저장한다.
		member.setMemPw(pwEnc.encode(member.getMemPw()));
		
		
		// 수정
		int result = mdao.mModify(member);
		
//		System.out.println("[4] dao -> service\n result : "+result);
		
		if(result>0) {
			session.setAttribute("loginProfile", member.getMemProfileName());
			mav.setViewName("redirect:/mView?memId="+member.getMemId());
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}
	
	// mDelete : 회원 삭제 
	public ModelAndView mDelete(String memId) {
		
		int result = mdao.mDelete(memId);
		
		if(result>0){
			session.invalidate();
			mav.setViewName("index");
			
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}
	
	// madDelete : 회원 삭제(관리자)
	public ModelAndView madDelete(String memId) {
		
		int result = mdao.mDelete(memId);
		
		if (result > 0) {
			mav.setViewName("redirect:mList");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}
	
	// idoverlap : 아이디 중복체크 ajax
	public String idoverlap(String memId) {
		
//		System.out.println("[2] controller -> service\n memId : "+memId);
		
		String checkId = mdao.idCheck(memId);
		String result;
		
//		System.out.println("[4] dao -> service\n checkId : "+checkId);
		
		if(checkId == null) {	// 아이디가 사용가능할 경우
			result = "OK";
		} else {				// 이미 사용중인 아이디가 있을 경우
			result = "NO";
		}
		
		return result;
	}
	
	// mCheckEmail : 이메일 인증
	public String mCheckEmail(String memEmail) {
		String uuid = UUID.randomUUID().toString().substring(0,6);
		
		MimeMessage mail = mailSender.createMimeMessage();
		
		// 보낼 내용
		String mailContent = "<h2>안녕하세요. 인천일보 아카데미입니다.</h2><br/>"
				+ "<h3>인증번호는 "+ uuid + " 입니다.</h3>";
		
		try {
			// 보낼 제목
			mail.setSubject("[이메일 인증] 인천일보 아카데미 이메일 인증", "UTF-8");
			
			mail.setText(mailContent,"UTF-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(memEmail)); // 보낼사람
		
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		
		
		return uuid;
	}
	
	
	
	
	
	
	
}
