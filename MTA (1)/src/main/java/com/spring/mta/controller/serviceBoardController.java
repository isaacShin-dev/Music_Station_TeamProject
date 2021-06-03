package com.spring.mta.controller;


import java.util.List;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mta.common.vo.PageDTO;
import com.spring.mta.service.fcommentService;
import com.spring.mta.service.freeBoardService;
import com.spring.mta.service.serviceService;
import com.spring.mta.vo.fcommentVO;
import com.spring.mta.vo.freeBoardVO;
import com.spring.mta.vo.sReplyVO;
import com.spring.mta.vo.serviceVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/sboard/*")
@AllArgsConstructor
public class serviceBoardController {
	
	private serviceService sService;
	
	
	/*********************************************************
	 * 글목록 구현하기(페이징 처리 목록 조회)
	 *********************************************************/
	
	@RequestMapping(value="/serviceCenter", method = RequestMethod.GET)
	public String serviceCenterList(@ModelAttribute("data") serviceVO sbvo, Model model ) {
		log.info("serviceBoard 호출 성공");
		
	
		// 전체 레코드 조회 
		List<serviceVO> serviceList = sService.serviceboardList(sbvo);
		model.addAttribute("serviceList", serviceList);
		
		// 전체 레코드수 구현
		int total = sService.serviceboardListCnt(sbvo);
		//페이징 처리
		model.addAttribute("pageMaker" , new PageDTO(sbvo, total));
		
		
		return "sboard/serviceCenter";
	}
	
	
	/*********************************************************
	 * 글쓰기 폼 출력하기
	 *********************************************************/
	@RequestMapping("/serviceWriteForm")
	public String writeForm(@ModelAttribute("data") serviceVO sbvo) {
		log.info("serviceWrtieForm 호출 성공");
		
		return "sboard/serviceWriteForm";
	}
	

	/*********************************************************
	 * 글쓰기 구현하기
	 *********************************************************/
	@RequestMapping(value="/serviceboardInsert", method = RequestMethod.POST)
	//@PostMapping("/freeboardInsert")
	public String serviceboardInsert(serviceVO sbvo, Model model) {
		log.info("serviceboardInsert 호출 성공");
		
	
		int result = 0;
		String url = "";
		result = sService.serviceboardInsert(sbvo);
		if(result == 1) {
			url = "/sboard/serviceCenter";
		}else {
			url = "/sboard/serviceWriteForm";
		}
		
		return url;
	}
	

	
	/*********************************************************
	 * 글 상세보기 구현
	 *********************************************************/
	@RequestMapping(value="/serviceboardDetail", method = RequestMethod.GET)
	public String serviceboardDetail(@ModelAttribute("data") serviceVO sbvo, sReplyVO srvo, Model model) {
		log.info("serviceboardDetail 호출 성공");
		//log.info("bvo = " + bvo);
		

		serviceVO detail = sService.serviceboardDetail(sbvo);
		model.addAttribute("detail", detail);
		
		
		return "sboard/serviceDetail";
	}
	
	
	/**************************************************************
	    * 글 삭제 구현하기
	    **************************************************************/
	   @RequestMapping(value="/serviceboardDelete")
	      public String serviceboardDelete(@ModelAttribute serviceVO sbvo) {
	         log.info("serviceboardDelete 호출 성공");
	         
	         int result = 0;
	         String url = "";
	         
	         result = sService.serviceboardDelete(sbvo.getScb_no());
	         
	         if(result==1) {
	            url="/sboard/serviceCenter";
	         }else {
	        	 url="/sboard/serviceboardDetail";
	         }
	         return "redirect:"+url;
	      }
	   
		/*********************************************************
		 * 업데이트 폼 출력하기
		 * @param : b_num
		 * @return : BoardVO
		 *********************************************************/
		@RequestMapping("/serviceUpdateForm")
		public String updateForm(@ModelAttribute("data") serviceVO sbvo, Model model) {
			log.info("serviceUpdateForm 호출 성공");
			log.info("scb_no:" + sbvo.getScb_no());
			
			serviceVO board = sService.serviceUpdateForm(sbvo);
			model.addAttribute("updateData",board);
			return "sboard/serviceUpdateForm";
		}
		
		/*********************************************************
		 * 업데이트 구현하기2
		 * @param BoardVO
		 * 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에
		 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
		 * addFlashAttribute() 메소드는 브라우저까지 전송되기는 하지만,
		 * URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
		 *********************************************************/
		@RequestMapping(value="/serviceboardUpdate", method = RequestMethod.POST)
		public String serviceboardUpdate(@ModelAttribute serviceVO sbvo, RedirectAttributes ras) throws Exception{
			log.info("serviceboardUpdate 호출 성공");
			
			int result = 0;
			String url = "";
			
			result = sService.serviceboardUpdate(sbvo);
			ras.addFlashAttribute("data",sbvo);
			//addFlashAttribute() 는 리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다.
			
			if(result == 1) {
				
				url = "/sboard/serviceboardDetail";
			}else {
				url = "/sboard/serviceUpdateForm";
			}
			
			return "redirect:"+url;
			//redirect하고나서 절대 뒤에 띄워쓰기 x
		}
		
	
		
}
	


	
	
	
	

