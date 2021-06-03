<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

      <title></title>      
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap.min.css" />
       <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap-theme.css" />
       <style type="text/css">
       </style>
       <script type = "text/javascript"  src = "/resources/include/js/jquery-1.12.4.min.js"></script>
       <script type = "text/javascript"  src = "/resources/include/js/common.js"></script>
       <script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js"></script>
       <script type="text/javascript">
      
       		$(function(){
       			$("#findBtn").click(function(){
       				$.ajax({
       					url: "/user/findId",
       					type : "post",
       					data: $("#findIdForm").serialize(),
       					dataType : "text",
       					error : function(){
       						alert("error");
       					},
       					success: function(result){
       						if( result != '' ){
       							console.log(result);
       							alert(result);
       							location.href="/";
       						
       						}
       						else{
       							console.log(result)
       							//console.log('${data.user_id}');
       							//alert('${data.user_id}');
       							alert("잘못됬음");
       						}
       					}
       				
       				});
       				
       			});
       		 
       		});
       </script>
	</head>
	<body>
		<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form id = "findIdForm">
				<div class="w3-center w3-large w3-margin-top">
					<h3>Id</h3>
				</div>
				<div>
					<p>
						<label>name</label>
						<input class="w3-input" type="text" id="user_name" name="user_name">
					</p>
					<p>
						<label>Email</label>
						<input class="w3-input" type="text" id="user_email" name="user_email">
					</p>
					<p class="w3-center">
						<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
	
	
	</body>
</html>