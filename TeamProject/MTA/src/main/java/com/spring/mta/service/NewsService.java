package com.spring.mta.service;

import java.util.List;



import com.spring.mta.vo.NewsVO;






public interface NewsService {
	public List<NewsVO> listnews(NewsVO vo);
	public NewsVO detailnews(NewsVO nvo);
	public int insertnews(NewsVO nvo) throws Exception;
	public int newsListCnt(NewsVO nvo);
	public NewsVO updatenews(NewsVO nvo);
	public int deletenews(int n_no);
	public int newsUpdate(NewsVO nvo) throws Exception;
	public int replyCnt(int n_no);
	
}
