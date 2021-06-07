package com.spring.mta.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mta.service.MusicBoardService;
import com.spring.mta.service.fcommentService;
import com.spring.mta.service.freeBoardService;
import com.spring.mta.service.mcommentService;
import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.fcommentVO;
import com.spring.mta.vo.freeBoardVO;
import com.spring.mta.vo.mcommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mcomment/*")
@AllArgsConstructor
public class mcommentController {

	private mcommentService mcommentservice;
	private MusicBoardService mboardService;
	
	/*********************************************************
	 * 댓글쓰기 구현하기
	 *********************************************************/
	@RequestMapping(value="/mcommentInsert", method = RequestMethod.POST)
	//@PostMapping("/freeboardInsert")
	public String mcommentInsert(MusicBoardVO mvo, mcommentVO mco, Model model) throws Exception{
		log.info("mcommentInsert 호출 성공");
		
		
		
		int result = 0;
		String url = "";
		result = mcommentservice.mcommentInsert(mco);
		if(result == 1) {
			url = "/mboard/boardDetail?m_no="+mvo.getM_no();
		}
		
	
		return "redirect:"+url;
	}
	

		/**************************************************************
	    * 댓글 삭제 구현하기
	    **************************************************************/
	   @RequestMapping(value="/mcDelete")
	      public String mcDelete(MusicBoardVO mvo, mcommentVO mco, Model model) throws Exception{
	         log.info("mcDelete 호출 성공");
	         
	         int result = 0;
	         String url = "";
	         
	         result = mcommentservice.mcommentDelete(mco.getMc_no());
	         			
	         
	         if(result==1) {
	            url="/mboard/boardDetail?m_no="+mvo.getM_no();
	         }
	         
	         
	      
	         
	         return "redirect:"+url;
	      }
}
