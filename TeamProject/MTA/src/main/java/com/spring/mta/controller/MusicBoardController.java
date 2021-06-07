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

import com.spring.mta.common.vo.PageDTO;
import com.spring.mta.service.LikeService;
import com.spring.mta.service.MusicBoardService;

import com.spring.mta.service.mcommentService;
import com.spring.mta.vo.LikeCntVO;
import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.UserVO;

import com.spring.mta.vo.mcommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mboard/*") 
@AllArgsConstructor  
public class MusicBoardController {
	private MusicBoardService musicBoardService; 
	private mcommentService mcommentservice;
	
	private LikeService likeService;
	
/***********	call out Music_board List*****
************************************************/	
	@RequestMapping(value ="/boardList", method = RequestMethod.GET)
	public String musicBoardList(@ModelAttribute("data") MusicBoardVO mvo, Model model) {
		
		log.info("list method");
		List<MusicBoardVO> boardList  = musicBoardService.musicBoardList(mvo);
		model.addAttribute("boardList",boardList);
		
		List<MusicBoardVO> recentList = musicBoardService.musicRecentList(mvo);
		model.addAttribute("recentList",recentList);
		
		int total = musicBoardService.boardListCnt(mvo);
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		 

		return "mboard/mboardList";

	}	
/************	call out Music_board List*****
 ************************************************/	
	
	@RequestMapping(value ="/writeForm")
	public String writeForm(@ModelAttribute("data") MusicBoardVO bvo) {
		log.info("writeForm");
		return "mboard/mWriteForm";
	}
	
	/************	call out mboardUpdateForm*****
	 ************************************************/	
		
		@RequestMapping(value ="/updateForm")
		public String updateForm(@ModelAttribute("data") MusicBoardVO bvo) {
			log.info("updateForm");
			return "mboard/mUpdateForm";
		}
	
	
	@RequestMapping(value ="/boardInsert", method =RequestMethod.POST)
	public String boardInsert(MusicBoardVO bvo, Model model) throws Exception{
		log.info("boardInsert");
		
		int result = 0;
		String url ="";
		
		result = musicBoardService.musicBoardInsert(bvo);
		if(result ==1) {
			url ="/mboard/boardList";
		}else {
			url ="/mboard/writeForm";
		}
		return "redirect:"+url; 
	}
	
	
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute("data") MusicBoardVO mvo, mcommentVO mco, Model model) {
		log.info("board detail 호출 성공 ");
		
		MusicBoardVO detail = musicBoardService.boardDetail(mvo);
		model.addAttribute("detail",detail);
		
		List<mcommentVO> mcommentList =  mcommentservice.mcommentList(mco);
		model.addAttribute("mcommentList",mcommentList);
		
		return "mboard/mboardDetail";
	}
	
	@RequestMapping(value ="/fileDownload", method = RequestMethod.GET)
	public void fileDownload(@ModelAttribute("data") MusicBoardVO mvoo) throws Exception{
		log.info("download controller 호출 성공");
		
		
	}
	
	
	
	//댓글 갯수
	
	@ResponseBody
	@RequestMapping(value = "/replyCnt")
	public String replyCnt(@RequestParam("m_no") int m_no) {
		
		log.info("replyCnt 호출 성공");
		int result =0;
		
		result = musicBoardService.replyCnt(m_no);

		return String.valueOf(result);
	}
	
	//추천 수 증가 
		@ResponseBody
		@RequestMapping(value ="/recommend", method = RequestMethod.GET)
		public String recommend(@ModelAttribute("data") MusicBoardVO mvo, HttpSession session, @RequestParam(value = "m_no") int m_no)throws Exception {
			log.info("recommend호출 ");
			int likecheck = 0 ;
			int result =0;
			int likeAdd =0;
			LikeCntVO lvo = new LikeCntVO();
			
			UserVO uvo = (UserVO) session.getAttribute("userInfo");
			lvo.setUser_id(uvo.getUser_id());
			lvo.setM_no(m_no);
			likecheck = likeService.likeCheck(lvo);
			
			
			if(likecheck <1) {
				mvo.setM_no(m_no);
				result = musicBoardService.recommend(mvo);
				
				lvo.setUser_id(uvo.getUser_id());
				lvo.setM_no(m_no);
				likeAdd = likeService.likeAdd(lvo);
				
				log.info("restult :"+result);
			}else {
				
				result = -1;
			}
			
			return String.valueOf(result);	
		}
	
	/*********************************************************
	 * 비밀번호 확인
	 * @param b_num
	 * @param b_pwd
	 * @return int로 result를 0 또는 1을 리턴할 수도 있고, String으로 result 값을 "성공 or 실패, 
	 * 										일치 or 불일치 "를 리턴할 수도 있다.(현재 문자열 리턴)
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것x
	 * 		HTTP Response Body에 직접 출력하는 방식.
	 * 		produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 컨텐트 타입을 보장.
	 *********************************************************/
	// ajax 요청할때 반드시 @ResponseBody를 붙여줘야 데이터만 반환받을 수 있다.
	@ResponseBody
	@RequestMapping(value = "/pwdConfirm", method = RequestMethod.POST) //, produces = "text/plain; charset=UTF-8"
	public int pwdConfirm(UserVO uvo) {
		log.info("pwdConfirm 호출 성공");
		
		
		//아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = musicBoardService.pwdConfirm(uvo);
		
		return result;
	}
	
	/**************************************************************
	    * 글 삭제 구현하기
	    **************************************************************/
	   @RequestMapping(value="/boardDelete")
	      public String boardDelete(@ModelAttribute MusicBoardVO mvo) {
	         log.info("boardDelete 호출 성공");
	         
	         int result = 0;
	         String url = "";
	         
	         result = musicBoardService.musicboardDelete(mvo.getM_no());
	         
	         if(result==1) {
	            url="/mboard/boardList";
	         }else {
	        	 url="/mboard/boardDetail";
	         }
	         return "redirect:"+url;
	      }
	
}