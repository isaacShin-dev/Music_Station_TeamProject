package com.spring.mta.dao;
import com.spring.mta.vo.ReplyVO;
import java.util.List;





public interface ReplyDao {

	public  List<ReplyVO> replyList(Integer n_no);
	public int replyInsert(ReplyVO rvo);
	public int replyCnt(int n_no);
	public ReplyVO replySelect(Integer nc_no);
	public int ReplyUpdate(ReplyVO rvo);
	public int replyDelete(Integer nc_no);
	public int replyChoiceDelete(int n_no);
	
	
	

	
	

}
