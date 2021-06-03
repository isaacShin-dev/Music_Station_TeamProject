package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.fcommentVO;


public interface fcommentDao {

	public List<fcommentVO> fcommentList(fcommentVO fco);
	public int fcommentInsert(fcommentVO fco);
	public int fcommentDelete(int num);

}
