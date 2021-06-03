package com.spring.mta.service;

import com.spring.mta.vo.LikeCntVO;

public interface LikeService {

	public int likeCheck(LikeCntVO lvo);
	public int likeAdd(LikeCntVO lvo);
}
