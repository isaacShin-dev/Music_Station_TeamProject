package com.spring.mta.board.dao;

import java.util.List;
import com.spring.mta.board.vo.MusicBoardVO;

public interface MusicBoardDao {

	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	public int musicBoardInsert(MusicBoardVO bvo);
	
	public MusicBoardVO boardDetail(MusicBoardVO mvo);

	public int recommend(MusicBoardVO mvo);

	public List<MusicBoardVO> musicRecentList(MusicBoardVO mvo);
	
	public int boardListCnt(MusicBoardVO mvo);

	public int mBoardUpdate(MusicBoardVO mvo);
	
}
