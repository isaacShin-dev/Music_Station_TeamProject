package com.spring.mta.dao;

import com.spring.mta.vo.LikeCntVO;

public interface LikeDao {

	public int likeCheck(LikeCntVO lvo);
	
	public int likeAdd(LikeCntVO lvo);

}
