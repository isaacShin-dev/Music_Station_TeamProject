package com.spring.mta.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.mta.vo.freeBoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class freeBoardVO extends commonVO{
	private int		f_no		=0; //글번호
	private String	f_title		="";//글제목
	private String 	f_text		="";//글내용
	private String f_regdate;		//글등록일
	
	private int	f_recommentCnt   	=0;//추천수
	private int f_replyCnt 			=0;//댓글수
	private int f_viewsCnt 			=0;//글조회수
	
	private String user_id = "";	//유저아이디
	
	private	MultipartFile file;//글 첨부파일
	private String f_file =""; 		//파일 이름
}
