package com.spring.client.reply.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	
	@Setter(onMethod_ =@Autowired)
	private ReplyDao replyDao ; 
	
	/*
	 * @Test public void testReplyInsert() { log.info("replyInsert È£Ãâ");
	 * 
	 * ReplyVO rvo = new ReplyVO();
	 * 
	 * rvo.setB_num(1); rvo.setR_name("±è±è±è"); rvo.setR_content("query Test reply");
	 * rvo.setR_pwd("1234");
	 * 
	 * int result = replyDao.replyInsert(rvo);
	 * 
	 * log.info("insert °á°ú : "+result); }
	 */
	
	
	
	@Test 
	public void testReplyList() { 

		log.info("replyList ¸Þ¼­µå È£Ãâ");

		ReplyVO rvo = new ReplyVO();

		rvo.setB_num(1);

		List<ReplyVO> list = replyDao.replyList(rvo.getB_num());

		for(ReplyVO vo : list) { log.info(vo);
		}

	}
	 
}
