package com.spring.mta.reply.service;

import java.util.List;

import com.spring.mta.reply.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(Integer m_no);
	
	public int replyInsert(ReplyVO rvo);
}
