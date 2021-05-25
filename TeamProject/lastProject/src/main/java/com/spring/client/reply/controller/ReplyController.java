package com.spring.client.reply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value= "/replies")
@Log4j
@AllArgsConstructor
public class ReplyController {

private ReplyService replyService;
/**************************************************************
 * ���� : REST(Representational State Transfer)�� ���� 
 *      �ϳ��� URI�� �ϳ��� ������ ���ҽ��� ��ǥ�ϵ��� ����ȴٴ� �����̴�. 
 *      �� REST����� Ư�� URL�� �ݵ�� �׿� �����ϴ� ������ ��ü��� ���� �ǹ��ϴ� ����̴�. 
 *      ���� ��� 'board/125'�� �Խù� �߿��� 125���̶�� ������ �ǹ̸� �������� �����ϰ�, 
 *      �̿� ���� ó���� GET, POST ��İ� ���� �߰����� ������ ���ؼ� �����Ѵ�.
 **************************************************************/

/**************************************************************
 * ���� : @RestController (@Controller + @ResponesBody)
 * Controller�� REST ����� ó���ϱ� ���� ������ ���. (������ Ư���� JSP�� ���� �並 ����� 
 * ���� ���� ������ �ƴ� REST ����� ������ ó���� ���ؼ� ����ϴ�(������ ��ü�� ��ȯ) ������̼��̴�.
 * @ResponesBody: �Ϲ����� JSP�� ���� ��� ���޵Ǵ� �� �ƴ϶� ������ ��ü�� �����ϱ� ���� �뵵�̴�.
 * @PathVariable: URL ��ο� �ִ� ���� �Ķ���ͷ� �����Ϸ��� �� �� ����Ѵ�.
 * @RequestBody: JSON �����͸� ���ϴ� Ÿ������ ���ε� ó���Ѵ�.
 **************************************************************/

/**************************************************************
* ��� �۸�� �����ϱ�
* @return List<ReplyVO>
* ���� : @PathVariable�� URI�� ��ο��� ���ϴ� �����͸� �����ϴ� �뵵�� ������̼�.
* ���� ��û URL : http://localhost:8080/replies/all/�Խ��Ǳ۹�ȣ
* ���� ��û URL : http://localhost:8080/replies/replyList?b_num=�Խ��Ǳ۹�ȣ
* ResponseEntity�� �����ڰ� ���� ��� �����Ϳ� HTTP ���� �ڵ带 ���� ������ �� �ִ� Ŭ����.
**************************************************************/	
	@GetMapping(value ="/all/{b_num}", produces =MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num){
		log.info("List ȣ�� ����");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResponseEntity<>(replyService.replyList(b_num), HttpStatus.OK);
		
		return entity;
		
	}
	
	/**************************************************************
	 * ��� �۾��� �����ϱ�
	 * @return String
	* ���� : @RequestBody
	* 	consumes �Ӽ��� �̿��ϸ� ����ڰ� Request Body�� ��� Ÿ���� ������ �� ������ 
	* 	��û�� ����� �ݵ�� application/json�� �����ؾ� �Ѵ�.
	* 	produces �Ӽ��� �߰��ϰ� dataType�� �����ϸ� �ش� ������Ÿ�����θ� 
	* 	����ڿ��� �����ϰڴٴ� �ǹ̷� �ؼ��ϸ� �ȴ�.
	**************************************************************/
	@PostMapping(value ="/replyInsert", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo){
		log.info("replyInsert ȣ��");
		log.info("replyVO:"+rvo);
		int result = 0;
		
		result = replyService.replyInsert(rvo);
		return result==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
							new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
