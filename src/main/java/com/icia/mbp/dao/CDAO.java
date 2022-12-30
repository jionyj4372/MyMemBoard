package com.icia.mbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.mbp.dto.COMMENT;

@Repository
public class CDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// cList : 댓글 불러오기
	public List<COMMENT> cList(int cbNum) {
//		System.out.println("[3] service->dao\n cbNum : "+cbNum);
		
		return sql.selectList("Comment.cList", cbNum);
	}
	
	// cmtWrite : 댓글 작성
	public int cmtWrite(COMMENT comment) {
//		System.out.println("[3] service->dao\n comment : "+comment);
		
		return sql.insert("Comment.cmtWrite", comment);
	}
	
	// cmtDelete : 댓글 삭제
	public int cmtDelete(COMMENT comment) {
		
		return sql.delete("Comment.cmtDelete", comment);
	}
	
	// cmtModify : 댓글 수정
	public int cmtModify(COMMENT comment) {
		
		return sql.update("Comment.cmtModify", comment);
	}
	
	
	
	
	
}
