package com.spring.mta.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.spring.mta.service.fcommentService;
import com.spring.mta.service.freeBoardService;
import com.spring.mta.vo.fcommentVO;
import com.spring.mta.vo.freeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/fcomment/*")
@AllArgsConstructor
public class fcommentController {

	private fcommentService fcommentservice;
	private freeBoardService freeboardService;
	
	/*********************************************************
	 * 댓글쓰기 구현하기
	 *********************************************************/
	@RequestMapping(value="/fcommentInsert", method = RequestMethod.POST)
	//@PostMapping("/freeboardInsert")
	public String fcommentInsert(freeBoardVO bvo, fcommentVO fco, Model model) throws Exception{
		log.info("fcommentInsert 호출 성공");
		
		
		
		int result = 0;
		String url = "";
		result = fcommentservice.fcommentInsert(fco);
		if(result == 1) {
			url = "/board/freeboardDetail?f_no="+bvo.getF_no();
		}
		
	
		return "redirect:"+url;
	}
	

		/**************************************************************
	    * 댓글 삭제 구현하기
	    **************************************************************/
	   @RequestMapping(value="/fcDelete")
	      public String fcDelete(freeBoardVO bvo, fcommentVO fco, Model model) throws Exception{
	         log.info("fcDelete 호출 성공");
	         
	         int result = 0;
	         String url = "";
	         
	         result = fcommentservice.fcommentDelete(fco.getFc_no());
	         			
	         
	         if(result==1) {
	            url="/board/freeboardDetail?f_no="+bvo.getF_no();
	         }
	         
	         
	      
	         
	         return "redirect:"+url;
	      }
}
