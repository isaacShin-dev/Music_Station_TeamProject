package com.spring.mta.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mta.cart.service.CartService;
import com.spring.mta.cart.vo.CartVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class CartController {
	private CartService cartService;
	
	
	
	@RequestMapping(value ="/addCart", method =RequestMethod.POST)
	public String addCart(CartVO cvo, Model model) {
		log.info("addcart call ");
		
		int result = 0;
		String url = "";
		
		result = cartService.addCart(cvo);
		if(result ==1) {
 			url = "/board/cartList";
		}else {
			url ="/board/boardList";
		}
		
		
		return "redirect:"+url;
		
	}
	
	
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String cartList(@ModelAttribute("cart") CartVO cvo, Model model) {
		log.info("cartList call");
		cvo.setUser_id("test"); // 추후 세션 정보로 변경해주어야 함. 
		List<CartVO> list = cartService.CartList(cvo);
		model.addAttribute("cartList",list);
		
		
		return "board/cartList";
	}
	
	
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public String deleteCart(HttpSession session, @RequestParam(value = "check[]") List<String> chArr, CartVO cvo) throws Exception {
	 log.info("delete cart call  ");
	 
	//MemberVO member = (MemberVO)session.getAttribute("member");
	 //String userId = member.getUserId();
	 
	 int result = 0;
	 String cart_id = "";
	 
	 
	 //if(member != null) {
	  cvo.setUser_id("test"); // 로그인 정보 추가 후 session 으로 변경 요망. 
	  
	  for(String i : chArr) {   
	   cart_id = i;
	   cvo.setCart_id(cart_id);
	   cartService.deleteCart(cvo);
	  }   
	  result = 1;
	 //}  
	 return String.valueOf(result);  
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/checkOut", method = RequestMethod.POST)
	public String checkOut(@RequestParam(value = "check[]") List<String> chArr, CartVO cvo, Model model) throws Exception {
		String cart_id  ="";
		List<CartVO> list = null;
		int result =0;
		
		cvo.setUser_id("test");
		
		for(String i : chArr) {
			cart_id = i ;
			cvo.setCart_id(cart_id);
			 result = cartService.cartCheckOut(cvo);
		}
		
		
		return String.valueOf(result);  
	}
	

}












