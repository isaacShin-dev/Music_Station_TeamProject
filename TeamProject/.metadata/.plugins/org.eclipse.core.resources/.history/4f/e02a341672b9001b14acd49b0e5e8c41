<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<html lang="ko">
	<head>
		
		<!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
		<meta charset="utf-8" />
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css">

		<script type="text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
		
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"src ="/resources/include/js/common.js"></script> 
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript">
			$(function(){
				$("#boardInsertBtn").click(function(){
					//입력값 체크 
					if(!chkData("#b_name","이름을"))return ;
					else if(!chkData("#b_title","제목을")) return;
					else if(!chkData("#b_content","내용을")) return ;
					else if(!chkData("#b_pwd","비밀번호를")) return ;
					else{
						$("#f_writeForm").attr({
							"method":"post",
							"action":"/board/boardInsert"
						});
						$("#f_writeForm").submit();
					}
				});
				
				//입력값 초기화
				$("#boardCancelBtn").click(function(){
					$("#f_writeForm").each(function(){
						this.reset();
					});
				});
				//목록 돌아가기
				$("#boardListBtn").click(function(){
					location.href = "/board/boardList";
				});
				
			});
		
		</script>

		<title>WriteForm.jsp</title>
	</head>
	<body>
		<div class ="container">
			<!-- 	<h2 class ="text-center">글작성</h2> -->
				
					<form id ="f_writeForm" >
						<table class= "table" >
							<tr >
								<td   class ="ac">작성자</td>
								<td><input type = "text" id = "b_name" name ="b_name"class ="form-control"/></td>
							</tr>
							<tr>
								<td class ="ac">글제목</td>
								<td><input type = "text" id = "b_title" name = "b_title" class ="form-control"/></td>
							</tr>
							<tr>
								<td class ="ac">글내용</td>
								<td><textarea cols="80px"rows="15px" id ="b_content" name = "b_content" class ="form-control" style="resize: none;"></textarea></td>
							</tr>
							<tr >
								<td class ="ac">비밀번호</td>
								<td><input type = "password" id = "b_pwd" name = "b_pwd" class ="form-control"/></td>
							</tr>
						</table>
						<div class ="text-center">
							<input type ="button" value ="저장" id = "boardInsertBtn" class ="btn btn-success" />
							<input type ="button" value = "취소" id = "boardCancelBtn" class = "btn btn-success"/>
							<input type ="button" value = "목록" id = "boardListBtn" class = "btn btn-success"/>
						</div>
					</form>
			</div>
	</body>
</html>