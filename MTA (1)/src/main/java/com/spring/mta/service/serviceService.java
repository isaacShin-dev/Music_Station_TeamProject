package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.serviceVO;

public interface serviceService {


	public List<serviceVO> serviceboardList(serviceVO sbvo);
	public int serviceboardListCnt(serviceVO sbvo);
	public int serviceboardInsert(serviceVO sbvo);
	public int serviceboardDelete(int scb_no);
	public serviceVO serviceboardDetail(serviceVO sbvo);
	
	public serviceVO serviceUpdateForm(serviceVO sbvo);
	public int serviceboardUpdate(serviceVO sbvo);
	
	


}
