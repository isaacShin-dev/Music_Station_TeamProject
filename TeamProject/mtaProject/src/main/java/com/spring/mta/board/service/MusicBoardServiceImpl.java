package com.spring.mta.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.board.dao.MusicBoardDao;
import com.spring.mta.board.vo.MusicBoardVO;

import lombok.Setter;

@Service
public class MusicBoardServiceImpl implements MusicBoardService {
	
	
	
	@Setter(onMethod_ = @Autowired)
	private MusicBoardDao musicBoardDao;

	
	@Override
	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo) {
		List<MusicBoardVO> list = null;
		list = musicBoardDao.musicBoardList(mvo);
		return list;
	}
}
