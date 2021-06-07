package com.spring.mta.vo;

import org.springframework.web.multipart.MultipartFile;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MusicBoardVO extends commonVO{
	private int m_no=0;			//음악게시판 글 번호
	private String m_title="";	//음악게시판 글 제목
	private String m_name="";	//음악제목
	private String m_bpm="";	//음악 게시판 bpm
	private String m_explan="";	//음악 게시판 음악설명
	private String m_regdate;	//음악 게시판 등록일
	private String m_price="";	//음악 판매 가격
	private String m_genre = "";//음악 장르
	private int    m_isfree=0;	//무표배포 여부
	private int m_stock = 1; 	//재고
	
	private int m_recommentcnt;//음악 게시판 추천수
	private int m_views  = 0;	// 음악 게시판 조회수
	private int m_replyCnt = 0;	// 음악 게시판 댓글개수
	
	private String user_id	="";// 유저아이디
	
	
	private String m_coverimage="";	// 음악 커버이미지 경로
	private MultipartFile cover_file; // 커버이미지
	
	private String m_file="";		// 음악 파일 경로
	private MultipartFile file;		// 음악 파일
}
