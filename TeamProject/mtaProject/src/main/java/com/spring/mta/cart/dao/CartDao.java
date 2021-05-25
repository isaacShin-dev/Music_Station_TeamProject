package com.spring.mta.cart.dao;


import java.util.List;

import com.spring.mta.cart.vo.CartVO;

public interface CartDao {

		public int addCart(CartVO cvo);

		public List<CartVO> cartList(CartVO cvo);
	
}
