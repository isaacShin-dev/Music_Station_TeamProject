<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>


     	<!--좌측 슬라이드바  -->
			  <input type="checkbox" id="menuicon">
			  <label for="menuicon">
				  <span></span>
				  <span></span>
				  <span></span>
			  </label>
				  <div class="sidebar">
					   <div class="categori">
						   <h3>Ballad</h3>
						  
						   <h3>Rock</h3>
						
						   <h3>R&B</h3>
						 
						   <h3>New Age</h3>
						 
						   <h3>Rap/Hiphop</h3>
						   <br><br><hr>
						   <br>
						   <h3>News Board</h3>
						  
						   <h3>Community</h3>
						   <h3>About</h3>
					   </div>
				 </div>
				 <div id=mainhomepagecategori>
		<div id="topcategori">
			<div id="leftcategori">
				<a href="eventintro.html" class="1">MTA 소개</a>
				<a href="#" id="introhomepage"class="1">MTA Intro</a>
			</div>
			<div id="rightcategori">	
				<a href="#" id=mypagelogin>로그인</a>
				<a href="/template/client/mainLayout" id=mypagebutton>마이페이지</a>
				<a href="#">고객센터</a>
				<a href="#">공지사항</a>	
			</div>
		</div>
				 <!-- 메인페이지 제목-->
		<div id="buttoncategori">
			<div>
				<h1>MTA에 오신걸 환영합니다.</h1>
				<p>각종 다양한 장르인 음악과 저작권을 팔거나 구입하세요!</p>
			</div>
		</div>	
	</div>
	<hr>
	</br><br></br></br>
				 

		 <!-- 우측 슬라이드바  -->
		 	<label class="inner" id="inner" onclick="click_page">
		 	<div id="logindiv">
  				<div id="main_page">
  					
  				</div>
 				<br><br> 			
  				<h1>Sign Up</h1>
  				<br><br><hr><br>
  				<div id="idpwddiv">
  					<p id="idpwd">ID</p>
  					<input type="text" class="login" id="id_login">
  					<p id="idpwd">Passward</p>
  					<input type="password" class="login"  id="psw_login">
  				<br><br>
  				<input type="button" id="login_button" value="Log In">
  				<br />
  				<br>
  				<a href="#" class="new_login" id="new_login">회원가입</a>
  				<a href="#" class="id.pwd" id="id.pwd">아이디/비밀번호 찾기</a>
  				</div>
  			</div>
  			</label>