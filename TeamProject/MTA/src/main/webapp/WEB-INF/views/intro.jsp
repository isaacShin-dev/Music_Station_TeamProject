<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<html>
   <head>
   
      <meta charset="UTF-8" />
      <!-- html4 : 파일의 인코딩 방식 지정 -->
      <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->
	
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
    	  
      <script src ="../js/html5shiv.js"></script>
      <![endif]-->
      <title>INTRO</title>
      
      
      <link rel="stylesheet" href="/resources/include/css/intro/leftslide.css"/>
      <link rel="stylesheet" href="/resources/include/css/intro/intro.css"/>
      <link rel="stylesheet" href="/resources/include/css/intro/intrologin.css"/>
      <title>MTA에 오신걸 환영합니다.</title>
      <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js">
      </script>
      <script type="text/javascript">
      var clicks = 0;
     
		$(function() {
			
			
			if('${errMsg}' != ""){
				alert('${errMsg}');
				
			}
			 	/* 자유 게시판으로 이동 */
				$(".community").click(function() {
					location.href="/board/freeboard"
				});
			 				
				/* 음악 게시판으로 이동(Ballad)*/
				$(".music_genre").click(function() {
					location.href="/mboard/boardList"
				});
				
				/* 로그 아웃 */
				$("#mypage_logout").click(function() {
					location.href="/user/logout";
					alert("로그아웃 되었습니다.");
				});
			
				
				$(".music_genre").click(function() {
					$("#m_genre").val($(this).html());
					console.log($(this).html());
					$("#cat_form").attr({
						"method" : "GET",
						"action" : "/mboard/boardList"

					});
					$("#cat_form").submit();
				});
							
			 				
				/* 로그인 버트 */
				$("#login_button").click(function() {
					$("#loginForm").attr({
						"method" : "post",
						"action" : "/user/login"
					});
					
					$("#loginForm").submit();
									
					
				});
			
				console.log('${userInfo.user_id}');
				
				/* 사인업 버튼 */
				 $("#login_page").click(function(){
					
					 if('${userInfo.user_id}' ==  ""){
						 if (clicks == 0) {
			    			  $(".inner").addClass("open");
			    			  clicks++;
			    			  console.log(clicks);
			    		  }else{
			  				
			 				 $(".inner").removeClass("open");
			 		    	
			 				 clicks--;
			 				console.log(clicks);
			 			 }
					 } 

							if('${userInfo.user_id}' !=  ""){
							 if (clicks == 0) {
				    			  $("#mypage").addClass("open");
				    			  clicks++;
				    			  console.log(clicks);
				    		  }else{
				    			  $("#mypage").removeClass("open");
				    			  clicks--;
				    		  }
						 }
							
						
					 });
			
				
			 		
					 $("#mypage_board").click(function() {
						
						 location.href = "/user/userDetailForm";
					});
					 
					 
					  /* 상단x 버튼 */
			    	  $("#my_page").click(function(){
			    		//location.href='/';
			    		  $("#mypage").removeClass("open");
			    	  });
					
					/* 안어 클래스 엑스div */
					 $("#intro_page").click(function(){
						  $(".inner").removeClass("open");
					  });
					  		
					
					 if('${userInfo.user_id}' !=  ""){
						 $("#login_page").text('mypage');
					 }
					 
					 /* 메인 페이지로 이동*/
					 $("#main_home").click(function name() {
						location.href="/mainpage/mainpage";
					});
					 
		    	  }); // onload function 종료
				 
						
			
		    					
			

     </script>
   </head>
   <body>
   	<input type="checkbox" id="menuicon">
   	<label for="menuicon">
   		<span></span>
   		<span></span>
   		<span></span>
   	</label>
   	<div class="sidebar">
   	 <div class="categori">
   	 <form id ="cat_form" ><input type ="hidden" name ="m_genre" id ="m_genre" />
   	</form>
   	 	<h3 id="Ballad" class="music_genre">Ballad</h3>
   	 	<br>
   	 	<h3 id="Rock" class="music_genre">Electronic</h3>
   	 	<br>
   	 	<h3 id="R&B" class="music_genre">RnB</h3>
   	 	<br>
   	 	<h3 id="New_Age" class="music_genre">NewAge</h3>
   	 	<br>
   	 	<h3 id="Rap/Hiphop" class="music_genre">Rap/Hiphop</h3>
   	 	<br><br><hr>
   	 	<br><br>
   	 	<h3 onclick="location.href='/nboard/listnews'">News Board</h3>
   	 	<br>
   	 	<h3 id="" class="community">Community</h3>
   	 	<br>
   	 	<h3 onclick="location.href='/sboard/serviceCenter'">About</h3>

   	 </div>
   	</div>
  	<img src="/resources/image/logo_main.png" id="main_logo">	
  	<div id="login.page">	
  		<h1 id="main_name">Music Trade Associate</h1>
  
         
  		<h3 id="main_survename">A record label for creators</h3></br>
  		<a  class="myButton" id="main_home">Open Main Home</a>
  		<a href="#" class="myButton" id="login_page" >Sign up</a>
  		<video id="video" src="/resources/video/highlight.mp4" width="600" controls autoplay></video>
  		<label class="inner" id="inner" >
  		
  			<div id="logindiv" />
  				<div id="intro_page">
  				</div>
 				<br><br> 			
  				<h1>Sign Up</h1>
  				<br><br><hr><br>
  				<div id="idpwddiv">
  					<form id="loginForm" name="loginForm">
	  					<p id="idpwd">ID</p>
	  					<input type="text" class="login" id="user_id" name="user_id" >
	  					<p id="idpwd">Password</p>
	  					<input type="password" class="login"  id="user_passwd" name="user_passwd">
  					</form>
  				<br><br>
  					<input type="button" id="login_button" name="login_button" class="button" value="Log In">
  				<br />
  				<br>
  				<a href='/user/Accept' class="new_login" id="new_login" >회원가입</a>
  				<a href="/user/useridfind" class="id.pwd" id="id.pwd" >아이디찾기</a>/
  				<a href="/user/userpwfind" class="id.pwd" id="id.pwd">비밀번호찾기</a>
  				</div>
  			</div>
  		</label>	
  		
  			<div id="mypage">
  				<div id="my_page">	
  				
  				</div>   
  				<br><br>
  				<h1 id="mypagefont">MyPage</h1>
 				<br><br><hr><br>
 				<input type="button" id="mypage_board" class="button" style="width:470px;" value="Membership Information">
 				<br><br>
 				<input type="button" id="mypage_sell" class="button" style="width:470px;" value="Sales Inquiry">
 				<br><br>
 				<input type="button" id="mypage_purchase" class="button" style="width:470px;" value="Purchase List">
 				<br><br>
 				<input type="button" id="mypage_shopping" class="button" style="width:470px;" onclick="location.href='/order/cartList'"value="hopping Basket">
 				<br><br>
 				<input type="button" id="mypage_logout" class="button" style="width:470px;" value="log Out">

  				</div>
  			</div>		
  		<div class="sidebar1">
  		</div>
  		<nav>
 			<audio src="/resources/audio/01.mp3" controls autoplay loop></audio>
  		</nav>
  	</div>
   </body>
</html>