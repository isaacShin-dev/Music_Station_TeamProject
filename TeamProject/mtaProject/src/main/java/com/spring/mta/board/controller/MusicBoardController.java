package com.spring.mta.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mta.board.service.MusicBoardService;
import com.spring.mta.board.vo.MusicBoardVO;
import com.spring.mta.main.controller.MainController;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*") 
@AllArgsConstructor  
public class MusicBoardController {
	private MusicBoardService musicBoardService; 
	
/***********	call out Music_board List*****
************************************************/	
	@RequestMapping(value ="/boardList", method = RequestMethod.GET)
	public String musicBoardList(@ModelAttribute("data") MusicBoardVO mvo, Model model) {
		
		log.info("list method");
		List<MusicBoardVO> boardList  = musicBoardService.musicBoardList(mvo);
		model.addAttribute("boardList",boardList);
		
		return "board/boardList";

	}	
/**********8*	call out Music_board List*****
 ************************************************/	
	
	@RequestMapping(value ="/writeForm")
	public String writeForm(@ModelAttribute("data") MusicBoardVO bvo) {
		log.info("writeForm ȣ�� ����");
		return "/board/writeForm";
	}
	@RequestMapping(value ="/boardInsert", method =RequestMethod.POST)
	public String boardInsert(MusicBoardVO bvo, Model model) throws Exception{
		log.info("boardInsert ȣ�� ����");
		
		int result = 0;
		String url ="";
		
		result = musicBoardService.musicBoardInsert(bvo);
		if(result ==1) {
			url ="/board/boardList";
		}else {
			url ="/board/writeForm";
		}
		return "redirect:"+url; 
	}
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute("data") MusicBoardVO mvo, Model model) {
		log.info("board detail 호출 성공 ");
		
		MusicBoardVO detail = musicBoardService.boardDetail(mvo);
		model.addAttribute("detail",detail);
		
		return "board/boardDetail";
		
		
	}
	
}