package com.spring.mta.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.board.dao.MusicBoardDao;
import com.spring.mta.board.vo.MusicBoardVO;
import com.spring.mta.common.file.FileUploadUtil;

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
	
	
	@Override
	 public int musicBoardInsert(MusicBoardVO bvo) throws Exception {
	      int result = 0;
	      
	      if(bvo.getCoverImg().getSize() > 0) {
	         String fileName = FileUploadUtil.fileUpload(bvo.getCoverImg(),"coverImg");
	         bvo.setM_coverimage(fileName);
	      }
	      if(bvo.getFile().getSize()>0){
	    	  String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "audioFile");
	    	  bvo.setM_file(fileName);
	      }
	      result = musicBoardDao.musicBoardInsert(bvo);
	      return result;
	   }


	@Override
	public MusicBoardVO boardDetail(MusicBoardVO mvo) {
		MusicBoardVO detail = null  ; 
		detail = musicBoardDao.boardDetail(mvo);
		
		if(detail!=null) {
			detail.setM_explain(detail.getM_explain().toString().replaceAll("\n", "<br/>"));
		}
		
		
		return detail;
	}
	 

	
	
}
