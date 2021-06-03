package com.spring.mta.dao;

import java.util.List;


import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.UserVO;

public interface MusicBoardDao {

	public List<MusicBoardVO> musicChart(MusicBoardVO mbvo);

	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	public int musicBoardInsert(MusicBoardVO bvo);

	public MusicBoardVO boardDetail(MusicBoardVO mvo);

	public int recommend(MusicBoardVO mvo);

	public int pwdConfirm(UserVO uvo);

	public int musicboardDelete(int num);

	public int boardListCnt(MusicBoardVO mvo);

	public List<MusicBoardVO> musicRecentList(MusicBoardVO mvo);

}
