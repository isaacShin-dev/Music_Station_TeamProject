package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.fnoticeVO;

public interface fnoticeService {

	public List<fnoticeVO> noticeList(fnoticeVO nvo);

	public fnoticeVO noticeDetail(fnoticeVO nvo);

	public int fnoticeInsert(fnoticeVO nvo);

}
