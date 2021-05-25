package com.spring.mta.board.dao;

import java.util.List;
import com.spring.mta.board.vo.MusicBoardVO;

public interface MusicBoardDao {

	List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	int musicBoardInsert(MusicBoardVO bvo);
	
	public MusicBoardVO boardDetail(MusicBoardVO mvo);
	
}
