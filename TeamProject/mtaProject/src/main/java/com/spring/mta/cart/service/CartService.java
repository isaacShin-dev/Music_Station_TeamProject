package com.spring.mta.cart.service;



import java.util.List;

import com.spring.mta.cart.vo.CartVO;


public interface CartService {

	int addCart(CartVO cvo);

	List<CartVO> CartList(CartVO cvo);

	int deleteCart(CartVO cvo);

	CartVO checkOut(CartVO cvo);

	int cartCheckOut(CartVO cvo);

}
