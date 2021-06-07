package com.spring.mta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mta.service.fnoticeService;
import com.spring.mta.vo.fcommentVO;
import com.spring.mta.vo.fnoticeVO;
import com.spring.mta.vo.freeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class noticeController {
	private fnoticeService noticeService;
	
	
	/*********************************************************
	 * 공지 상세보기 구현
	 *********************************************************/
	@RequestMapping(value="/fnoticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") fnoticeVO nvo,fcommentVO fco, Model model) {
		log.info("noticeDetail 호출 성공");
		//log.info("bvo = " + bvo);
		

		fnoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		
		return "notice/fnoticeDetail";
	}
	
	
	/*********************************************************
	 * 공지 글쓰기 폼 출력하기
	 *********************************************************/
	@RequestMapping("/fnoticeWriteForm")
	public String noticeWriteForm(@ModelAttribute("data") fnoticeVO nvo) {
		log.info("noticeWrtieForm 호출 성공");
		
		return "notice/noticeWriteForm";
	}
	
	/*********************************************************
	 * 공지 글쓰기 구현하기
	 *********************************************************/
	@RequestMapping(value="/fnoticeInsert", method = RequestMethod.POST)
	//@PostMapping("/freeboardInsert")
	public String fnoticeInsert(fnoticeVO nvo, Model model){
		log.info("fnoticeInsert 호출 성공");
		
	
		int result = 0;
		String url = "";
		result = noticeService.fnoticeInsert(nvo);
		if(result == 1) {
			url = "/board/freeboard";
		}else {
			url = "/notice/noticeWriteForm";
		}
		
		return "redirect:"+url;
	}
	
}
