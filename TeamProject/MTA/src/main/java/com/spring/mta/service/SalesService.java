package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.salesVO;

public interface SalesService {

	public List<salesVO> salesboard(salesVO svo);
	public int boardListCnt(salesVO svo);

}
