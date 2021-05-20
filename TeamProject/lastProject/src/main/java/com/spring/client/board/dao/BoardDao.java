package com.spring.client.board.dao;

import java.util.List;
import com.spring.client.board.vo.BoardVO;

public interface BoardDao {
	public List<BoardVO> boardList(BoardVO bvo); // 매개변수는 검색을 위해 미리 설정 해둔다. 
	public int boardInsert(BoardVO bvo);
	public BoardVO boardDetail(BoardVO bvo);
	public int pwdConfirm(BoardVO bvo);
	public int boardDelete(int b_num);
	public int boardUpdate(BoardVO bvo);
}
