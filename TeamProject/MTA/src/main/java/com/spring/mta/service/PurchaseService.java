package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.purchaseVO;

public interface PurchaseService {

	public List<purchaseVO> purchaseBoard(purchaseVO pvo);
	public int boardListCnt(purchaseVO pvo);

}
