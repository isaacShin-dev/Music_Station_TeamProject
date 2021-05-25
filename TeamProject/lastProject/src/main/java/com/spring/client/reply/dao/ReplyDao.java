package com.spring.client.reply.dao;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyDao {

	public List<ReplyVO> replyList(Integer b_num);
	public int replyInsert(ReplyVO rvo);
}
