package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.client.board.dao.BoardDao;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardDao boardDao ;

	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> list = null; 
		list = boardDao.boardList(bvo);
		return list;
	}
	// ���Է� ����
	@Override
	public int boardInsert(BoardVO bvo) {
		int result = 0;
		result = boardDao.boardInsert(bvo);				
		return result;
	}
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		BoardVO detail =null;
		detail  = boardDao.boardDetail(bvo);
		if(detail!=null) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n","<br>"));
		}
		
		return detail;
	}
	
	//��й�ȣ Ȯ�� ����
	@Override
	public int pwdConfirm(BoardVO bvo) {
		int result =0;
		result = boardDao.pwdConfirm(bvo);
		return result;
	}
	@Override
	public BoardVO updateForm(BoardVO bvo) {
		BoardVO detail = null;
		detail = boardDao.boardDetail(bvo); //���� �������� ��ȣ�� �־�, ���� ������ �����;��Ѵ�.
		
		return detail;
	}
	@Override
	public int boardDelete(int b_num) {
		int result  =0;
		result = boardDao.boardDelete(b_num);
		return result;
	}
	@Override
	public int boardUpdate(BoardVO bvo) {
		int result =0;
		result = boardDao.boardUpdate(bvo);
		
		return result ;
	}
	@Override
	public int boardListCnt(BoardVO bvo) {

		return boardDao.boardListCnt(bvo);
	} 
	
	
}
