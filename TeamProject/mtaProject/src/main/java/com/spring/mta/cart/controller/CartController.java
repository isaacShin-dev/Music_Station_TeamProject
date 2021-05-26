package com.spring.mta.cart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		log.info("addcart 호출 성공 ");
		
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
		cvo.setUser_id("test"); // 추후 세션 정보로 변경해주어야 함. 
		List<CartVO> list = cartService.CartList(cvo);
		model.addAttribute("cartList",list);
		
		
		return "board/cartList";
	}
	
	@RequestMapping(value = "/checkOut", method = RequestMethod.GET)
	public String checkOut(@ModelAttribute("payment") CartVO cvo, Model model) {
		cvo.setUser_id("test"); // 추후 세션 정보로 변경해주어야 함. 
		List<CartVO> list = cartService.CartList(cvo);
		model.addAttribute("payment",list);
		
		
		return "board/checkOut";
	}
	
	
	
	
}












