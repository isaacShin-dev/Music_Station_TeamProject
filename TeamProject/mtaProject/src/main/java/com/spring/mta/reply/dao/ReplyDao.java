package com.spring.mta.reply.dao;

import java.util.List;

import com.spring.mta.reply.vo.ReplyVO;

public interface ReplyDao {
	
	
	public List<ReplyVO> replyList(Integer m_no);
	public int replyInsert(ReplyVO rvo);
	public int replyCnt(int m_no);
	

}
