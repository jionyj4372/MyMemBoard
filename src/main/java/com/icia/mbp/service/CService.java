package com.icia.mbp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.mbp.dao.CDAO;
import com.icia.mbp.dto.COMMENT;

@Service
public class CService {
	
	@Autowired
	private CDAO cdao;
	
	
	// cList : 댓글 불러오기
	public List<COMMENT> cList(int cbNum) {
		
//		System.out.println("[2] controller->service\n cbNum : "+cbNum);
		
		List<COMMENT> commentList = cdao.cList(cbNum);
		
//		System.out.println("[4] dao->service\n commentList : "+commentList);
		
		return commentList;
	}
	
	// cmtWrite : 댓글 작성
	public List<COMMENT> cmtWrite(COMMENT comment) {
//		System.out.println("[2] jsp->controller\n comment : "+comment);
		
		List<COMMENT> commentList;
		
		int result = cdao.cmtWrite(comment);
		
		if(result>0) {
			commentList = cdao.cList(comment.getCbNum());
		} else {
			commentList = null;
		}
		
		return commentList;
	}
	
	// cmtDelete : 댓글 삭제
	public List<COMMENT> cmtDelete(COMMENT comment) {
//		System.out.println("[2] jsp->controller\n comment : "+comment);
		
		List<COMMENT> commentList;
		
		int result = cdao.cmtDelete(comment);
		
		if(result>0) {
			commentList = cdao.cList(comment.getCbNum());
		} else {
			commentList = null;
		}
		
		return commentList;
	}
	
	// cmtModify : 댓글 수정
	public List<COMMENT> cmtModify(COMMENT comment) {
//		System.out.println("[2] jsp->controller\n comment : "+comment);
		
		List<COMMENT> commentList;
		
		int result = cdao.cmtModify(comment);
		
		if(result>0) {
			commentList = cdao.cList(comment.getCbNum());
		} else {
			commentList = null;
		}
		
		return commentList;
	}

}
