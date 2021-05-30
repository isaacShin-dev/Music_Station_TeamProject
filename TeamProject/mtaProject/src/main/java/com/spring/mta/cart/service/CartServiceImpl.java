package com.spring.mta.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.cart.dao.CartDao;
import com.spring.mta.cart.vo.CartVO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	@Setter(onMethod_=@Autowired)
	private CartDao cartDao ;
	
	@Override
	public int addCart(CartVO cvo) {
		
		int result =0;
		
		
		result = cartDao.addCart(cvo);
		return result;
	}

	@Override
	public List<CartVO> CartList(CartVO cvo) {
		List<CartVO> list = null; 
		list = cartDao.cartList(cvo);
		return list;
	}

	@Override
	public int deleteCart(CartVO cvo) {
		int result  =0;
		result = cartDao.deleteCart(cvo);
		
		return result;
	}

	@Override
	public CartVO checkOut(CartVO cvo) {
		
		CartVO list = null ; 
		
		list = cartDao.checkList(cvo);
		
		
		
		return list;
	}

	@Override
	public int cartCheckOut(CartVO cvo) {
		int result = 0;
		result = cartDao.cartCheckOut(cvo);
		return result ;
	}

	@Override
	public int CartListCheck(CartVO cvo) {
		int result =0;
		
		result = cartDao.cartListCheck(cvo);
		return result;
	}

	



}
