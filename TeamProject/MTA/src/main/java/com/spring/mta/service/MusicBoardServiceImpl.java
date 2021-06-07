package com.spring.mta.service;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.common.file.FileUploadUtil;
import com.spring.mta.dao.MusicBoardDao;
import com.spring.mta.dao.ReplyDao;
import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.UserVO;

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
	      
	      if(bvo.getCover_file().getSize() > 0) {
	         String fileName = FileUploadUtil.fileUpload(bvo.getCover_file(),"coverImg");
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
			detail.setM_explan(detail.getM_explan().toString().replaceAll("\n", "<br/>"));
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
	public List<MusicBoardVO> musicChart(MusicBoardVO mbvo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int pwdConfirm(UserVO uvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = musicBoardDao.pwdConfirm(uvo);
		
		return result;
	}


	@Override
	public int musicboardDelete(int m_no) {
		
			int result = 0;
			result = musicBoardDao.musicboardDelete(m_no);
			return result;
		}
		 

	
	@Override
	public int boardListCnt(MusicBoardVO mvo) {
		
		return musicBoardDao.boardListCnt(mvo);
	}


	@Override
	public List<MusicBoardVO> musicRecentList(MusicBoardVO mvo) {
		// TODO Auto-generated method stub
		List<MusicBoardVO> list = musicBoardDao.musicRecentList(mvo);
		return list;
	}

	
	
}
