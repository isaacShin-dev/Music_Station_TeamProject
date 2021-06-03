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
		
		<link href="/resources/include/css/leftslide.css" rel="stylesheet"/>
		<link href="/resources/include/css/mainpage/main_login.css" rel="stylesheet"/>
		<link href="/resources/include/css/mainpage/mainhome.css" rel="stylesheet"/>
		<link href="/resources/include/css/mainpage/footer.css" rel="stylesheet" />
	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    <!-- <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script> -->
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js">
      </script>
	    	<script type="text/javascript">
      var clicks = 0;
		$(function() {
			
			
			$(".music_cat").click(function() {
				$("#m_genre").val($(this).html());
					
				
				
				$("#cat_form").attr({
					"method" : "GET",
					"action" : "/board/boardList"

				});
				$("#cat_form").submit();
			});
				/* 사인업 버튼 */
				 $("#mypagelogin").click(function(){
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
				 $("#main_page").click(function(){
					  $(".inner").removeClass("open");
				  });
				  
				
				 /* 마이페이지 버튼 */
				  $("#login_button").click(function(){
		    		  $("#mypage").addClass("open");
		    	  });
				  
				  /* 마이페이지 버튼 */
		    	  $("#my_page").click(function(){
		    		$("#mypage").removeClass("open");
		    	  });
				  $("#mypagebutton").click(function(){
					  $("#mypage").addClass("open");
				  });
				  //마이페이지 이동
				  $("#mypage_board").click(function(){
		    		  console.log("클릭");
		    			$("#mypageform").attr({
		    				"method" : "post",
		    				"action" : "/mainpage/mypage"
		    			});
		    	     	$("#mypageform").submit();
		    	       
		    	    });
				  
				  $("#mtaintro").click(function(){
					  location.href = 'eventintro';
				  });
				  $("#introhomepage").click(function(){
					 location.href = '/';
				  });
				  $(".mainpagebutton").click(function(){
					  location.href = 'mainpagenotlogin';
				  });
				  $("#mypage_shopping").click(function(){
					location.href = 'cart';  
				  });
				
				 
		});
    
  
     </script>
	    <style type="text/css">

	    </style>
	</head>
	<body>
	
	    <!-- Fixed navbar -->
	    <nav class="navbar navbar-default">
	    	<tiles:insertAttribute name = "header" />
	    </nav>
	
	    <!-- Begin page content -->
	    <div class="container">
	      <div class="page-header">
	      </div>
	      <tiles:insertAttribute name = "body" />
	    </div>
	      
	    <footer class="footer">
	     	<tiles:insertAttribute name="footer" />
	    </footer>
	</body>
</html>
