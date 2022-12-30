package com.icia.mbp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.mbp.dao.BDAO;
import com.icia.mbp.dto.BOARD;
import com.icia.mbp.dto.PAGE;

@Service
public class BService {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private BDAO bdao;
	
	@Autowired
	private HttpServletRequest request;
	
	
	
	// bWrite : 게시물 작성
	public ModelAndView bWrite(BOARD board) throws IllegalStateException, IOException {
//		System.out.println("[2] controller -> service\n board : "+board);
		
		// [1] 파일업로드
		// - 파일 이름 생성
		// - (식별자 + 파일이름)
		// - profile폴더 생성 후 업로드
		MultipartFile boFile = board.getBoFile();

		UUID uuid = UUID.randomUUID();

		String boFileName = uuid.toString().substring(0, 8) 
				+ "_" + boFile.getOriginalFilename();

		// 절대경로
//		String savePath = "C:\\Users\\user\\Documents\\" 
//				+ "workspace-sts-3.9.18.RELEASE\\MEMBOARD\\"
//				+ "src\\main\\webapp\\resources\\fileUpload\\";

		// 상대경로(서버경로)
		String savePath =
		request.getServletContext().getRealPath("/resources/fileUpload/");
		
		
		
		if (!boFile.isEmpty()) {
			
			boFile.transferTo(new File(savePath + boFileName));
			board.setBoFileName(boFileName);
		}
		
		int result = bdao.bWrite(board);
		
//		System.out.println("[4] dao -> service\n board : "+board);
		
		if(result>0) {
			mav.setViewName("redirect:bList");
		} else {
			mav.setViewName("pages-boardWrite");
		}
		
		
		return mav;
	}

	// bList : 게시물 페이징 처리
	public ModelAndView bList(int page, int limit) {

//		System.out.println("[2] controller -> service\n page,limit :" + page + "," + limit);

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 한 화면에 보여줄 게시글 갯수
		// int limit = 5;

		// 전체 게시글 갯수 : 59
		int bCount = bdao.bCount();

//		System.out.println("bCount : "+bCount);
		
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

		List<BOARD> pagingList = bdao.bList(paging);

//		System.out.println("[4] dao -> service\n pagingList :" + pagingList);

		// model
		mav.addObject("pagingList", pagingList);
		mav.addObject("paging", paging);

		// view
		mav.setViewName("pages-board");

		return mav;
	}

	// bView : 게시물 보기
	public ModelAndView bView(int boNum) {
		
//		System.out.println("[2] controller -> service\n boNum :"+boNum);
		
		BOARD board = bdao.bView(boNum);
		
//		System.out.println("[4] dao -> service\n board :"+board);
		
		mav.addObject("view", board);
		mav.setViewName("pages-boardView");
		
		return mav;
	}
	
	// bModifyForm : 게시글 수정 페이지로 이동
	public ModelAndView bModifyForm(int boNum) {
//		System.out.println("[2] controller -> service\n boNum :"+boNum);
		
		BOARD board = bdao.bView(boNum);
		
//		System.out.println("[4] dao -> service\n board :"+board);
		
		mav.addObject("modify", board);
		mav.setViewName("pages-boardModify");
		
		return mav;
	}
	
	// bModify : 게시물 수정
	public ModelAndView bModify(BOARD board) throws IllegalStateException, IOException {
//		System.out.println("[2] controller -> service\n board : "+board);
		
		// [1] 파일업로드
		// - 파일 이름 생성
		// - (식별자 + 파일이름)
		// - profile폴더 생성 후 업로드
		
		if(!board.getBoFile().isEmpty()) {
			MultipartFile bofile = board.getBoFile();
			
			UUID uuid = UUID.randomUUID();
			
			String bofileName = uuid.toString().substring(0,8)
					+ "_" + bofile.getOriginalFilename();
			
			// 상대경로,(서버경로)
			String savePath = request.getServletContext().getRealPath("/resources/fileUpload/");
			
			if(!board.getBoPrefileName().isEmpty()) {
				// 기존 파일 삭제
				String deletePath = request.getServletContext().getRealPath("/resources/fileUpload/");
				
				File deleteFile = new File(deletePath+board.getBoPrefileName());
				
				if(deleteFile.exists()) {
					deleteFile.delete();
				} else {
					//System.out.println("기존 파일 삭제 실패");
				}
				
			}
			bofile.transferTo(new File(savePath + bofileName));
			board.setBoFileName(bofileName);
		} else {
			if(!board.getBoPrefileName().isEmpty()) {
				
				String bofileName = board.getBoPrefileName();
				
				// 상대경로,(서버경로)
				String savePath = request.getServletContext().getRealPath("/resources/fileUpload/");
				
				board.setBoFileName(bofileName);
			}
		}
		
		int result = bdao.bModify(board);
		
//		System.out.println("[4] dao -> service\n result : "+result);
		
		if(result>0) {
			mav.setViewName("pages-board");
		} else {
			mav.setViewName("pages-boardModify");
		}
		
		return mav;
	}
	
	// bDelete : 게시물 삭제
	public ModelAndView bDelete(int boNum) {
//		System.out.println("[2] controller -> service\n boNum : "+boNum);
		
		int result = bdao.bDelete(boNum);
		
//		System.out.println("[4] dao -> service\n result : "+result);
		
		if(result>0) {
			mav.setViewName("redirect:bList");
		} else {
			mav.setViewName("redirect:bView?boNum="+boNum);
		}
		
		return mav;
	}

	
}
