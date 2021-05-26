package com.spring.mta.cart.vo;

import lombok.Data;


@Data
public class CartVO {

	
	private String cart_id ="";
	private String user_id="";
	private int m_no = 0;
	private String m_name ="";
	private String m_title = "" ;
	private String m_price = "";
	private String m_coverimage ="";
	
	private int totalPrice = 0; 
	
}