package com.spring.mta.board.service;

import java.util.List;


import com.spring.mta.board.vo.MusicBoardVO;



public interface MusicBoardService {



	  
	  
	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);
	public int musicBoardInsert(MusicBoardVO mvo) throws Exception; 
	public MusicBoardVO boardDetail(MusicBoardVO mvo);
	public int replyCnt(int m_no) ;
	public int recommend(MusicBoardVO mvo);
	public List<MusicBoardVO> musicRecentList(MusicBoardVO mvo);
	
	
	

}