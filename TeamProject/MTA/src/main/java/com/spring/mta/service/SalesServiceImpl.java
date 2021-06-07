package com.spring.mta.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.dao.SalesDao;
import com.spring.mta.vo.salesVO;

import lombok.Setter;

@Service
public class SalesServiceImpl implements SalesService{
	
	@Setter(onMethod_ =@Autowired )
	private SalesDao salesDao;

	@Override
	public List<salesVO> salesboard(salesVO svo) {
		List<salesVO> list = null;
		list = salesDao.salesboard(svo);
		return list;
	}

	@Override
	public int boardListCnt(salesVO svo) {
		// TODO Auto-generated method stub
		return salesDao.boardListCnt(svo);
	}
	
}
