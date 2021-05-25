package com.spring.client.board.vo;

import com.spring.client.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*
 *@EqualsAndHashCode(callSuper = false)
 ******************************************************************************
 * eqauls 와 hashcode 메소드 자동 생성 시, 부모 클래스와 필드까지 감안할지 말지에 대해서 설정시
 * CallSuper = true  -> 부모 클래스 필드 값들도 동일 한지 체크,
 * CallSuper = false -> (기본값) 자신의 필드 값들만 고려한다.
 ******************************************************************************* */


@Data
@EqualsAndHashCode(callSuper = false)
public class BoardVO extends CommonVO {
	private int  b_num = 0; 		//글번호
	private String b_name = ""; 	//작성자
	private String b_title = ""; 	//제목
	private String b_content = ""; 	//내용
	private String b_date = ""; 	//작성일
	private String b_pwd = ""; 		//비밀번호
	
	private int r_cnt =0; //댓글 번호
}
