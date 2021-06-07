package com.spring.mta.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.common.file.FileUploadUtil;
import com.spring.mta.dao.NewsDao;
import com.spring.mta.dao.ReplyDao;
import com.spring.mta.vo.NewsVO;

import lombok.Setter;



@Service
public class NewsServiceImpl implements NewsService{
	
	@Setter(onMethod_=@Autowired )
	private NewsDao newsDao;
	
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
	@Override
	public List<NewsVO> listnews(NewsVO nvo){
		
		List<NewsVO> list = null;
		list = newsDao.listnews(nvo);
		return list;
	}
	
	@Override
	public NewsVO detailnews(NewsVO nvo) {
		// TODO Auto-generated method stub
		NewsVO detail = null;
		detail = newsDao.detailnews(nvo);
		if(detail!=null) {
			detail.setN_text(detail.getN_text().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}
		
	@Override
	public int insertnews(NewsVO nvo) throws Exception {
		int result=0;
		if(nvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(nvo.getFile(),"news");
			nvo.setN_image(fileName);
		}
		result=newsDao.insertnews(nvo);
		return result;
	
	}
	@Override
	public NewsVO updatenews(NewsVO nvo) {
		// TODO Auto-generated method stub
		NewsVO detail = null;
		detail = newsDao.detailnews(nvo);
		return detail;
	}

	@Override
	public int deletenews(int num) {
		// TODO Auto-generated method stub
	
		int result = 0;
		result = newsDao.deletenews(num);
		return result;
	}

	@Override
	public int newsUpdate(NewsVO nvo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		if(nvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(nvo.getFile(),"news");
			nvo.setN_image(fileName);
		}
		result = newsDao.newsUpdate(nvo);
		return result;
	}
	
	

	

	
	
	@Override
	public int newsListCnt(NewsVO nvo) {
		return newsDao.newsListCnt(nvo);
	}
	
	

	@Override
	public int replyCnt(int n_no) {
		int result = 0;
		result = replyDao.replyCnt(n_no);
		return result;
	}
	

	
	public int newsDelete(int n_no) {
		int result = 0;
		result = replyDao.replyCnt(n_no);
		if(result > 0) {
			result = replyDao.replyChoiceDelete(n_no);
		}
		result = newsDao.newsDelete(n_no);
		return result;
	}
	

	
}
