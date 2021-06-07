package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.NewsVO;


public interface NewsDao {
	public List<NewsVO> listnews(NewsVO nvo);
	public NewsVO detailnews(NewsVO nvo);
	public int insertnews(NewsVO nvo);
	public int newsListCnt(NewsVO nvo);
	public int updatenews(NewsVO nvo);
	public int deletenews(int n_no);
	public int newsUpdate(NewsVO nvo);
	public int replyCnt(int n_no);
	public int newsDelete(int n_no);
	
	

}
