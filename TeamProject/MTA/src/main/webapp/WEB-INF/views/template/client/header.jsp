<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
//장르별 이동
$(".music_genre").click(function() {
	$("#m_genre").val($(this).html());
		
	console.log($(this).html());
	var sk = $(this).html();
	$("#cat_form").attr({
		"method" : "GET",
		"action" : "/mboard/boardList"

	});
	$("#cat_form").submit();
});
</script>
        <!--좌측 슬라이드바  -->
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
                     <h3 id="music_font" class="music_genre">Ballad</h3>
                    
                     <h3 id="music_font" class="music_genre">Electronic</h3>
                  
                     <h3 id="music_font" class="music_genre">RnB</h3>
                   
                     <h3 id="music_font" class="music_genre">NewAge</h3>
                   
                     <h3 id="music_font" class="music_genre">Rap/Hiphop</h3>
                     <br><br><hr>
                     <br>
                     <h3 id="music_font" onclick="location.href='/nboard/listnews'">News Board</h3>
                    
                     <h3 id="music_font" class="community">Community</h3>
                     <h3 id="music_font" onclick="location.href='/sboard/serviceCenter'">About</h3>
                  </div>
             </div>
             <div id=mainhomepagecategori>
      <form id="mainnpageform">       
      <div id="topcategori">
         <div id="leftcategori">
            <span class="block">  |  </span>
            <span id="mtaintro" class="topmainpagebutton">MTA 소개</span>
            <span class="block">  |  </span>
            <span id="introhomepage"class="topmainpagebutton">MTA Intro</span>
            <span class="block">  |  </span>
         </div>
         <div id="rightcategori">   
            <span class="block">  |  </span>
            <c:choose>
            	<c:when test="${not empty userInfo.user_id }">
            	 	<span  id=mypagebutton class="topmainpagebutton">MyPage</span>
            	</c:when>
            	<c:otherwise>
            		<span  id=mypagelogin class="topmainpagebutton">Login</span>
            	</c:otherwise>
            </c:choose>
            
        <!--     <span class="block">  |  </span> -->
            
            <span class="block">  |  </span>
            <span class="topmainpagebutton" onclick="location.href='/sboard/serviceCenter'">Customer Service Center</span>
            <span class="block">  |  </span>
            <span class="topmainpagebutton" onclick="location.href='/board/freeboard'">Notice</span>   
            <span class="block">  |  </span>
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
          <label class="inner" id="inner" >
          <div id="logindiv">
              <div id="main_page">
                 
              </div>
             <br><br>          
              <h1 id="mypagefont">Sign in</h1>
              <br><br><hr><br>
              <div id="idpwddiv">
              <form name="loginform" id="loginform">
                 <p id="idpwd">ID</p>
                 <input type="text" class="login" name="user_id" id="user_id">
                 <p id="idpwd">Passward</p>
                 <input type="password" class="login" name="user_passwd" id="user_passwd">
              <br><br>
              <input type="button" class="login_button" id="login_button" name="login_button" value="Log In">
              </form>
              <br />
              <br>
              <a  href="/user/Accept" class="sign_upbutton" id="new_login" >Sign up</a>
              <a  href="/user/useridfind" class="sign_upbutton" id="id.pwd">ID Search</a>/
              <a  href="/user/userpwfind" class="sign_upbutton" id="id.pwd">Password Search</a>
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
             <input type="button" id="mypage_shopping" class="button" onclick="location.href='/order/cartList'" value="Shopping Basket">
             <br><br>
 			 <input type="button" id="mypage_logout" class="button" value="log Out">
             </form> 
              </div>
              