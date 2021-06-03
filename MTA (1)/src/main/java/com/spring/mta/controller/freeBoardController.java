package com.spring.mta.controller;


import java.util.List;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mta.common.vo.PageDTO;
import com.spring.mta.service.LikeService;
import com.spring.mta.service.fcommentService;
import com.spring.mta.service.fnoticeService;
import com.spring.mta.service.freeBoardService;
import com.spring.mta.vo.fcommentVO;
import com.spring.mta.vo.fnoticeVO;
import com.spring.mta.vo.freeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class freeBoardController {
	
	private freeBoardService freeboardService;
	private fcommentService fcommentservice;
	private fnoticeService noticeService;
	private LikeService likeservice;
	
	/*********************************************************
	 * 글목록 구현하기(페이징 처리 목록 조회)
	 *********************************************************/
	
	@RequestMapping(value="/freeboard", method = RequestMethod.GET)
	//GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") freeBoardVO fvo, fnoticeVO nvo, Model model ) {
		log.info("freeBoard 호출 성공");
		
	
		// 전체 레코드 조회 
		List<freeBoardVO> boardList = freeboardService.freeboardList(fvo);
		model.addAttribute("boardList", boardList);
		
		// 공지사항 레코드 조회
		List<fnoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		// 전체 레코드수 구현
		int total = freeboardService.boardListCnt(fvo);
		//페이징 처리
		model.addAttribute("pageMaker" , new PageDTO(fvo, total));
		
		
		return "board/freeboard";
	}
	
	
	/*********************************************************
	 * 글쓰기 폼 출력하기
	 *********************************************************/
	@RequestMapping("/freeWriteForm")
	public String writeForm(@ModelAttribute("data") freeBoardVO bvo) {
		log.info("freeWrtieForm 호출 성공");
		
		return "board/freeWriteForm";
	}
	

	/*********************************************************
	 * 글쓰기 구현하기
	 *********************************************************/
	@RequestMapping(value="/freeboardInsert", method = RequestMethod.POST)
	//@PostMapping("/freeboardInsert")
	public String freeboardInsert(freeBoardVO bvo, Model model) throws Exception{
		log.info("freeboardInsert 호출 성공");
		
	
		int result = 0;
		String url = "";
		result = freeboardService.freeboardInsert(bvo);
		if(result == 1) {
			url = "/board/freeboard";
		}else {
			url = "/board/freeWriteForm";
		}
		
		return "redirect:"+url;
	}
	

	
	/*********************************************************
	 * 글 상세보기 구현
	 *********************************************************/
	@RequestMapping(value="/freeboardDetail", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute("data") freeBoardVO bvo,fcommentVO fco, Model model) {
		log.info("freeboardDetail 호출 성공");
		//log.info("bvo = " + bvo);
		

		freeBoardVO detail = freeboardService.freeboardDetail(bvo);
		model.addAttribute("detail", detail);
		
		List<fcommentVO> fcommentList =  fcommentservice.fcommentList(fco);
		model.addAttribute("fcommentList",fcommentList);
		
		return "board/freeboardDetail";
	}
	
	
	/**************************************************************
	    * 글 삭제 구현하기
	    **************************************************************/
	   @RequestMapping(value="/freeboardDelete")
	      public String boardDelete(@ModelAttribute freeBoardVO bvo) {
	         log.info("freeboardDelete 호출 성공");
	         
	         int result = 0;
	         String url = "";
	         
	         result = freeboardService.freeboardDelete(bvo.getF_no());
	         
	         if(result==1) {
	            url="/board/freeboard";
	         }else {
	        	 url="/board/freeboardDetail";
	         }
	         return "redirect:"+url;
	      }
	   
		/*********************************************************
		 * 업데이트 폼 출력하기
		 * @param : b_num
		 * @return : BoardVO
		 *********************************************************/
		@RequestMapping("/freeUpdateForm")
		public String updateForm(@ModelAttribute("data") freeBoardVO bvo, Model model) {
			log.info("freeUpdateForm 호출 성공");
			log.info("f_no:" + bvo.getF_no());
			
			freeBoardVO board = freeboardService.freeupdateForm(bvo);
			model.addAttribute("updateData",board);
			return "board/freeUpdateForm";
		}
		
		/*********************************************************
		 * 업데이트 구현하기2
		 * @param BoardVO
		 * 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에
		 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
		 * addFlashAttribute() 메소드는 브라우저까지 전송되기는 하지만,
		 * URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
		 *********************************************************/
		@RequestMapping(value="/freeboardUpdate", method = RequestMethod.POST)
		//@PostMapping("/boardUpdate")
		public String freeboardUpdate(@ModelAttribute freeBoardVO bvo, RedirectAttributes ras) throws Exception{
			log.info("freeboardUpdate 호출 성공");
			
			int result = 0;
			String url = "";
			
			result = freeboardService.freeboardUpdate(bvo);
			ras.addFlashAttribute("data",bvo);
			//addFlashAttribute() 는 리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다.
			
			if(result == 1) {
				//아래 url은 수정 후 상세ㅔ 페이지로 이동
				//url = "/board/boardDetail?b_num="+bvo.getB_num();
				url = "/board/freeboardDetail";
			}else {
				//url = "/board/updateForm?b_num="+bvo.getB_num();
				url = "/board/freeUpdateForm";
			}
			
			return "redirect:"+url;
			//redirect하고나서 절대 뒤에 띄워쓰기 x
		}
		
		
		/*********************************************************
		 * 글 추천하기
		 *********************************************************/
		@RequestMapping(value = "/freeRecomment", method = RequestMethod.POST)
		public String freeRecomment(@ModelAttribute("data") freeBoardVO fvo, RedirectAttributes ras) {
			log.info("freeRecomment 호출 성공");
			log.info("f_no:" + fvo.getF_no());
			
			int result = 0;
			String url = "";
			result = freeboardService.freeRecomment(fvo.getF_no());
			
			ras.addFlashAttribute("data",fvo);
			//addFlashAttribute() 는 리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다.
			
			if(result == 1) {
				//아래 url은 수정 후 상세ㅔ 페이지로 이동
				//url = "/board/boardDetail?b_num="+bvo.getB_num();
				url = "/board/freeboardDetail?b_num="+fvo.getF_no();
			}else {
				url = "/board/freeboard";
			}
			
			return "redirect:"+url;
			//redirect하고나서 절대 뒤에 띄워쓰기 x
		}
		
}
	


	
	
	
	

