package com.spring.mta.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mta.common.vo.PageDTO;
import com.spring.mta.service.NewsService;
import com.spring.mta.vo.NewsVO;
import com.spring.mta.vo.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;




@Controller
@Log4j
@RequestMapping("/nboard/*")
@AllArgsConstructor
public class NewsController {
	
	private NewsService newsService;
	
	
	
	 
	   @RequestMapping(value="/listnews", method = RequestMethod.GET)
	   public String listnews(@ModelAttribute("data")NewsVO nvo, Model model) {
		   log.info("listnews");
		   
		   List<NewsVO> listnews = newsService.listnews(nvo);
		   model.addAttribute("listnews",listnews);
		   
		  
		   int total = newsService.newsListCnt(nvo);
		 
		   model.addAttribute("pageMaker", new PageDTO(nvo, total));
		   
		   return "nboard/listnews";
	   }
	   
	
	   @RequestMapping(value = "/writenews")
	   public String writenews(@ModelAttribute("data") NewsVO nvo) {
	      log.info("writenews");
	      
	      return "nboard/writenews";
	   }
	   
	   
	 
	   @RequestMapping(value = "/insertnews", method = RequestMethod.POST)
	   // @PostMapping("/boardInsert")
	   public String insertnews(NewsVO nvo, Model model,UserVO uvo, HttpSession session) throws Exception {
	      log.info("insertNews");
	      log.info("nvo" + nvo);
	     
	      uvo = (UserVO)session.getAttribute("userInfo");
		  nvo.setUser_id(uvo.getUser_id());
	      
	      int result = 0;
	      String url = "";
	      
	      
	      
	      result = newsService.insertnews(nvo);
	      if(result == 1) { 
	         url = "/nboard/listnews";
	      } else {
	         url = "/nboard/writenews";
	      }
	      return "redirect:"+url;
	   }
	  
	
	
	   @RequestMapping(value = "/detailnews", method=RequestMethod.GET)
	   //@GetMapping("/detailnews")
	   public String detailnews(@ModelAttribute("data") NewsVO nvo, Model model) {
	      log.info("detailNews");
	      //log.info("nvo = " + nvo);
	      
	      NewsVO detail = newsService.detailnews(nvo);
	      model.addAttribute("detail", detail);
	      
	      return "nboard/detailnews";
	   }
	   
	   
	   @RequestMapping(value="/deletenews")
	   public String deletenews(@ModelAttribute NewsVO nvo) {
	      log.info("deletenews ");
	      log.info("nvo = " + nvo);
	      
	      
	      int result = 0;
	      String url = "";
	      
	      result = newsService.deletenews(nvo.getN_no());
	      
	      if(result==1) {
	         url="/nboard/listnews";
	      }
	      return "redirect:"+url;
	   }
	   
	   
	   
	   @RequestMapping(value="/updatenews")
	   public String updatenews(@ModelAttribute("data") NewsVO nvo, Model model) {
	      log.info("updatenews");
	      log.info("n_no = " + nvo.getN_no());
	      
	      NewsVO updateData = newsService.updatenews(nvo);
	      
	      model.addAttribute("updateData", updateData);
	      return "nboard/updatenews";
 
	   }
	   
	   @RequestMapping(value="/newsUpdate", method=RequestMethod.POST)
	   public String newsUpdate(@ModelAttribute NewsVO nvo, RedirectAttributes ras) throws Exception {
	      log.info("newsUpdate");
	      
	      int result=0;
	      String url="";
	      
	      result=newsService.newsUpdate(nvo);
	      ras.addFlashAttribute("data", nvo);
	      
	      if(result == 1) {
	         url="/nboard/detailnews";
	      }else {
	         url="/nboard/updatenews";
	      }
	      return "redirect:"+url;
	   }
	   
	   /*********************************************************
	    * @param int 
	    *********************************************************/
	   
	   @ResponseBody
	   @RequestMapping(value="/replyCnt")
	   public String replyCnt(@RequestParam("n_no") int n_no) {
		   log.info("replyCnt");
		   
		   int result = 0;
		   result = newsService.replyCnt(n_no);
		   return String.valueOf(result);
	   }

}
