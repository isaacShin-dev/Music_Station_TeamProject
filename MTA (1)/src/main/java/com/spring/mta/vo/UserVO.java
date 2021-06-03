package com.spring.mta.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO {
	private String user_id = "";
	private String user_name = "";
	private String user_passwd = "";
	private String user_phone = "";
	private String user_email = "";
	
	private String user_favorite = "";
	
	private String user_regdate;
	
	private String profile_image = "";
	private MultipartFile profile_file; 
}
