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
						   <h3 id="music_font">Ballad</h3>
						  
						   <h3 id="music_font">Rock</h3>
						
						   <h3 id="music_font">R&B</h3>
						 
						   <h3 id="music_font">New Age</h3>
						 
						   <h3 id="music_font">Rap/Hiphop</h3>
						   <br><br><hr>
						   <br>
						   <h3 id="music_font">News Board</h3>
						  
						   <h3 id="music_font">Community</h3>
						   <h3 id="music_font">About</h3>
					   </div>
				 </div>
				 <div id=mainhomepagecategori>
		<form id="mainnpageform">		 
		<div id="topcategori">
			<div id="leftcategori">
				<a class="block">  |  </a>
				<a id="mtaintro" class="topmainpagebutton">MTA 소개</a>
				<a class="block">  |  </a>
				<a id="introhomepage"class="topmainpagebutton">MTA Intro</a>
				<a class="block">  |  </a>
			</div>
			<div id="rightcategori">	
				<a class="block">  |  </a>
				<a  id=mypagelogin class="topmainpagebutton">Login</a>
				<a class="block">  |  </a>
				<a  id=mypagebutton class="topmainpagebutton">MyPage</a>
				<a class="block">  |  </a>
				<a class="topmainpagebutton">Customer Service Center</a>
				<a class="block">  |  </a>
				<a class="topmainpagebutton">Notice</a>	
				<a class="block">  |  </a>
			</div>
		</div>
		</form>
				 <!-- 메인페이지 제목-->
		<div id="buttoncategori">
			<div id="buttoncategoriserve">
				<h1 id="homepage_name" class="mainpagebutton">Music TradeAssociate</h1>
				<p id="homepage_servename">Sell or Buy Various Genres Of Music and Copyrights!</p>
			</div>
		</div>	
	</div>
	<hr>
				 

		 <!-- 우측 슬라이드바  -->
		 	<label class="inner" id="inner" onclick="click_page" >
		 	<div id="logindiv">
  				<div id="main_page">
  					
  				</div>
 				<br><br> 			
  				<h1 id="mypagefont">Sign Up</h1>
  				<br><br><hr><br>
  				<div id="idpwddiv">
  				<form name="loginform" id="loginform">
  					<p id="idpwd">ID</p>
  					<input type="text" class="login" id="id_login">
  					<p id="idpwd">Passward</p>
  					<input type="password" class="login"  id="psw_login">
  				<br><br>
  				<input type="button" class="login_button" id="login_button" value="Log In">
  				</form>
  				<br />
  				<br>
  				<a   class="sign_upbutton" id="new_login">Membership</a>
  				<a   class="sign_upbutton" id="id.pwd">ID/Password Search</a>
  				</div>
  			</div>
  			</label>
  			<div id="mypage">
  				<form name="mypageform" id="mypageform">
  				<div id="my_page">	
  					</div>  
  				<br><br>
  				<h1 id="mypagefont">MyPage</h1>
 				<br><br><hr><br>
 				<input type="button" id="mypage_board" class="button" value="Membership Information">
 				<br><br>
 				<input type="button" id="mypage_vente" class="button" value="Sales Inquiry">
 				<br><br>
 				<input type="button" id="mypage_purchase" class="button" value="Purchase List">
 				<br><br>
 				<input type="button" id="mypage_shopping" class="button" value="Shopping Basket">
 				<br><br>
 				<input type="button" id="mypage_about" class="button" value="Customer Service Center">
 				</form> 
  				</div>
  				