package com.spring.mta.dao;

import java.util.List;


import com.spring.mta.vo.fnoticeVO;


public interface fnoticeDao {

	public List<fnoticeVO> noticeList(fnoticeVO nvo);

	public fnoticeVO noticeDetail(fnoticeVO nvo);

	public int fnoticeInsert(fnoticeVO nvo);


}
