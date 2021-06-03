package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.UserVO;

public interface MusicBoardService {

	public List<MusicBoardVO> musicChart(MusicBoardVO mbvo);
	
	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	public int musicBoardInsert(MusicBoardVO bvo) throws Exception;

	public MusicBoardVO boardDetail(MusicBoardVO mvo);

	public int recommend(MusicBoardVO mvo);

	public int replyCnt(int m_no);

	public int pwdConfirm(UserVO uvo);

	public int musicboardDelete(int m_no);

	public int boardListCnt(MusicBoardVO mvo);

	public List<MusicBoardVO> musicRecentList(MusicBoardVO mvo);

	

	

}
