package com.spring.mta.reply.service;

import java.util.List;

import com.spring.mta.reply.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(Integer m_no);
	
	public int replyInsert(ReplyVO rvo);

	public int replyDelete(int r_num);


	public ReplyVO replySelect(Integer r_num);

	public int pwdConfirm(ReplyVO rvo);

	public int replyUpdate(ReplyVO rvo);
}
