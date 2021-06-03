package com.spring.mta.service;



import com.spring.mta.vo.UserVO;


public interface UserService {

	public UserVO login(UserVO uvo);
	public int userUpdate(UserVO uvo) throws Exception;
	
	public int userInsert(UserVO uvo);
	//아이디 중복확인
	public int userIdCheck(UserVO uvo);
	//아이디찾기
	public String userFindId(UserVO uvo);
	//비밀 번호 찾기
	public String userFindPwd(UserVO uvo);
	

}
