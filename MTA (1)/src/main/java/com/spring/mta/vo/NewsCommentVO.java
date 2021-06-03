package com.spring.mta.vo;

import lombok.Data;

@Data
public class NewsCommentVO {
	private int n_no=0;		// 뉴스 글 번호
	private int nc_no=0;	// 뉴스 댓글 번호
	private String nc_text="";		// 뉴스 댓글 내용
	private String user_id="";		// 유저 아이디
	private String nc_regdate;		// 뉴스 댓글 등록일
	
}
