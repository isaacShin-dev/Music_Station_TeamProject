package com.spring.mta.dao;


import java.util.List;

import com.spring.mta.vo.CartVO;



public interface CartDao {

		public int addCart(CartVO cvo);

		public List<CartVO> cartList(CartVO cvo);
		
		public int deleteCart(CartVO cvo);

		public CartVO checkList(CartVO cvo);

		public int cartCheckOut(CartVO cvo);

		public int cartListCheck(CartVO cvo);


}
