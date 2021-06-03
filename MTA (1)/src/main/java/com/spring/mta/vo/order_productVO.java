package com.spring.mta.vo;

import lombok.Data;

@Data
public class order_productVO {
	private int op_no=0;	// 결제 상세 번호
	private String m_title="";	// 음악 글 이름
	private int m_no=0;		// 음악 글 번호
	private int p_no=0;		// 결제 번호
}
