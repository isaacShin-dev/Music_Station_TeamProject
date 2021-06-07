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
@RequestMapping("/order/*")
@AllArgsConstructor
public class CartController {
	private CartService cartService;
	
	@ResponseBody
	@RequestMapping(value ="/addCart", method =RequestMethod.POST)
	public String addCart(@ModelAttribute("data") CartVO cvo)throws Exception {
		log.info("addcart call ");
		int result = 0;
		int cartCheck = 0;
		
		
		
		cartCheck =	cartService.CartListCheck(cvo);
		log.info("장바구니 중복 체크"+cartCheck);
		
		System.out.println(cartCheck);
		if(cartCheck < 1) {
			
			result = cartService.addCart(cvo);
			log.info("장바구니 추가 결과 : "+result );
		}else {
			result = 2;
		}
		

		return  String.valueOf(result);
		
	}
	
	
	
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String cartList(@ModelAttribute("cart") CartVO cvo, UserVO uvo,Model model, HttpSession session) {
		log.info("cartList call");
		 // 추후 세션 정보로 변경해주어야 함. 
		UserVO uvo2 = (UserVO) session.getAttribute("userInfo");
		cvo.setUser_id(uvo2.getUser_id());
		List<CartVO> list = cartService.CartList(cvo);
		model.addAttribute("cartList",list);
		
		//String user_id = cvo.getUser_id();
		
		return "order/cartList";
	}
	
	//ordrList
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String cartList2(@ModelAttribute("cart") CartVO cvo, UserVO uvo,Model model, HttpSession session) {
		log.info("orderList call");
		 // 추후 세션 정보로 변경해주어야 함. 
		UserVO uvo2 = (UserVO) session.getAttribute("userInfo");
		cvo.setUser_id(uvo2.getUser_id());
		List<CartVO> list = cartService.CartList(cvo);
		model.addAttribute("cartList",list);
		
		//String user_id = cvo.getUser_id();
		
		return "order/orderList";
	}
	
	
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	public String deleteCart(HttpSession session, @RequestParam(value = "check[]") List<String> chArr, CartVO cvo ,UserVO uvo) throws Exception {
	 log.info("delete cart call  ");
	 
	 
	 int result = 0;
	 String cart_id = "";
	
	  uvo = (UserVO) session.getAttribute("userInfo");
	  String user_id = uvo.getUser_id();
	  
	  for(String i : chArr) {   
	   cart_id = i;
	   cvo.setUser_id(user_id);
	   cvo.setCart_id(cart_id);
	
	   cartService.deleteCart(cvo);
	  }   
	  result = 1;
	 //}  
	 return String.valueOf(result);  
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/checkOut", method = RequestMethod.POST)
	public String checkOut(@RequestParam(value = "check[]") List<String> chArr,UserVO uvo, CartVO cvo, Model model, HttpSession session) throws Exception {
		 int result = 0;
		 String cart_id = "";
		
		  uvo = (UserVO) session.getAttribute("userInfo");
		  String user_id = uvo.getUser_id();
		  
		  for(String i : chArr) {   
		   cart_id = i;
		   cvo.setUser_id(user_id);
		   cvo.setCart_id(cart_id);
		
		   cartService.checkOut(cvo);
		  }   
		  result = 1;
		 //}  
		 return String.valueOf(result);  
	}
	
	
	


}












