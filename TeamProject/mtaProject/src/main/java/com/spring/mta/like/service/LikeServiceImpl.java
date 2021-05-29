package com.spring.mta.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.like.dao.LikeDao;
import com.spring.mta.like.vo.LikeCntVO;

import lombok.Setter;

@Service
public class LikeServiceImpl implements LikeService {

	
	
	@Setter(onMethod_=@Autowired)
	private LikeDao likeDao ;
	
	@Override
	public int likeCheck(LikeCntVO lvo) {
		int result =0;
		
		result = likeDao.likeCheck(lvo);
		
		
		return result;
	}

	@Override
	public int likeAdd(LikeCntVO lvo) {
		int result =0;
		
		result = likeDao.likeAdd(lvo);
		return result;
	}

}
