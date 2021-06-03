package com.spring.mta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.common.file.FileUploadUtil;
import com.spring.mta.dao.fnoticeDao;
import com.spring.mta.vo.fnoticeVO;
import com.spring.mta.vo.freeBoardVO;

import lombok.Setter;

@Service
public class fnoticeServiceImpl implements fnoticeService{

	@Setter(onMethod_ =@Autowired )
	private fnoticeDao noticeDao;
	
	@Override
	public List<fnoticeVO> noticeList(fnoticeVO nvo) {
		// TODO Auto-generated method stub
		List<fnoticeVO> list = null;
		list = noticeDao.noticeList(nvo);
		return list;
	}

	@Override
	public fnoticeVO noticeDetail(fnoticeVO nvo) {
		// TODO Auto-generated method stub
		fnoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		
		
		if(detail!=null) {
			detail.setFn_text(detail.getFn_text().toString().replaceAll("\n", "<br>"));
		}
		return detail;
		
	}

	@Override
	public int fnoticeInsert(fnoticeVO nvo) {
		int result = 0;
		
		
		result = noticeDao.fnoticeInsert(nvo);
		return result;
	}

}
