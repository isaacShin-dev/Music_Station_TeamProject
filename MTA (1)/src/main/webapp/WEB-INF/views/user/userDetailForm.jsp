<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="/resources/image/icon.png" />
    <link rel="apple-touch-icon" href="/resources/image/icon.png" />
    <!-- 모바일 웹 페이지 설정 끝 -->

    <!--[if lt IE 9]>
        <script src="../js/html5shiv.js"></script>
         <![endif]-->

    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        
        $(function() {
                    $("#update_mypage").click(function() {
               		location.href = "/user/userUpdateForm";
               		
               		});
                   
                   
        }); 
  </script>


<title>마이페이지</title>
</head>
<body>
   <div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <div class="w3-center w3-large w3-margin-top">
            <h3>마이 페이지</h3>
         </div>
		  <div>
            <form id="usercheckForm">
               <p>
                  <label>아 이 디</label> 
            
                     <p class="w3-input" ><c:out value="${userInfo.user_id}"/></p> 
                  <span id="id_check" class="w3-text-red"></span>
               </p>
               <p>
                  <label>비 밀 번 호</label> 
                     <p class="w3-input" ><c:out value="${userInfo.user_passwd}"/></p> 
               </p>
               <p>
                  <label>이 름</label> 
                     <p class="w3-input" ><c:out value="${userInfo.user_name}"/></p>  
               </p>
               <p>
                  <label>휴 대 폰  번 호</label> 
                     <p class="w3-input" ><c:out value="${userInfo.user_phone}"/></p>  
               </p>
               <p>
                  <label>이 메 일</label>
                     <p class="w3-input" ><c:out value="${userInfo.user_email}"/></p> 
                  <span id="email_check" class="w3-text-red"></span>
               </p>
               <p>
                     <label>좋아하는 장르</label>
                     <p class="w3-input" ><c:out value="${userInfo.user_favorite}"/></p> 
                </p>
                 <p>
                    <label>회 원 가 입 날 짜</label>
                     <p class="w3-input" ><c:out value="${userInfo.user_regdate}"/></p>   
                 </p>
                  <p>
                   <label>이미지 사진
                   </label>
                     <p><img class="w3-input" src="/uploadStorage/user/${userInfo.profile_image}" /></p>    
                 </p> 
        
               <p class="w3-center">
                  <button type="button" id="update_mypage" name="update_mypage" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">
                  회원정보 수정</button>
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">
                  Cancel</button>
               </p>
            </form>
         </div>
      </div>
   </div>
</body>
</html>