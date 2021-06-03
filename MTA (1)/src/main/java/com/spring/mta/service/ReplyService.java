package com.spring.mta.service;

import java.util.List;


import com.spring.mta.vo.ReplyVO;



public interface ReplyService {
	public  List<ReplyVO> replyList(Integer n_no);
	public int replyInsert(ReplyVO rvo);
	public ReplyVO replySelect(Integer nc_no);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(Integer nc_no);
	
	
	
	
	

}
