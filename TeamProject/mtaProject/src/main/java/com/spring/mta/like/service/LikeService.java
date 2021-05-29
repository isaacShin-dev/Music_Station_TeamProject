package com.spring.mta.like.service;

import com.spring.mta.like.vo.LikeCntVO;

public interface LikeService {

	public int likeCheck(LikeCntVO lvo);
	public int likeAdd(LikeCntVO lvo);
}
