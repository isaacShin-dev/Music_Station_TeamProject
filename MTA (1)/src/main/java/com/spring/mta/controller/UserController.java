package com.spring.mta.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mta.service.UserService;
import com.spring.mta.vo.UserVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	
	private UserService userService;
	
	/* 약관동의 폼 이동 */
	   @GetMapping("/Accept")
	   public String Accept() {
	      return "user/Accept";
	   }
	
		/* 회원가입 폼 이동 */
	   @GetMapping("/userJoin")
	   public String userJoin() {
	      return "user/userJoin";
	   }
	
	   /* 아이디찾기 폼 이동 */
	  @GetMapping("/useridfind")
	   public String useridfind() {
	      return "user/useridfind";
	   }
	  
	  /* 비밀번호찾기 폼 이동 */
	   @GetMapping("/userpwfind")
	   public String userpwfind() {
	      return "user/userpwfind";
	   }

	
	
	/*********************************************************
	 * 로그인 구현하기
	 *********************************************************/
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	//GetMapping("/boardList")
	public String loginList(@ModelAttribute("data") UserVO uvo , HttpSession session, Model model) {
		log.info("loginList 호출 성공");
		
		// 전체 레코드 조회 
		UserVO userInfo  = userService.login(uvo);
		
		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
		}else {
			model.addAttribute("errMsg", "로그인정보가 올바르지않습니다.");
		}
		
		return "/intro";
	}
	
	/*********************************************************
	 * 로그아웃 구현하기
	 *********************************************************/
	
	 @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();
	     
	        
	     return "/intro";
	}


	
	
	/********************************************************
	 * 마이페이지로 이동
	 * ******************************************************/
	 @GetMapping("/userDetailForm")
	 public String userDetailForm() {
		 return "user/userDetailForm";
	 }
	 
	 /********************************************************
	  * 유저 수정폼으로 이동
	 * ******************************************************/
		 @GetMapping("/userUpdateForm")
		 public String userUpdateForm() {
			 return "user/userUpdateForm";
	}
		 
		 /********************************************************
		  * 유저 정보 수정
		 * ******************************************************/
		@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
		public String freeboardUpdate(@ModelAttribute("data") UserVO uvo, HttpSession session ) throws Exception{
			log.info("userUpdate 호출 성공");
			
			UserVO another = (UserVO)session.getAttribute("userInfo");
			uvo.setUser_id(another.getUser_id());
			
			UserVO userInfo = userService.login(uvo);
				if(userInfo != null) {
					session.setAttribute("userInfo", userInfo);
			}
			
			int result = 0;
			String url = "";
			result = userService.userUpdate(uvo);
			if (result == 1) {
				  	session.invalidate();
					url = "/intro";
			}else {
					url = "user/userUpdateForm";
			}	
			
			return url;
		}
					 
		 /********************************************************
		  * 회원가입 구현
		 * ******************************************************/
		@RequestMapping(value = "/userInsert", method = RequestMethod.POST)
		   public String userInsert(UserVO uvo, Model model) {
		      log.info("userInsert 요청 완료");
		      
		      int result = 0;
		      String url = "";
		      result = userService.userInsert(uvo);
		      if (result == 1) {
		         url = "/intro";
		      }
		      
		      return url;
		   } 
		
		
		 //아이디 중복확인
		   @ResponseBody
		   @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
		   public int idCheck(UserVO uvo) {
		      log.info("idCheck 호출 성공");
		      
		      int result = 0;

		      result =  userService.userIdCheck(uvo);
		      
		      
		      return result;
		   }
		   
		   //아이디 찾기확인
		   @ResponseBody
		   @RequestMapping(value = "/findId", method = RequestMethod.POST)
		   public String findId(@ModelAttribute("data") UserVO uvo) {
		      log.info("findId 호출 성공");
		      
		      String result = "";
		      
		      
		      result =  userService.userFindId(uvo);
		      
		      
		      
		      return result;
		   }
		   
		 //비밀번호 찾기확인
		   @ResponseBody
		   @RequestMapping(value = "/findPwd", method = RequestMethod.POST)
		   public String findPwd(@ModelAttribute("data") UserVO uvo) {
		      log.info("findPwd 호출 성공");
		         
		      String result = "";
		         
		         
		      result =  userService.userFindPwd(uvo);
		         
		         
		         
		      return result;
		   }
}

