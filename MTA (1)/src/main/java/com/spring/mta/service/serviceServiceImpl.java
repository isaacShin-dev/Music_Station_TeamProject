package com.spring.mta.service;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.mta.vo.serviceVO;
import com.spring.mta.dao.serviceDao;
import lombok.Setter;


@Service
public class serviceServiceImpl implements serviceService{
	
	@Setter(onMethod_ =@Autowired )
	private serviceDao sboardDao;

	@Override
	public List<serviceVO> serviceboardList(serviceVO sbvo) {
		// TODO Auto-generated method stub
				List<serviceVO> list = null;
				list = sboardDao.serviceboardList(sbvo);
				return list;
	}

	@Override
	public int serviceboardListCnt(serviceVO sbvo) {
		// TODO Auto-generated method stub
		return sboardDao.serviceboardListCnt(sbvo);
	}

	@Override
	public serviceVO serviceboardDetail(serviceVO sbvo) {
		// TODO Auto-generated method stub
		serviceVO detail = null;
		detail = sboardDao.serviceboardDetail(sbvo);

		
		//fboardDao.freeRecomment(bvo.getF_no());
		if(detail!=null) {
			detail.setScb_text(detail.getScb_text().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	@Override
	public int serviceboardInsert(serviceVO sbvo) {
		int result = 0;

		result = sboardDao.serviceboardInsert(sbvo);
		return result;
	}

	@Override
	public int serviceboardDelete(int num) {
		// TODO Auto-generated method stub
		int result = 0;
		result = sboardDao.serviceboardDelete(num);
		return result;
	}

	@Override
	public serviceVO serviceUpdateForm(serviceVO sbvo) {
		serviceVO detail = null;
		detail = sboardDao.serviceboardDetail(sbvo);
		return detail;
		
	}

	@Override
	public int serviceboardUpdate(serviceVO sbvo) {
		int result = 0;

		result = sboardDao.serviceboardUpdate(sbvo);
		return result;
	}


	


}
