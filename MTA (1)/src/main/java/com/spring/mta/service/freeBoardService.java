package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.freeBoardVO;



public interface freeBoardService {
	public List<freeBoardVO> freeboardList(freeBoardVO fvo);
	public int boardListCnt(freeBoardVO fvo);
	public freeBoardVO freeboardDetail(freeBoardVO bvo);
	public int freeboardInsert(freeBoardVO bvo) throws Exception;
	public int freeboardDelete(int f_no);
	public freeBoardVO freeupdateForm(freeBoardVO bvo);
	public int freeboardUpdate (freeBoardVO bvo) throws Exception;
	
	public int freeRecomment(int num);
	
	
	


	
}
