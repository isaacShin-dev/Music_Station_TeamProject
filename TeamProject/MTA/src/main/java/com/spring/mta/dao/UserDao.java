package com.spring.mta.dao;

import com.spring.mta.vo.UserVO;

public interface UserDao {

	public UserVO login(UserVO uvo);
	public int userUpdate(UserVO uvo);
	
	public int userInsert(UserVO uvo);
	//중복확인
	public int checkOverId(UserVO uvo);
	//아이디 찾기
	public String userFindId(UserVO uvo);
	//비밀번호 찾기
	public String userFindPwd(UserVO uvo);

}
