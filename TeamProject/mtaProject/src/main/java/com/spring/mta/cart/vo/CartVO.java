package com.spring.mta.cart.vo;

import com.spring.mta.common.vo.PaymentDTO;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class CartVO extends PaymentDTO {

	
	private String cart_id ="";
	private String user_id="";
	private int m_no = 0;
	private String m_name ="";
	private String m_title = "" ;
	private String m_price = "";
	private String m_coverimage ="";
	
	
}