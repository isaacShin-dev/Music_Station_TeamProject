package com.spring.client.cart.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mta.board.vo.MusicBoardVO;
import com.spring.mta.cart.dao.CartDao;
import com.spring.mta.cart.vo.CartVO;
import com.spring.mta.common.vo.PaymentDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartTest {

	@Setter(onMethod_=@Autowired)
	private CartDao cartDao ;
	

	
	
	@Test
	public void cartchcec() {
		
		int result = 0;
		CartVO cvo = new CartVO();

		cvo.setUser_id("test");
		cvo.setM_no(79);
		result = cartDao.cartListCheck(cvo);
		log.info(result);
		
	}
		
		
}
	

	

