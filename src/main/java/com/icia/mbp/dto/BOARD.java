package com.icia.mbp.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BOARD {
	
	// 필드
	private int boNum; 			// 게시글 번호
	private String boWriter; 	// 게시글 작성자
	private String boTitle; 	// 게시글 제목
	private String boContent; 	// 게시글 내용
	private Date boDate; 		// 게시글 작성일
	private int boHit; 			// 게시글 조회수

	private String boPrefileName;	// 수정 시 이전 사진명
	
	private MultipartFile boFile;	// 업로드 파일
	private String boFileName; 		// 파일이름
	// DB에 저장되는 값은 파일의 이름만 들어감
	
}
