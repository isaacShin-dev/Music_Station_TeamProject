package com.spring.mta.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.common.file.FileUploadUtil;
import com.spring.mta.dao.UserDao;
import com.spring.mta.vo.UserVO;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{

	@Setter(onMethod_ = @Autowired)
	private UserDao userDao;
	
	@Override
	public UserVO login(UserVO uvo) {
		// TODO Auto-generated method stub
		UserVO userinfo = userDao.login(uvo);
		
		return userinfo;
	}

	@Override
	public int userUpdate(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		if(uvo.getProfile_file().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(uvo.getProfile_file(),"user");
			uvo.setProfile_image(fileName);
		}
		
		result = userDao.userUpdate(uvo);
		return result;
	}
	

	@Override
	public int userInsert(UserVO uvo) {
		// TODO Auto-generated method stub
		int result = 0;
		
		result = userDao.userInsert(uvo);
		return result;
		
	}
	//아이디 중복체크
	@Override
	public int userIdCheck(UserVO uvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = userDao.checkOverId(uvo);
		return result;
	}
	
	//아이디 찾기
	@Override
	public String userFindId(UserVO uvo) {
		// TODO Auto-generated method stub
		String result = "";
		result = userDao.userFindId(uvo);
		return result;
	}
	
	//비밀번호 찾기
	@Override
	public String userFindPwd(UserVO uvo) {
		// TODO Auto-generated method stub
		String result = "";
		result = userDao.userFindPwd(uvo);
		return result;
	}


	

}
