package com.spring.mta.service;

import java.util.List;



import com.spring.mta.vo.fcommentVO;


public interface fcommentService {

	public List<fcommentVO> fcommentList(fcommentVO fco);
	public int fcommentInsert(fcommentVO fco);
	public int fcommentDelete(int num);

}
