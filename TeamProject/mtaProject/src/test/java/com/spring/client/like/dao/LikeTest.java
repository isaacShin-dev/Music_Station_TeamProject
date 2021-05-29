package com.spring.client.like.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.cart.dao.CartTest;
import com.spring.mta.like.dao.LikeDao;
import com.spring.mta.like.vo.LikeCntVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LikeTest {
	
//	@Setter(onMethod_=@Autowired)
//	private CartDao cartDao ;
	
	
	@Setter(onMethod_=@Autowired)
	private LikeDao likeDao ; 
	
	
	@Test
	public void likecheckTest() {
		
		LikeCntVO lvo = new LikeCntVO();
		
		lvo.setM_no(79);
		lvo.setUser_id("test");
	//	lvo.setLikecnt(1);
		int result = likeDao.likeCheck(lvo);
		
		log.info(result);
	}

}
