<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
      <link rel="shortcut icon" href="/resoures/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      
      <script src
      ="../js/html5shiv.js"></script>
      <![endif]-->
      <link rel="stylesheet" href="/resources/include/css/intro/intromusic.css"/>
      <title>MTA 소개.</title>

   </head>
   <body>
   		<video id=introvideo src="/resources/video/musicmta.mp4" controls autoplay></video>
   		<a href="/mainpage/mainpage" id="gohomepage">Main Home</a>
   </body>
</html>