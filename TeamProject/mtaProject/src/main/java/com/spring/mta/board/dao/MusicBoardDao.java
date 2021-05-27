package com.spring.mta.board.dao;

import java.util.List;
import com.spring.mta.board.vo.MusicBoardVO;

public interface MusicBoardDao {

	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	public int musicBoardInsert(MusicBoardVO bvo);
	
	public MusicBoardVO boardDetail(MusicBoardVO mvo);

	public int recommend(MusicBoardVO mvo);
	
}
