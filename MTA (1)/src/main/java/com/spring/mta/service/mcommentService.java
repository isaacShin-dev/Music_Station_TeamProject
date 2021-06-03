package com.spring.mta.service;

import java.util.List;



import com.spring.mta.vo.fcommentVO;
import com.spring.mta.vo.mcommentVO;


public interface mcommentService {

	public List<mcommentVO> mcommentList(mcommentVO mco);
	public int mcommentInsert(mcommentVO mco);
	public int mcommentDelete(int num);

}
