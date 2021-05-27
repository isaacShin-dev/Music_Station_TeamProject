package com.spring.mta.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.reply.dao.ReplyDao;
import com.spring.mta.reply.vo.ReplyVO;

import lombok.Setter;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao ; 
	

	@Override
	public List<ReplyVO> replyList(Integer m_no) {
			List<ReplyVO> list  = null ;
			list = replyDao.replyList(m_no);
		
		return list;
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0; 
		result = replyDao.replyInsert(rvo);
		
		
		return result ;
	}


	

}
