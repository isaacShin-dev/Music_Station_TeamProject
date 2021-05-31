package com.spring.client.reply;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.like.dao.LikeTest;
import com.spring.mta.like.dao.LikeDao;
import com.spring.mta.like.vo.LikeCntVO;
import com.spring.mta.reply.dao.ReplyDao;
import com.spring.mta.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyTest {

	
	
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao ; 
	
	
	@Test
	public void likecheckTest() {
		
		ReplyVO rvo = new ReplyVO()	;
		
		
		
		
	//	lvo.setLikecnt(1);
		log.info(result);
	}
}
