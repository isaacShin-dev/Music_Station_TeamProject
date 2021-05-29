package com.spring.mta.like.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mta.like.service.LikeService;
import com.spring.mta.like.vo.LikeCntVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*") 
@AllArgsConstructor 
public class LikeController {
	private LikeService likeService;
	
	
	
	
	
}
