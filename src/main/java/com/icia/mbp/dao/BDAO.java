package com.icia.mbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.mbp.dto.BOARD;
import com.icia.mbp.dto.PAGE;

@Repository
public class BDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	// bWrite: 게시물 작성
	public int bWrite(BOARD board) {
//		System.out.println("[3] service -> dao\n board : "+board);
		
		return sql.insert("Board.bWrite", board);
	}

	// bCount : 게시물 갯수
	public int bCount() {
		
		return sql.selectOne("Board.bCount");
	}
	
	// bList : 게시물 페이징 처리
	public List<BOARD> bList(PAGE paging) {
//		System.out.println("[3] service -> dao\n paging : "+paging);
		
		return sql.selectList("Board.bList", paging);
	}
	
	// bView : 게시물 상세보기
	public BOARD bView(int boNum) {
//		System.out.println("[3] service -> dao\n boNum : "+boNum);
		
		sql.update("Board.boHit", boNum);
		
		return sql.selectOne("Board.bView", boNum);
	}
	
	// bModify : 게시물 수정
	public int bModify(BOARD board) {
		System.out.println("[3] service -> dao\n board : "+board);
		
		return sql.update("Board.bModify", board);
	}
	
	// bDelete : 게시물 삭제
	public int bDelete(int boNum) {
//		System.out.println("[3] service -> dao\n boNum : "+boNum);
		
		return sql.delete("Board.bDelete", boNum);
	}
	
	
	
	
	
	
	
}
