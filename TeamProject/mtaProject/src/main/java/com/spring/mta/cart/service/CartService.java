package com.spring.mta.cart.service;



import java.util.List;

import com.spring.mta.cart.vo.CartVO;


public interface CartService {

	public int addCart(CartVO cvo);

	public List<CartVO> CartList(CartVO cvo);

	public int deleteCart(CartVO cvo);

	public CartVO checkOut(CartVO cvo);

	public int cartCheckOut(CartVO cvo);

	public int CartListCheck(CartVO cvo);

}
