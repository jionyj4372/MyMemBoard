package com.icia.mbp.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.mbp.dto.MEMBER;
import com.icia.mbp.dto.SEARCH;
import com.icia.mbp.service.MService;

@Controller
public class MController {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private MService msvc;
	
	@Autowired
	private HttpSession session;
	
	
	// 프로젝트 시작페이지 (@RequestMapping의 value값이 "/" 일때)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start() {
		return "index";
	}

	// 프로젝트 첫페이지
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	
	// pages-register : 회원가입 페이지로 이동
	@RequestMapping(value = "/pages-register", method = RequestMethod.GET)
	public String pages_register() {
		return "pages-register";
	}
	
	// mJoin : 회원가입
	@RequestMapping(value = "/mJoin", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {
		
//		System.out.println("[1] jsp->controller\n member : "+member);
		
		mav = msvc.mJoin(member);
		
//		System.out.println("[5] jsp->controller\n mav : "+mav);
		
		return mav;
	}
	
	// idCheck : 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public ModelAndView idCheck(@RequestParam("memId") String memId) {
		
//		System.out.println("[1] jsp -> controller\n memId : " + memId);

		mav = msvc.idCheck(memId);

//		System.out.println("[5] service -> controller\n mav : " + mav);
		
		return mav;
	}
	
	
	// pages-login : 로그인 페이지로 이동
	@RequestMapping(value = "/pages-login", method = RequestMethod.GET)
	public String pages_login() {
		return "pages-login";
	}
	
	// mLogin : 로그인
	@RequestMapping(value = "/mLogin", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute MEMBER member) {
		// 넘기는 정보가 많다면 DTO로 넘기는게 편하다
//		System.out.println("[1] jsp -> controller\n memId : " + memId + "/ memPw : " + memPw);

		mav = msvc.mLogin(member);

//		System.out.println("[5] service -> controller\n mav : " + mav);

		return mav;
	}
	
	// mLogout : 로그아웃
	@RequestMapping(value = "/mLogout", method = RequestMethod.GET)
	public String mLogout() {
		
		session.invalidate();
		
		return "index";
	}
	
	// mList : 회원 목록보기(페이징처리o,관리자 계정)
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	public ModelAndView mList(
			@RequestParam(value="page"
			, required=false, defaultValue="1") int page
			, @RequestParam(value = "limit"
			, required=false, defaultValue="5") int limit) {
		
//		System.out.println("[1] jsp -> controller \n page,limit : "+page+","+limit);
		
		mav = msvc.mList(page,limit);
		
//		System.out.println("[5] service -> controller\n mav : "+mav);
		
		return mav;
	}
	
	// mView : 회원 상세보기(관리자 계정)
	@RequestMapping(value = "/mView", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("memId") String memId) {
		// GET방식으로 넘어온 "mId"를 String타입 mId에 담겠다
//		System.out.println("[1] jsp -> controller\n memId : " + memId);

		mav = msvc.mView(memId);

//		System.out.println("[5] service -> controller\n mav : " + mav);

		return mav;
	}
	
	// mSearch : 회원 검색
	@RequestMapping(value = "/mSearch", method = RequestMethod.GET)
	public ModelAndView mSearch(@ModelAttribute SEARCH search) {
		
		mav = msvc.mSearch(search);

		return mav;
	}
	
	// mModiForm : 회원 정보 수정 페이지로 이동
	@RequestMapping(value = "/mModiForm", method = RequestMethod.GET)
	public ModelAndView mModiForm(@RequestParam("memId") String memId) {
		
//		System.out.println("[1] jsp -> controller\n memId : "+memId);
		
		mav = msvc.mModiForm(memId);
		
//		System.out.println("[5] service -> controller\n mav : "+mav);
		
		return mav;
	}
	
	// mModify : 회원 정보 수정
	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public ModelAndView mModify(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {
		
//		System.out.println("[1] jsp->controller\n member : "+member);
		
		mav = msvc.mModify(member);
		
//		System.out.println("[5] jsp->controller\n mav : "+mav);
		
		return mav;
	}
	
	// mDelete : 회원 삭제
	@RequestMapping(value = "/mDelete", method = RequestMethod.GET)
	public ModelAndView mDelete(@RequestParam("memId") String memId) {
		
		mav = msvc.mDelete(memId);
		
		return mav;
	}
	
	// madDelete : 회원 삭제(관리자)
	@RequestMapping(value = "/madDelete", method = RequestMethod.GET)
	public ModelAndView madDelete(@RequestParam("memId") String memId) {
		
		mav = msvc.madDelete(memId);
		
		return mav;
	}
	
	
	// idoverlap : 아이디 중복체크 ajax
	@RequestMapping(value = "/idoverlap", method = RequestMethod.POST)
	public @ResponseBody String idoverlap(@RequestParam("memId") String memId) {
		// - ajax에서 dataType을 text으로 했지만 java에선 텍스트가 String이므로
		//   idoverlap의 데이터 타입은 String
		// - ajax로 보내기 위해 메소드의 데이터 타입앞에 @ResponseBody 선언
		
		System.out.println("ajax로 넘어온 memId : "+memId);
		
		String result = msvc.idoverlap(memId);
		
		System.out.println("DB에서 확인한 result : "+result);
		
		return result;
	}
	
	// mCheckEmail : 이메일 인증
	@RequestMapping(value = "/mCheckEmail", method = RequestMethod.POST)
	public @ResponseBody String mCheckEmail(@RequestParam("memEmail") String memEmail) {
		
//		System.out.println("ajax로 넘어온 memEmail : "+memEmail);
		
		String uuid = msvc.mCheckEmail(memEmail);
		
//		System.out.println("DB에서 확인한 result : "+result);
		
		return uuid;
	}
	
	
	
	
}
