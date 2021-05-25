package com.spring.client.board.controller;

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

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.common.vo.PageDTO;
import com.spring.client.main.controller.MainController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*") //board라는 맵핑을 받아왔을 때 컨트롤러를 사용 할 수 있도록 해주는 어노테이션.
@AllArgsConstructor //의존성 주입  
public class BoardController {
	private BoardService boardService; 
	
	
	
	/**************************************
	 * 글목록 구현하기 (페이징 처리 목록 조회)
	 **************************************/
	@RequestMapping(value ="/boardList", method =RequestMethod.GET)
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardList 출력 성공");
		//전체 레코드 조회
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList",boardList);
		
		//total record count 
		int total = boardService.boardListCnt(bvo);
		//paging
		model.addAttribute("pageMaker",new PageDTO(bvo,total));
		
		
		return "board/boardList";
		
	}
	/**************************************
	 * 글쓰기 폼 출력하기 ()
	 **************************************/
	@RequestMapping(value ="/writeForm")
	public String writeForm(@ModelAttribute("data") BoardVO bvo) {
		log.info("writeForm 호출 성공");
		return "/board/writeForm";
	}
	/**************************************
	 * 글쓰기 구현하기
	 **************************************/
	@RequestMapping(value ="/boardInsert", method =RequestMethod.POST)
	public String boardInsert(BoardVO bvo, Model model) {
		log.info("boardInsert 호출 성공");
		
		int result = 0;
		String url ="";
		
		result = boardService.boardInsert(bvo);
		if(result ==1) {
			url ="/board/boardList";
		}else {
			url ="/board/writeForm";
		}
		return "redirect:"+url; //redirect: 콜론 앞,뒤 어디에도 공백을 주면 안됨(공백을 포함한 url값을 찾는다)
	}
	
	@RequestMapping(value ="/boardDetail", method =RequestMethod.GET)
	public String boardDetail(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardDetail 호출 성공");
		
		BoardVO detail = boardService.boardDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "board/boardDetail";
	}
	
	
	
	/**********************************************************************************************
	 * 비밀번호 확인
	 * @param b_num
	 * @param b_pwd
	 * @return int로 result 를 0/1 로 리턴 할 수 있고, 
	 * String 으로 result 값을 "성공 or 실패  or 불일치" 를 리턴할 수 있다.(현재 문자열 리턴) 
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것이 아니라 HTTP Response Body 에 직접 출력하는 방식 
	 * produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 컨트롤
	 * 타입을 보장.(단순 텍스트로 리턴 할 때 한글 처리) 
	 ***********************************************************************************************/
	
	@ResponseBody// ajax 요청시 필수 .
	@RequestMapping(value = "/pwdConfirm", method = RequestMethod.POST, 
	produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfrim 호출 성공");
		
		String value = "";
		//아래 변수에는 입력 성공에 대한 상태갑 저장 (1/0)
		int result = boardService.pwdConfirm(bvo);
		
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		log.info("result = "+result);
		
		return value ;
	}
	
	/*
	 * 글 삭제 구현하기 
	 * */
	@RequestMapping("/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO bvo, RedirectAttributes ras) {
		log.info("boardDelete 호출 성공");
		
		//아래 변수에는 입력 성공에 대한 상태값을 담습니다 ( 1 or 0)
		int result  = 0;
		String url  = "";
		
		result = boardService.boardDelete(bvo.getB_num());
		ras.addFlashAttribute("boardVO",bvo);
		
		if(result ==1) {
			url = "/board/boardList";
		}else {
			url ="/board/boardDetail"; // 혹시모를 문제 발생 시, 
		}
	return "redirect:"+url;
	}
	
	
	/********************************************
	 * 글 수정 폼  
	 * ***************************************/
	@RequestMapping("/updateForm")
	public String updateForm(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("b_num : "+bvo.getB_num());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData",updateData);
		
		return "board/updateForm";
	}
	
	
	/****************************************************************
	 * 글수정 구현하기
	 * @param Boardvo
	 * @return
	 * 참고 : RedirectAttributes 객체는 리다이랙트 시점(return "redirect:/경로")에 
	 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
	 * addFlashAttribute() 메서드는 브라우저까지 정송되기는 하지만,
	 * URL상에서는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 */
	@RequestMapping(value ="/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo, RedirectAttributes ras) {
		log.info("boardUpdate 호출 성공 ");
		
		int result = 0; 
		String url = "";
		
		result = boardService.boardUpdate(bvo);
		ras.addFlashAttribute("data",bvo);
		
		if(result ==1) {
			//아래 url 은 수정 후 상세페이지로 이동 
			//url =  "/board/updateForm?b_num="+bvo.getB_num();
			url = "/board/boardDetail";
		}else {
			//url = "/board/updateForm?b_num="+bvo.getB_num();
			url = "/board/updateForm";
		}
		
		return "redirect:"+url;
		
	}
	
	
	
	
	
	
}