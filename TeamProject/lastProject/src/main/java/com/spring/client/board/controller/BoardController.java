package com.spring.client.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.common.vo.PageDTO;
import com.spring.client.main.controller.MainController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*") //board��� ������ �޾ƿ��� �� ��Ʈ�ѷ��� ��� �� �� �ֵ��� ���ִ� ������̼�.
@AllArgsConstructor //������ ����  
public class BoardController {
	private BoardService boardService; 
	
	
	
	/**************************************
	 * �۸�� �����ϱ� (����¡ ó�� ��� ��ȸ)
	 **************************************/
	@RequestMapping(value ="/boardList", method =RequestMethod.GET)
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardList ��� ����");
		//��ü ���ڵ� ��ȸ
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList",boardList);
		
		//total record count 
		int total = boardService.boardListCnt(bvo);
		//paging
		model.addAttribute("pageMaker",new PageDTO(bvo,total));
		
		
		return "board/boardList";
		
	}
	/**************************************
	 * �۾��� �� ����ϱ� ()
	 **************************************/
	@RequestMapping(value ="/writeForm")
	public String writeForm(@ModelAttribute("data") BoardVO bvo) {
		log.info("writeForm ȣ�� ����");
		return "/board/writeForm";
	}
	/**************************************
	 * �۾��� �����ϱ�
	 **************************************/
	@RequestMapping(value ="/boardInsert", method =RequestMethod.POST)
	public String boardInsert(BoardVO bvo, Model model) {
		log.info("boardInsert ȣ�� ����");
		
		int result = 0;
		String url ="";
		
		result = boardService.boardInsert(bvo);
		if(result ==1) {
			url ="/board/boardList";
		}else {
			url ="/board/writeForm";
		}
		return "redirect:"+url; //redirect: �ݷ� ��,�� ��𿡵� ������ �ָ� �ȵ�(������ ������ url���� ã�´�)
	}
	
	@RequestMapping(value ="/boardDetail", method =RequestMethod.GET)
	public String boardDetail(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardDetail ȣ�� ����");
		
		BoardVO detail = boardService.boardDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "board/boardDetail";
	}
	
	
	
	/**********************************************************************************************
	 * ��й�ȣ Ȯ��
	 * @param b_num
	 * @param b_pwd
	 * @return int�� result �� 0/1 �� ���� �� �� �ְ�, 
	 * String ���� result ���� "���� or ����  or ����ġ" �� ������ �� �ִ�.(���� ���ڿ� ����) 
	 * ���� : @ResponseBody�� ���޵� �並 ���ؼ� ����ϴ� ���� �ƴ϶� HTTP Response Body �� ���� ����ϴ� ��� 
	 * produces �Ӽ��� ������ �̵�� Ÿ�԰� ���õ� ������ �����ϴµ� ����� ���� ��Ʈ��
	 * Ÿ���� ����.(�ܼ� �ؽ�Ʈ�� ���� �� �� �ѱ� ó��) 
	 ***********************************************************************************************/
	
	@ResponseBody// ajax ��û�� �ʼ� .
	@RequestMapping(value = "/pwdConfirm", method = RequestMethod.POST, 
	produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfrim ȣ�� ����");
		
		String value = "";
		//�Ʒ� �������� �Է� ������ ���� ���°� ���� (1/0)
		int result = boardService.pwdConfirm(bvo);
		
		if(result == 1) {
			value = "����";
		}else {
			value = "����";
		}
		log.info("result = "+result);
		
		return value ;
	}
	
	/*
	 * �� ���� �����ϱ� 
	 * */
	@RequestMapping("/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO bvo, RedirectAttributes ras) {
		log.info("boardDelete ȣ�� ����");
		
		//�Ʒ� �������� �Է� ������ ���� ���°��� ����ϴ� ( 1 or 0)
		int result  = 0;
		String url  = "";
		
		result = boardService.boardDelete(bvo.getB_num());
		ras.addFlashAttribute("boardVO",bvo);
		
		if(result ==1) {
			url = "/board/boardList";
		}else {
			url ="/board/boardDetail"; // Ȥ�ø� ���� �߻� ��, 
		}
	return "redirect:"+url;
	}
	
	
	/********************************************
	 * �� ���� ��  
	 * ***************************************/
	@RequestMapping("/updateForm")
	public String updateForm(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("updateForm ȣ�� ����");
		log.info("b_num : "+bvo.getB_num());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData",updateData);
		
		return "board/updateForm";
	}
	
	
	/****************************************************************
	 * �ۼ��� �����ϱ�
	 * @param Boardvo
	 * @return
	 * ���� : RedirectAttributes ��ü�� �����̷�Ʈ ����(return "redirect:/���")�� 
	 * �ѹ��� ���Ǵ� �����͸� ������ �� �ִ� addFlashAttribute()��� ����� �����Ѵ�.
	 * addFlashAttribute() �޼���� ���������� ���۵Ǳ�� ������,
	 * URL�󿡼��� ������ �ʴ� ������ �������� ���·� ���޵ȴ�.
	 */
	@RequestMapping(value ="/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo, RedirectAttributes ras) {
		log.info("boardUpdate ȣ�� ���� ");
		
		int result = 0; 
		String url = "";
		
		result = boardService.boardUpdate(bvo);
		ras.addFlashAttribute("data",bvo);
		
		if(result ==1) {
			//�Ʒ� url �� ���� �� ���������� �̵� 
			//url =  "/board/updateForm?b_num="+bvo.getB_num();
			url = "/board/boardDetail";
		}else {
			//url = "/board/updateForm?b_num="+bvo.getB_num();
			url = "/board/updateForm";
		}
		
		return "redirect:"+url;
		
	}
	
	
	
	
	
	
}