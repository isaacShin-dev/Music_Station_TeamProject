package com.spring.mta.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.dao.fcommentDao;
import com.spring.mta.vo.fcommentVO;


import lombok.Setter;

@Service
public class fcommentServiceImpl implements fcommentService{

	@Setter(onMethod_ =@Autowired )
	private fcommentDao fcDao;
	
	@Override
	public List<fcommentVO> fcommentList(fcommentVO fco) {
		// TODO Auto-generated method stub
		List<fcommentVO> list = null;
		list = fcDao.fcommentList(fco);
		
		return list;
	}

	@Override
	public int fcommentInsert(fcommentVO fco) {
		int result = 0;
				
		result = fcDao.fcommentInsert(fco);
		return result;
	}

	@Override
	public int fcommentDelete(int num) {
		
			int result = 0;
			result = fcDao.fcommentDelete(num);
			return result;
		
	}

}
