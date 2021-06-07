package com.spring.mta.vo;

import lombok.Data;

@Data
public class mcommentVO {
	private int mc_no = 0; // 음악 댓글 번호
	private int m_no = 0; // 음악 글 번호
	private String mc_text = "";	// 댓글 내용
	private String mc_regdate;		// 댓글 등록일
	private String user_id;			// 사용자 아이디
	
}
