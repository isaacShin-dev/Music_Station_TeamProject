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

import com.spring.mta.service.CartService;
import com.spring.mta.vo.CartVO;
import com.spring.mta.vo.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/basket/*")
@AllArgsConstructor
public class basketController {
		
	private CartService cartService;
	
	@ResponseBody
	@RequestMapping(value ="/cart", method =RequestMethod.GET)
	public String addCart(@ModelAttribute("data") CartVO cvo, UserVO uvo , HttpSession session,@RequestParam(value = "m_no") int m_no)throws Exception {
		log.info("addcart call ");
		int result = 0;
		int cartCheck = 0;
		
		UserVO uvo2 = (UserVO) session.getAttribute("userInfo");
		cvo.setUser_id(uvo2.getUser_id());
		cvo.setM_no(m_no);
		cartCheck =	cartService.CartListCheck(cvo);
		log.info("장바구니 중복 체크"+cartCheck);
		
		if(cartCheck < 1) {
			cvo.setUser_id(uvo2.getUser_id());
			result = cartService.addCart(cvo);
			log.info("장바구니 추가 결과 : "+result );
		}else {
			result = 2;
		}
		

		return  String.valueOf(result);
		
	}
}
