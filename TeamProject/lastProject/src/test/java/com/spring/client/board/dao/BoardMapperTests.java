package com.spring.client.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.spring.client.board.vo.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ =@Autowired )
	private BoardDao boardDao ;

	/*
	 * @Test public void testBoardList() { BoardVO bvo = new BoardVO();
	 * List<BoardVO> list = boardDao.boardList(bvo); for(BoardVO vo : list) {
	 * log.info(vo); } }
	 */
	
	
	
	/*
	 * @Test public void testBoardInsert() { BoardVO board = new BoardVO();
	 * board.setB_name("김갑수"); board.setB_title("삭제테스트 ");
	 * board.setB_content("2021/05/17게시판 글 삭제테스트 ."); board.setB_pwd("1234"); int
	 * count = boardDao.boardInsert(board); log.info("insert Count : "+ count); }
	 */
	 	 
	
	
	/*
	 * @Test public void testBoardDetail() {
	 * 
	 * BoardVO bvo = new BoardVO(); bvo.setB_num(41); BoardVO board =
	 * boardDao.boardDetail(bvo);
	 * 
	 * log.info(board.toString());
	 * 
	 * }
	 */
	 
	/*
	 * 
	 * @Test public void testPwdConfirm() {
	 * 
	 * BoardVO bvo = new BoardVO();
	 * 
	 * bvo.setB_num(1); bvo.setB_pwd("1234");
	 * 
	 * int result = boardDao.pwdConfirm(bvo);
	 * 
	 * log.info(result);
	 * 
	 * }
	 */
	
	/*
	 * @Test public void testBoardUpdate() { BoardVO bvo = new BoardVO();
	 * 
	 * bvo.setB_title("수정확인"); bvo.setB_content("내용을 수정하는 쿼리가 올바르게 작동하는지 알아보자.");
	 * bvo.setB_pwd("0000"); bvo.setB_num(1);
	 * 
	 * int result = boardDao.boardUpdate(bvo);
	 * 
	 * log.info(result);
	 * 
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void testBoardDelete() { log.info(boardDao.boardDelete(62)); }
	 */
	 
	
	/*
	 * @Test public void testBoardList() { BoardVO bvo = new BoardVO();
	 * bvo.setPageNum(1); bvo.setAmount(10);
	 * 
	 * bvo.setSearch("b_title"); bvo.setKeyword("명언");
	 * 
	 * 
	 * List<BoardVO> list = boardDao.boardList(bvo); for(BoardVO vo : list) {
	 * log.info(vo); }
	 * 
	 * 
	 * }
	 */
	

	 
}
