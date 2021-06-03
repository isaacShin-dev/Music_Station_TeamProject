package com.spring.mta.vo;

import lombok.Data;

@Data
public class fnoticeVO {
	private int fn_no = 0;		//공지번호
	private String fn_title =""; 	//공지 타이틀
	private String fn_text = "";	//공지 내용
	private String fn_regdate;		//공지 등록일
	private String mg_id;			//매니저 아이디
	
}
