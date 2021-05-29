package com.spring.mta.like.dao;

import com.spring.mta.like.vo.LikeCntVO;

public interface LikeDao {

	public int likeCheck(LikeCntVO lvo);
	
	public int likeAdd(LikeCntVO lvo);

}
