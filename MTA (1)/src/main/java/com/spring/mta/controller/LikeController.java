package com.spring.mta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.mta.service.LikeService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/like/*") 
@AllArgsConstructor 
public class LikeController {
	private LikeService likeService;
	
	
	
	
	
}
