<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
      <link rel="shortcut icon" href="../image/icon.png" />
      <link rel="apple-touch-icon" href="../image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      
      <script src ="../js/html5shiv.js"></script>
      <![endif]-->
    	<link href="/resources/include/css/leftslide.css" rel="stylesheet"/>
		<link href="/resources/include/css//intro/intro.css" rel="stylesheet"/>
		<link href="/resources/include/css/intro/intrologin.css" rel="stylesheet"/>
      <title>MTA에 오신걸 환영합니다.</title>
      <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js">
      </script>
      <script type="text/javascript">
      var clicks = 0;
		$(function() {
				/* 음악 게시판 바로가기   */
				$(".musicBoardMenu").click(function(){
					location.href = "/board/boardList";
				});
				
				/* 사인업 버튼 */
				 $("#login_page").click(function(){
		    		  if (clicks == 0) {
		    			  $(".inner").addClass("open");
		    			  clicks++;
		    			  console.log(clicks);
		    		  }else{
		  				
		 				 $(".inner").removeClass("open");
		 		    	
		 				 
		 				 clicks--;
		 				console.log(clicks);
		 			}
		    	  });
				 
				/* 안어 클래스 엑스div */
				 $("#intro_page").click(function(){
					  $(".inner").removeClass("open");
				  });
				  
				
				 /* 마이페이지 버튼 */
				  $("#login_button").click(function(){
		    		  $("#mypage").addClass("open");
		    	  });
				  
				  /* 마이페이지 버튼 */
		    	  $("#my_page").click(function(){
		    		location.href='/'; 
		    	  });
		});
    
  
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
   		<h3 class = "musicBoardMenu">Music Board</h3>
   	 	<h3>Ballad</h3>
   	 	<br>
   	 	<h3>Rock</h3>
   	 	<br>
   	 	<h3>R&B</h3>
   	 	<br>
   	 	<h3>New Age</h3>
   	 	<br>
   	 	<h3>Rap/Hiphop</h3>
   	 	<br><br><hr>
   	 	<br><br>
   	 	<h3>News Board</h3>
   	 	<br>
   	 	
   	 	<h3>Community</h3>
   	 	<br>
   	 	<h3>About</h3>

   	 </div>
   	</div>
  	<img src="/resources/include/img/logo_main.png" id="main_logo">	
  	<div id="login.page">	
  		<h1 id="main_name">Music Trade Associate</h1>
  		<h3 id="main_survename">A record label for creators</h3><br/>
  		<a href="/mainpage/mainpagenotlogin" class="myButton" id=main_home>Open Main Home</a>
  		<a href="#" class="myButton" id="login_page">Sign Up</a>
  		<video id="video" src="/resources/include/video/lostsky.mp4" width="600" controls autoplay></video>
  		<label class="inner" id="inner" >
  			<div id="logindiv">
  				<div id="intro_page">
  					
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
  			<div id="mypage">
  				<div id="my_page">	
  				</div>   
  				<br><br>
  				<h1>마이페이지</h1>
 				<br><br><hr><br>
 				<input type="button" id="mypage_board" class="mypage_shop" value="회원정보">
 				<br><br>
 				<input type="button" id="mypage_vente" class="mypage_shop" value="판매내역">
 				<br><br>
 				<input type="button" id="mypage_purchase" class="mypage_shop" value="구매내역">
 				<br><br>
 				<input type="button" id="mypage_shopping" class="mypage_shop" value="장바구니">
 				<br><br>
 				<input type="button" id="mypage_about" class="mypage_shop" value="고객센터">
  				</div>
  			</div>		
  		<div class="sidebar1">
  		</div>
  		<nav >
 			<audio src="/resources/include/audio/01.mp3" controls autoplay loop></audio>
  		</nav>
  	</div>
   </body>
</html>