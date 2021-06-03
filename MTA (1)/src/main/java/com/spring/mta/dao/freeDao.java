package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.freeBoardVO;

public interface freeDao {

	public List<freeBoardVO> freeboardList(freeBoardVO fvo);
	public int boardListCnt(freeBoardVO fvo);
	public freeBoardVO freeboardDetail(freeBoardVO bvo);
	public int freeboardInsert(freeBoardVO bvo);
	public int freeboardDelete(int num);
	public int freeboardUpdate(freeBoardVO bvo);
	public void freeboardUpdateViews(int f_no);
	public int freeRecomment(int num);
		

}
