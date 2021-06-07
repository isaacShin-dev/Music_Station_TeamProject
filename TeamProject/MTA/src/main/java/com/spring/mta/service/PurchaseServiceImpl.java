package com.spring.mta.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.dao.PurchaseDao;
import com.spring.mta.vo.purchaseVO;

import lombok.Setter;

@Service
public class PurchaseServiceImpl implements PurchaseService{

	@Setter(onMethod_ =@Autowired )
	private PurchaseDao purchaseDao;

	@Override
	public List<purchaseVO> purchaseBoard(purchaseVO pvo) {
		// TODO Auto-generated method stub
		List<purchaseVO> list = null;
		list = purchaseDao.purchaseList(pvo);
		return list;
	}

	@Override
	public int boardListCnt(purchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDao.boardListCnt(pvo);
	}
	
	
	
}
