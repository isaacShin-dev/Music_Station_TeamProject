package com.spring.mta.service;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.freeBoardVO;
import com.spring.common.file.FileUploadUtil;
import com.spring.mta.dao.MusicBoardDao;
import com.spring.mta.dao.freeDao;


import lombok.Setter;


@Service
public class freeBoardServiceImpl implements freeBoardService {
	
	@Setter(onMethod_ =@Autowired )
	private freeDao fboardDao;
	private MusicBoardDao mDao;

	@Override
	public List<freeBoardVO> freeboardList(freeBoardVO fvo) {
		// TODO Auto-generated method stub
				List<freeBoardVO> list = null;
				list = fboardDao.freeboardList(fvo);
				return list;
	}

	@Override
	public int boardListCnt(freeBoardVO fvo) {
		// TODO Auto-generated method stub
		return fboardDao.boardListCnt(fvo);
	}

	@Override
	public freeBoardVO freeboardDetail(freeBoardVO bvo) {
		// TODO Auto-generated method stub
		freeBoardVO detail = null;
		detail = fboardDao.freeboardDetail(bvo);
		
		fboardDao.freeboardUpdateViews(bvo.getF_no());
		
		//fboardDao.freeRecomment(bvo.getF_no());
		if(detail!=null) {
			detail.setF_text(detail.getF_text().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	@Override
	public int freeboardInsert(freeBoardVO bvo) throws Exception{
		int result = 0;
		
		if(bvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(),"board");
			bvo.setF_file(fileName);
		}
		
		result = fboardDao.freeboardInsert(bvo);
		return result;
	}

	@Override
	public int freeboardDelete(int num) {
		// TODO Auto-generated method stub
		int result = 0;
		result = fboardDao.freeboardDelete(num);
		return result;
	}

	@Override
	public freeBoardVO freeupdateForm(freeBoardVO bvo) {
		freeBoardVO detail = null;
		detail = fboardDao.freeboardDetail(bvo);
		return detail;
		
	}

	@Override
	public int freeboardUpdate(freeBoardVO bvo) throws Exception {
		int result = 0;
		if(bvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(),"board");
			bvo.setF_file(fileName);
		}
		
		result = fboardDao.freeboardUpdate(bvo);
		return result;
	}

	@Override
	public int freeRecomment(int num) {
		// TODO Auto-generated method stub
				int result = 0;
				result = fboardDao.freeRecomment(num);
				return result;
	}

	
	


}
