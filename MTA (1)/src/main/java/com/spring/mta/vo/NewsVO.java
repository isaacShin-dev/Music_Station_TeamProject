package com.spring.mta.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NewsVO extends commonVO{
		private int n_no=0;
	  
	    private String n_text="";
	    private String n_regdate;
	    private String n_title="";
	    private String n_note="";
	    private String user_id="";
	    
	    
	    private String n_image="";	// 파일 경로
	    private MultipartFile file; //파일 자체
	    private String n_thumb 	=""; //실제 서버에서 저장할 썸네일 이미지 파일용 
	
	
}
