package com.spring.client.cart.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.spring.mta.cart.dao.CartDao;
import com.spring.mta.cart.vo.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartTest {

	@Setter(onMethod_=@Autowired)
	private CartDao cartDao ;
	
//	@Test
//	public void cartInsertTest() {
//		log.info("addCart 호출 성공 ");
//		CartVO cvo = new CartVO();
//		
//		cvo.setUser_id("test");
//		cvo.setM_no(56);
//		
//		int result = cartDao.addCart(cvo);
//		
//		log.info("resutl : "+result);
//		
//	}
	@Test
	public void cartList() {
		log.info("cartList !!!!!!!!!");
		
		CartVO cvo = new CartVO();
		cvo.setUser_id("test");
		List<CartVO> list = cartDao.cartList(cvo);
		
		for(CartVO vo : list) {
			log.info(vo);
		}
	}
}
