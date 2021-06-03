package com.spring.mta.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class fcommentVO {
	private int fc_no = 0;	//자게_덧글번호
	private String fc_text = ""; // 자게_덧글내용
	private String fc_regdate = ""; // 자게 덧글등록일
	
	
	private String user_id = ""; //유저아이디
	private int f_no ;			//자유게시판 번호
	
}
