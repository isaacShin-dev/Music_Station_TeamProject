package com.spring.mta.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mta.service.MusicBoardService;
import com.spring.mta.vo.MusicBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chart/*")
@AllArgsConstructor
public class chartController {
	
	private MusicBoardService musicBoardService;
	
	/*********************************************************
	 * 로그인 구현하기
	 *********************************************************/
	@RequestMapping(value="/musicChart", method = RequestMethod.POST)
	public String musicChart(@ModelAttribute("mchart") MusicBoardVO mbvo, Model model){
		log.info("musicChart 호출 완료");
		
		List<MusicBoardVO> mchart_list = musicBoardService.musicChart(mbvo);
		model.addAttribute("mchart_list",mchart_list);
		
		String user_id = mbvo.getUser_id();
		String url = "";
		
		if(mchart_list.contains(user_id)) {
			url = "/mainpage/mainpage";
		}else {
			url = "/intro";
		}
		
		return "redirect:"+url;
	}
}
