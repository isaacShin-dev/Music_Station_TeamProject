package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.salesVO;

public interface SalesDao {

	public List<salesVO> salesboard(salesVO svo);
	public int boardListCnt(salesVO svo);

}
