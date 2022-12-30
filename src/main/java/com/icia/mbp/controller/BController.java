package com.icia.mbp.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.mbp.dto.BOARD;
import com.icia.mbp.service.BService;

@Controller
public class BController {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private BService bsvc;
	
	
	// pages-boardWrite : 게시글 작성 페이지로 이동
	@RequestMapping(value = "/pages-boardWrite", method = RequestMethod.GET)
	public String pages_boardWrite() {
		
		return "pages-boardWrite";
	}

	// bWrite : 게시글 작성
	@RequestMapping(value = "/bWrite", method = RequestMethod.POST)
	public ModelAndView bWrite(@ModelAttribute BOARD board) throws IllegalStateException, IOException {
//		System.out.println("[1] jsp -> controller\n board : "+board);
		
		mav = bsvc.bWrite(board);
		
//		System.out.println("[5] service -> controller\n board : "+mav);
		
		return mav;
	}
	
	// pages-board : 게시물 목록 페이지로 이동
	
	
	// bList : 게시물 페이징 처리
	@RequestMapping(value = "bList", method = RequestMethod.GET)
	public ModelAndView bList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {

//		System.out.println("[1] jsp -> controller \n page,limit : " + page + "," + limit);

		mav = bsvc.bList(page, limit);

//		System.out.println("[5] service -> controller\n mav : " + mav);

		return mav;
	}
	
	// bView : 게시물 보기
	@RequestMapping(value = "/bView", method = RequestMethod.GET)
	public ModelAndView bView(@RequestParam("boNum") int boNum) {
//		System.out.println("[1] jsp -> controller\n boNum : " + boNum);

		mav = bsvc.bView(boNum);

//		System.out.println("[5] service -> controller\n board : " + mav);

		return mav;
	}
	
	// bModifyForm : 게시물 수정 페이지로 이동
	@RequestMapping(value = "/bModifyForm", method = RequestMethod.GET)
	public ModelAndView bModifyForm(@RequestParam("boNum") int boNum) {
//		System.out.println("[1] jsp -> controller\n boNum : " + boNum);

		mav = bsvc.bModifyForm(boNum);

//		System.out.println("[5] service -> controller\n mav : " + mav);

		return mav;
	}
	
	// bModify : 게시물 수정
	@RequestMapping(value = "/bModify", method = RequestMethod.POST)
	public ModelAndView bModify(@ModelAttribute BOARD board) throws IllegalStateException, IOException {
//		System.out.println("[1] jsp -> controller\n board : "+board);
		
		mav = bsvc.bModify(board);
		
//		System.out.println("[5] service -> controller\n mav : "+mav);
		
		return mav;
	}
	
	// bDelete : 게시글 삭제
	@RequestMapping(value = "/bDelete", method = RequestMethod.GET)
	public ModelAndView bDelete(@RequestParam(value="boNum", required=true) int boNum) {
		
//		System.out.println("[1] jsp -> controller\n boNum : "+boNum);
		
		mav = bsvc.bDelete(boNum);
		
//		System.out.println("[5] service -> controller\n mav : "+mav);
		
		return mav;
	}
	
	
	
	
}
