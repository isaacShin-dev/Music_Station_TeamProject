<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

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

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/images/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap-theme.css">

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>

<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>


<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<title></title>
<style type="text/css">
.coverImg{
	height: 700px;
	width: 700px;
}

</style>
<script type="text/javascript">
	let buttonCheck = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수 (비밀번호가 일치했을 때 )
	$(function() {

		$("#pwdChk").css("visibility", "hidden"); /* 화면에 보이진 않지만, 영역은 차지할 수 있도록.(div) */

		//수정버튼 클릭 시 처리 이벤트
		$("#updateFormBtn").click(function() {
			$("#pwdChk").css("visibility", "visible");
			$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "000099");
			buttonCheck = 1;
		});
		//삭제버튼 클릭 시 처리 이벤트
		$("#boardDeleteBtn").click(function() {
			$("#pwdChk").css("visibility", "visible");
			$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "000099");
			buttonCheck = 2;
		});

		//비밀번호 확인 버튼 클릭 시 처리 이벤트
		$("#pwdBut").click(function(event) {
			boardPwdConfirm();
		});
		$("#pwdButCancel").click(function() {
			$("#pwdChk").css("visibility", "hidden");
			buttonCheck = "";
			$("#passwd").val("");
		});
		
		$("#boardInsertBtn").click(function(){
			location.href = "/board/writeForm";
		});

		//목록 버튼 클릭 시 처리 이벤트
		$("#boardListBtn").click(function() {
			location.href = "/board/boardList";
		});

	});

	function boardPwdConfirm() {
		if (!chkData("#b_pwd", "비밀번호를"))
			return;
		else {
			$.ajax({
				url : "/board/pwdConfirm", //전송 rul
				type : "post",
				data : $("#f_pwd").serialize(),
				dataType : "text",
				error : function() {
					alert("시스템 오류, 관리자에게 문의 하세요.");
				},
				success : function(resultData) {
					var goUrl = "";
					if (resultData == "실패") {
						console.log(resultData);
						$("#msg").text("비밀번호를 확인해주세요."); 
						$("#b_pwd").select();
					} else if (resultData == "성공") {
						$("#msg").text("");
						console.log(resultData);
						if (buttonCheck == 1) { //수정
							goUrl = "/board/updateForm";
							$("#f_data").attr("action", goUrl);
							$("#f_data").submit();
						} else if (buttonCheck == 2) { //삭제
							if (confirm("정말 삭제하시겠습니까?")) {
								goUrl = "/board/boardDelete";
								$("#f_data").attr("action", goUrl);
								$("#f_data").submit();
							}
						}
					}
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="container">
	<form name= "f_data" id = "f_data" method="post">
				<input type ="hidden" name = "b_num" value ="${detail.m_no}"/>
				
			</form>		
		<div id="pwdChk" class="authArea  col-md-9 text-left">
			<form name="f_pwd" id="f_pwd" class="form-inline">
				<input type="hidden" name="b_num" id="b_num" value="${detail.m_no}">
				<label for="b_pwd" >비밀번호 : </label> <input
					type="password" name="b_pwd" id="b_pwd" class="form-control" />

				<button type="button" id="pwdBut" class="btn btn-default btn-sm">확인</button>
				<button type="button" id="pwdButCancel"
					class="btn btn-default btn-sm">취소</button>
				<span id="msg"></span>
			</form>
		</div>
		<div class="btnArea col-md-3 text-right">
			<button type="button" id="updateFormBtn"
				class="btn btn-primary btn-sm">수정</button>
			<button type="button" id="boardDeleteBtn"
				class="btn btn-primary btn-sm">삭제</button>
			<button type="button" id="boardInsertBtn"
				class="btn btn-primary btn-sm">쓰기</button>
			<button type="button" id="boardListBtn"
				class="btn btn-primary btn-sm">목록</button>
		</div>
		<div class="text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						
						<td class="col-md-3 text-left"><img src="/uploadStorage/coverImg/${detail.m_coverimage}" class = "coverImg"/></td>
						
					</tr>
					<tr>
						<td class="col-md-3">작성자</td>
						<td colspan="3" class="col-md-9 text-left">${detail.m_name}</td>
					</tr>

					<tr>
						<td class="col-md-3">글제목</td>
						<td colspan="3" class="col-md-9 text-left">${detail.m_title}</td>
					</tr>
					<tr>
						<td class="col-md-3">BPM</td>
						<td colspan="3" class="col-md-9 text-left">${detail.m_bpm}</td>
					</tr>
					<tr class="table-height">
						<td class="col-md-3">글내용</td>
						<td colspan="3" class="col-md-9 text-left">${detail.m_explain}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type = "button" class = "btn btn-success">구매</button>
				<button type = "button" class = "btn btn-success">장바구니 담기</button>
			</div>
		</div>
	</div>
</body>
</html>