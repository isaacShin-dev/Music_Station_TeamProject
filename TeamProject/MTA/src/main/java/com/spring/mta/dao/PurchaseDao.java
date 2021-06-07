package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.purchaseVO;

public interface PurchaseDao {

	public List<purchaseVO> purchaseList(purchaseVO pvo);

	public int boardListCnt(purchaseVO pvo);



}
