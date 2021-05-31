package com.spring.client.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mta.board.dao.MusicBoardDao;
import com.spring.mta.board.vo.MusicBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import java.sql.Connection;
import javax.sql.DataSource;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ =@Autowired)
	private MusicBoardDao boardDao ;
	
//	@Test
//	public void recentTest() {
//		List<MusicBoardVO> mvoList = null ;
//		
//		MusicBoardVO mvo = new MusicBoardVO();
//		
//		mvoList = boardDao.musicRecentList(mvo);
//		 
//		for(MusicBoardVO vo : mvoList) {
//			log.info(vo);
//		}
//	 update music_board
//	    set m_title = #{m_title}
//	    , m_name = #{m_name}
//	    ,m_no = #{m_no}
//	    ,user_id = #{user_id}
//	    ,m_coverimage =#{m_coverimage}
//	    ,m_bpm = #{m_bpm}
//	    , m_explain = #{m_explain}
//	    ,m_file =#{m_file}
//	    ,m_price =#{m_price}
//	    ,m_isfree =#{m_isfree}
//	    ,m_genre =#{m_genre}
//	    , m_regdate = sysdate
//	    Where m_no = #{m_no}

	
	@Test
	public void updateTest() {
		MusicBoardVO mvo = new MusicBoardVO();
		
		int result  =0;
		
		mvo.setM_title("update test");
		mvo.setM_name("updatetest");
		mvo.setM_no(81);
		mvo.setUser_id("test");
		mvo.setM_coverimage("test.jpg");
		mvo.setM_bpm(20);
		mvo.setM_explain("testtsets update");
		mvo.setM_file("testupdate.mp3");
		mvo.setM_isfree(0);
		mvo.setM_genre("hiphop");
		
		
		
		
		result = boardDao.mBoardUpdate(mvo);
		
		log.info("result : "+result);
	}
	
	
	
	

//	@Test
//	public void recommendTest() {
//		MusicBoardVO mvo = new MusicBoardVO();
//		
//		mvo.setM_no(57);
//		
//		int result = boardDao.recommend(mvo);
//		
//		log.info("result : "+result );
		
		
		
	
	/*
	 * @Test public void testBoardList() { BoardVO bvo = new BoardVO();
	 * List<BoardVO> list = boardDao.boardList(bvo); for(BoardVO vo : list) {
	 * log.info(vo); } }
	 */
//	@Test
//	public void testBoardList() {
//		MusicBoardVO mvo = new MusicBoardVO();
//		mvo.setM_no(1);
//		List<MusicBoardVO> list  = boardDao.musicBoardList(mvo);
//		
//		for(MusicBoardVO vo : list) {
//			log.info(vo);
//		}
//		
//	}
//	
	
//	@Setter(onMethod_ = @Autowired)
//	private DataSource dataSource;
//	
//	
//	@Setter(onMethod_ =@Autowired)
//	private SqlSessionFactory sqlSessionFactory;
//	
//	@Test
//	public void testConnection() {
//		
//		try(Connection con = dataSource.getConnection()){
//			log.info(con);
//			log.info("----------------------------");
//			log.info("데이터베이스에 정상 연결 되었습니다.");
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}

	
//
//	  @Test 
//	  public void testBoardInsert() { MusicBoardVO board = new MusicBoardVO();
//	  log.info("insert 메서드 호출 ");
//	  board.setM_name("daotest"); 
//	  board.setM_title("daotest1");
//	  board.setM_coverimage("/imgage/22.jpg"); 
//	  board.setM_bpm(123);
//	  board.setM_explain("tets sdfsdaf");
//	  board.setM_file("file/ddddfsdd");
//	  board.setUser_id("test");
//	  board.setM_price("12,222");
//	  board.setM_isfree(1);
//	  board.setM_genre("ballad");
//	  
//	  int  count = boardDao.musicBoardInsert(board);
//	  log.info("insert Count : "+ count); 
//	  
//	  }
	
	
//	@Test
//	public void testdetailBoard() {
//		MusicBoardVO mvo = new MusicBoardVO();
//		
//		mvo.setM_no(17);
//		
//		MusicBoardVO board = boardDao.boardDetail(mvo);
//		
//		log.info(board.toString());
//		
//	}
	  
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
	 * bvo.setB_title("����Ȯ��"); bvo.setB_content("������ �����ϴ� ������ �ùٸ��� �۵��ϴ��� �˾ƺ���.");
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
	 
	 
}
