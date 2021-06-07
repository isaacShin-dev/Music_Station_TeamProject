package com.spring.mta.vo;

import lombok.Data;

@Data
public class paymentVO {
	private int p_no = 0;	// 결제 번호
	private String user_id=""; // 유저 아이디
	private String p_date ;		// 결제 일시
	private String p_t_price="";	// 결제총합
}
