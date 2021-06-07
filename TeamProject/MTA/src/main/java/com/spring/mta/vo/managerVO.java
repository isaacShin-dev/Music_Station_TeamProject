package com.spring.mta.vo;

import lombok.Data;

@Data
public class managerVO {
	private String mg_id="";		// 관리자 아이디
	private String mg_passwd="";	// 관리자 비밀번호
	private String mg_regdate;		// 관리자 정보 등록일
	private String mg_email="";		// 관리자 이메일
	private String mg_phone="";		// 관리자 전화번호
}
