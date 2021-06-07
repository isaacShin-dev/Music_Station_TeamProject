package com.spring.mta.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.dao.ReplyDao;

import com.spring.mta.vo.ReplyVO;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_=@Autowired)
	public ReplyDao replyDao;
	

	
	public List<ReplyVO> replyList(Integer n_no) {
		List<ReplyVO> list = null;
		list= replyDao.replyList(n_no);
		return list;
	}
	

	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyInsert(rvo);
		return result;
	}
	
	
	@Override
	public ReplyVO replySelect(Integer nc_no) {
		ReplyVO rvo = null;
		rvo = replyDao.replySelect(nc_no);
		return rvo;
	}
	
	
	
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = 0;
		result = replyDao.ReplyUpdate(rvo);
		return result;
	}
	

	
	public int replyDelete(Integer nc_no) {
		int result = 0;
		result = replyDao.replyDelete(nc_no);
		return result;
	}
	
}
