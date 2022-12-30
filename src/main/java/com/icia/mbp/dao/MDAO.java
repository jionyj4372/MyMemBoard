package com.icia.mbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.mbp.dto.MEMBER;
import com.icia.mbp.dto.PAGE;
import com.icia.mbp.dto.SEARCH;

@Repository
public class MDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	// mJoin : 회원 가입
	public int mJoin(MEMBER member) {
//		System.out.println("[3] service->dao\n member : "+member);
		
		return sql.insert("Member.mJoin", member);
	}
	
	// mLogin : 로그인
	public MEMBER mLogin(MEMBER member) {
//		System.out.println("[3] service -> dao\n member : " + member);

		return sql.selectOne("Member.mLogin", member);
	}
	
	// mCount : 회원 수 반환
	public int mCount() {
		return sql.selectOne("Member.mCount");
	}
	
	// mList : 회원 목록보기(관리자 계정)
	public List<MEMBER> mList(PAGE paging) {
//		System.out.println("[3] service -> dao\n paging : "+paging);
		
		return sql.selectList("Member.mList", paging);
	}
	
	// mView : 회원 상세보기(관리자 계정)
	public MEMBER mView(String memId) {
//		System.out.println("[3] service -> dao\n memId : "+memId);
		
		return sql.selectOne("Member.mView", memId);
	}
	
	// idCheck : 아이디 중복 체크
	public String idCheck(String memId) {
//		System.out.println("[3] service -> dao\n memId : "+memId);
		
		return sql.selectOne("Member.idCheck", memId);
	}
	
	// mSearch : 회원 검색
	public List<MEMBER> mSearch(SEARCH search) {
		
		return sql.selectList("Member.mSearch", search);
	}
	
	// mModify : 회원 정보 수정
	public int mModify(MEMBER member) {
		System.out.println("[3] service -> dao\n member : "+member);
		
		return sql.update("Member.mModify", member);
	}
	
	// mDelete : 회원 삭제
	public int mDelete(String memId) {
		
		return sql.delete("Member.mDelete", memId);
	}
	
	

	
	
	
}
