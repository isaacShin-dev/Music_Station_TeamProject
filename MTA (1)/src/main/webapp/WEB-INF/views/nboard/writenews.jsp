<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
      <meta charset="UTF-8" />
      <title>write폼</title>
      <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
       <!-- 합쳐지고 최소화된 최신 CSS -->
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
		
	  <!-- 부가적인 테마 -->
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
	 
	  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	  
	  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	  <script type="text/javascript"src="/resources/include/dist/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="/resources/include/js/common.js"></script>
	  <style type="text/css">
	  
	  
	  </style>
	  <script type="text/javascript">
	  	$(function(){
	  		var msg = "${errorMsg}";
	  		if(msg != ""){
	  			alert(msg);
	  		}
	  		
	  		$("#newsInsertBtn").click(function(){
	  			if(!chkData("#n_title","뉴스제목을"))	return;
	  			else if(!chkData("#n_note","뉴스부제목"))	return;
	  			else if(!chkData("#n_text","뉴스글"))	return;
	  			else {
	  				$("#f_writeForm").attr({
	  					"method":"post",
	  					"enctype":"multipart/form-data",
	  					"action":"/nboard/insertnews"
	  				});
	  				$("#f_writeForm").submit();
	  			}
	  		});
	  		
	  		$("#newsCancelBtn").click(function(){
	  			$("#f_writeForm").each(function(){
	  				this.reset();
	  			});
	  		});
	  		
	  		$("#newsListBtn").click(function(){
	  			location.href="/nboard/listnews";
	  		});
	  			
		})
	</script>
   </head>
   <body>
   <div class="contentTB">
   		<form id="f_writeForm" name="f_writeForm">
   		<table>
   			
   		</table>
   		<h3>뉴스글</h3>
   		<div class="form-group has-success has-feedback">
		  <label class="control-label" for="inputSuccess2">뉴스제목</label>
		  <input type="text" class="form-control" id="n_title" name="n_title">
		  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
		  <span id="inputSuccess2Status" class="sr-only"></span>
		</div>
		<div class="form-group has-error has-feedback">
		  <label class="control-label" for="inputError2">파일첨부</label>
		 <input type="file" class="form-control" id="file" name="file">
		  <span class="glyphicon glyphicon-remove form-control-feedback"></span>
		  <span id="inputError2Status" class="sr-only"></span>
		</div>
		
		<div class="form-group has-error has-feedback">
		  <label class="control-label" for="inputError2">뉴스부제목</label>
		  <input type="text" class="form-control" id="n_note" name="n_note">
		  <span class="glyphicon glyphicon-remove form-control-feedback"></span>
		  <span id="inputError2Status" class="sr-only"></span>
		</div>
		<div class="form-group has-warning has-feedback">
		  <label class="control-label" for="inputWarning2">뉴스기사</label>
		  <input type="text" class="form-control" id="n_text" name="n_text">
		  <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
		  <span id="inputWarning2Status" class="sr-only"></span>
		</div>
		
		<div class="form-group has-error has-feedback">
			<input type="button" class="form-control" id="newsInsertBtn" name="newsInsertBtn" value="작성"/>
			<input type="reset" class="form-control" id="newsCancelBtn" name="newsCancelBtn" value="취소"/>
			<input type="button" class="form-control" id="newsListBtn" name="newsListBtn" value="목록"/>
		
		</div>
		</form>
	</div>
		
	
   </body>
</html>