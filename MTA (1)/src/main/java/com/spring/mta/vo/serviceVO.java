package com.spring.mta.vo;

import lombok.Data;

@Data
public class serviceVO extends commonVO {
	private int scb_no = 0;	// 문의 글 번호
	private String scb_title=""; // 문의 글 제목
	private String scb_text="";	// 문의 글 내용
	private String scb_regdate;	// 문의 등록일
	private int scb_replyCnt = 0; // 문의 답글 수
	private String user_id;		//유저 아이디
}