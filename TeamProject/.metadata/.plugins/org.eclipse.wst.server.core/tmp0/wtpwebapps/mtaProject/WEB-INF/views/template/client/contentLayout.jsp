<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <link rel="icon" href="/resources/include/image/icon.png">
	
	    <title><tiles:getAsString name = "title" /></title>
				<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css">

		<script type="text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
		
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"src ="/resources/include/js/common.js"></script> 
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    	<link href="/resources/include/css/mainpage/mainhome.css" rel="stylesheet"/>
    <link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet">
		<link href="/resources/include/css/leftslide.css" rel="stylesheet"/>
		<link href="/resources/include/css/mainpage/main_login.css" rel="stylesheet"/>
	
	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    	<script type="text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	 <script type="text/javascript">
      var clicks = 0;
		$(function(){
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
		    		location.href='intro.html'; 
		    	  });
				 
		});
    
  
     </script> 
	<body>
	
	    <!-- Fixed navbar -->
	    <nav class="navbar navbar-default ">
	    	<tiles:insertAttribute name = "header" />
	    </nav>
	
	    <!-- Begin page content -->
	    <div class="container">
	      <div class="page-header">
	        <h1><tiles:getAsString name="title" /></h1>
	      </div>
	      <tiles:insertAttribute name = "body" />
	    </div>
	      
	    <footer class="footer-default">
	     	<tiles:insertAttribute name="footer" />
	    </footer>
	</body>
</html>
