package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.serviceVO;

public interface serviceDao {

	public List<serviceVO> serviceboardList(serviceVO sbvo);

	public int serviceboardListCnt(serviceVO sbvo);

	public int serviceboardInsert(serviceVO sbvo);

	public int serviceboardDelete(int num);

	public serviceVO serviceboardDetail(serviceVO sbvo);

	public int serviceboardUpdate(serviceVO sbvo);


	

	
}
