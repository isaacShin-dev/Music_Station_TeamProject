package com.spring.mta.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.mta.dao.mcommentDao;

import com.spring.mta.vo.mcommentVO;

import lombok.Setter;

@Service
public class mcommentServiceImpl implements mcommentService{

	@Setter(onMethod_ =@Autowired )
	private mcommentDao mcDao;
	
	@Override
	public List<mcommentVO> mcommentList(mcommentVO mco) {
		// TODO Auto-generated method stub
		List<mcommentVO> list = null;
		list = mcDao.mcommentList(mco);
		
		return list;
	}

	@Override
	public int mcommentInsert(mcommentVO mco) {
		int result = 0;
				
		result = mcDao.mcommentInsert(mco);
		return result;
	}

	@Override
	public int mcommentDelete(int num) {
		
			int result = 0;
			result = mcDao.mcommentDelete(num);
			return result;
		
	}

}
