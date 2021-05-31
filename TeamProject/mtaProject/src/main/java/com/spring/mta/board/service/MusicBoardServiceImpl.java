package com.spring.mta.board.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.board.dao.MusicBoardDao;
import com.spring.mta.board.vo.MusicBoardVO;
import com.spring.mta.common.file.FileUploadUtil;
import com.spring.mta.reply.dao.ReplyDao;

import lombok.Setter;

@Service
public class MusicBoardServiceImpl implements MusicBoardService {
	
	
	
	@Setter(onMethod_ = @Autowired)
	private MusicBoardDao musicBoardDao;
	
	
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao ;

	
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


	@Override
	public int replyCnt(int m_no) {
		int result  =0;
		result = replyDao.replyCnt(m_no);
		
		return result;
	}


	@Override
	public int recommend(MusicBoardVO mvo) {
		int result =0;
		result = musicBoardDao.recommend(mvo);
		
		return result;
	}


	@Override
	public List<MusicBoardVO> musicRecentList(MusicBoardVO mvo) {
		List<MusicBoardVO> list = null;
		list = musicBoardDao.musicRecentList(mvo);
		return list;
		
	}


	@Override
	public int boardListCnt(MusicBoardVO mvo) {

		int result =0;
		
		result =musicBoardDao.boardListCnt(mvo);
		return result;
	}


	@Override
	public int mBoardUpdate(MusicBoardVO mvo) throws Exception {
		int result = 0;
		
		
		 if(mvo.getCoverImg().getSize() > 0) {
	         String fileName = FileUploadUtil.fileUpload(mvo.getCoverImg(),"coverImg");
	         mvo.setM_coverimage(fileName);
	      }
	      if(mvo.getFile().getSize()>0){
	    	  String fileName = FileUploadUtil.fileUpload(mvo.getFile(), "audioFile");
	    	  mvo.setM_file(fileName);
	      }
	      
	      result = musicBoardDao.mBoardUpdate(mvo);
				
		return result;
	}


	@Override
	public MusicBoardVO updateForm(MusicBoardVO mvo) {
		MusicBoardVO detail = null; 
		detail = musicBoardDao.boardDetail(mvo);
	
		return detail;
	}
	 

	
	
}
