package com.icia.mbp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.mbp.dto.COMMENT;
import com.icia.mbp.service.CService;


@Controller
@RequestMapping("/comment")
public class CController {
	
	@Autowired
	private CService csvc;
	
	
	// cList : 댓글 불러오기
	@RequestMapping(value = "/commentList", method = RequestMethod.GET)
	public @ResponseBody List<COMMENT> cList(@RequestParam("cbNum") int cbNum) {
		
//		System.out.println("[1] jsp->controller\n cbNum : "+cbNum);
		
		List<COMMENT> commentList = csvc.cList(cbNum);
		
//		System.out.println("[5] service->controller\n commentList : "+commentList);
		
		return commentList;
	}
	
	// cmtWrite : 댓글 작성
	@RequestMapping(value = "/cmtWrite", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtWrite(@ModelAttribute COMMENT comment) {
		
//		System.out.println("[1] jsp->controller\n comment : "+comment);
		
		List<COMMENT> commentList = csvc.cmtWrite(comment);
		
//		System.out.println("[5] service->controller\n commentList : "+commentList);
		
		return commentList;
	}
	
	// cmtDelete : 댓글 삭제
	@RequestMapping(value = "/cmtDelete", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtDelete(@ModelAttribute COMMENT comment) {
		
//		System.out.println("[1] jsp->controller\n comment : "+comment);
		
		List<COMMENT> commentList = csvc.cmtDelete(comment);
		
//		System.out.println("[5] service->controller\n commentList : "+commentList);
		
		return commentList;
	}
	
	// cmtModify : 댓글 수정
	@RequestMapping(value = "/cmtModify", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtModify(@ModelAttribute COMMENT comment) {
		
//		System.out.println("[1] jsp->controller\n comment : "+comment);
		
		List<COMMENT> commentList = csvc.cmtModify(comment);
		
//		System.out.println("[5] service->controller\n commentList : "+commentList);
		
		return commentList;
	}
	
	
	
	
	
	
}
