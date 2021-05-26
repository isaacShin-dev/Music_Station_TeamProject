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



}
