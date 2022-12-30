package com.icia.mbp.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MEMBER {
	
	// 필드
	private String memId;		// 회원 id
	private String memPw;		// 회원 pw
	private String memName;		// 회원 이름
	private Date memBirth;		// 회원 생년월일
	private String memGender;	// 회원 성별
	private String memEmail;	// 회원 이메일
	private String memPhone;	// 회원 연락처
	private String memAddr;		// 회원 주소
	
	private String memPreProfileName;	// 수정 시 이전 사진명
	
	private MultipartFile memProfile;	// 회원 프로필 사진
	private String memProfileName;		// 회원 프로필 사진명
	
	private String addr1;		// 우편번호
	private String addr2;		// 주소
	private String addr3;		// 상세주소
}
