package com.spring.mta.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mta.board.service.MusicBoardService;
import com.spring.mta.board.vo.MusicBoardVO;
import com.spring.mta.common.vo.pageDTO;
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
		
		List<MusicBoardVO> recentList = musicBoardService.musicRecentList(mvo);
		model.addAttribute("recentList",recentList);
		
		//paggination 
		
		int total = musicBoardService.boardListCnt(mvo);
		
		model.addAttribute("pageMaker",new pageDTO(mvo, total));
		
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
	
	@RequestMapping(value ="/fileDownload", method = RequestMethod.GET)
	public void fileDownload(@ModelAttribute("data") MusicBoardVO mvoo) throws Exception{
		log.info("download controller 호출 성공");
		
		
	}
	
	
	
	//댓글 갯수
	
	@ResponseBody
	@RequestMapping(value = "/replyCnt")
	public String replyCnt(@RequestParam("m_no") int m_no) {
		
		log.info("replyCnt 호출 성공");
		int result =0;
		
		result = musicBoardService.replyCnt(m_no);

		return String.valueOf(result);
	}
	
	//추천 수 증가 
	@ResponseBody
	@RequestMapping(value ="/recommend", method = RequestMethod.GET)
	public String recommend(@ModelAttribute MusicBoardVO mvo,  @RequestParam(value = "m_no") int m_no) {
		log.info("recommend호출 ");
		
		mvo.setM_no(m_no);
		
		int result =0;
		
		result = musicBoardService.recommend(mvo);
		
		
		log.info("restult :"+result);
		
		
		return String.valueOf(result);
		
		
		
	}
	
	
	
}