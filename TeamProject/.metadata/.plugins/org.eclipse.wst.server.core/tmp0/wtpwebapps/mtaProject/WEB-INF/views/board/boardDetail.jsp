<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href='https://fonts.googleapis.com/css?family=Roboto:100'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/include/css/musicPlayer.css">

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
.fa {
	position: absolute;
	bottom: 10px;
	right: 10px;
	font-size: 18px;
	cursor: pointer;
	color: #555;
}

</style>
<script type="text/javascript">
	let buttonCheck = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수 (비밀번호가 일치했을 때 )

	$(function() {
		let path = $("#m_file").val();
		console.log(path);

		var audio = new Audio(path);
		console.log(audio);
		audio.volume = 0.4;
		audio.autoplay = true;

		$('.trigger').click(function() {
			if (audio.paused == false) {
				audio.pause();
				$('.fa-play').show();
				$('.fa-pause').hide();
				$('.music-card').removeClass('playing');
			} else {
				audio.play();
				$('.fa-pause').show();
				$('.fa-play').hide();
				$('.music-card').addClass('playing');
			}
		});
		
		//볼륨 조절 가능한 
		$("#volumeSlider").change(function(){
		    let volume = $(this).val();
		    audio.volume = volume ;
		});

		$("#pwdChk").css("visibility", "hidden"); /* 화면에 보이진 않지만, 영역은 차지할 수 있도록.(div) */

		//수정버튼 클릭 시 처리 이벤트
		$("#updateFormBtn").click(function() {
			$("#pwdChk").css("visibility", "visible");
			$("#msg").text("계정 비밀번호를 입력해 주세요.").css("color", "000099");
			buttonCheck = 1;
		});
		//삭제버튼 클릭 시 처리 이벤트
		$("#boardDeleteBtn").click(function() {
			$("#pwdChk").css("visibility", "visible");
			$("#msg").text("계정 입력한 비밀번호를 입력해 주세요.").css("color", "000099");
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

		$("#boardInsertBtn").click(function() {
			location.href = "/board/writeForm";
		});

		//목록 버튼 클릭 시 처리 이벤트
		$("#boardListBtn").click(function() {
			location.href = "/board/boardList";
		});

		/* 제목 클릭 시 상세 페이지 이동을 위한 이벤트  
		$(".goDetail").click(function() {
			var m_no = $(this).parents("tr").attr("data-num");
			console.log(m_no);
			$("#m_no").val(m_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardDetail"
			});
			$("#detailForm").submit();
		});*/

		/* 제목 클릭 시 상세 페이지 이동을 위한 이벤트  
		$(".goDetail").click(function() {
			var m_no = $(this).parents("tr").attr("data-num");
			console.log(m_no);
			$("#m_no").val(m_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardDetail"
			});
			$("#detailForm").submit();
		});*/

		$("#checkOutBtn").click(function() {
			$("#f_data").attr({
				"method" : "get",
				"action" : "/board/checkOut"
			});
			$("#f_data").submit();

		});

		//장바구니 버튼 이벤트 
		$("#addCartBtn").click(function() {
			var result = confirm('장바구니 담기 성공 ! 장바구니로 이동하시겠습니까?');

			if (result) {
				$("#f_data").attr({
					"method" : "post",
					"action" : "/board/addCart"
				});

				$("#f_data").submit();

			} else {
				//리스트로 돌아갈까?
			}
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
		<form name="f_data" id="f_data">
			<input type="hidden" name="m_no" value="${detail.m_no}" /> <input
				type="hidden" name="user_id" id="user_id" value="test" />
		</form>
		<form name="file" id="file">
			<input type="hidden" name="m_file" id="m_file"
				value="/uploadStorage/audioFile/${detail.m_file}" />
		</form>
		<div id="pwdChk" class="authArea  col-md-9 text-left">
			<form name="f_pwd" id="f_pwd" class="form-inline">
				<input type="hidden" name="b_num" id="b_num" value="${detail.m_no}">
				<label for="b_pwd">비밀번호 : </label> <input type="password"
					name="b_pwd" id="b_pwd" class="form-control" />

				<button type="button" id="pwdBut" class="btn btn-default btn-sm">확인</button>
				<button type="button" id="pwdButCancel"
					class="btn btn-default btn-sm">취소</button>
				<span id="msg"></span>
			</form>
		</div>
		<div class="btnArea col-md-3 text-right">
			<button type="button" id="updateFormBtn"
				class="btn btn-default btn-sm">수정</button>
			<button type="button" id="boardDeleteBtn"
				class="btn btn-default btn-sm">삭제</button>
			<button type="button" id="boardInsertBtn"
				class="btn btn-default btn-sm">쓰기</button>
			<button type="button" id="boardListBtn"
				class="btn btn-default btn-sm">목록</button>
		</div>
		<%-- <div style="background-image: url('/uploadStorage/coverImg/${detail.m_coverimage}');" id ="background"> --%>
			<div class='music-card playing'>
				<div class='image'>
					<img src="/uploadStorage/coverImg/${detail.m_coverimage}" />
				</div>
				<div class='wave'></div>
				<div class='wave'></div>
				<div class='wave'></div>

				<div class='info'>
					<div>
						<p class="fa fa-pause trigger" style="cursor: pointer;">❚❚</p>

						<p class="fa fa-play trigger" style="cursor: pointer;">▶</p>
					</div>


					<h2 class='title'>${detail.m_title}</h2>
					<div class='artist'>${detail.m_name}</div>
				</div>

			</div>
		<!-- </div> -->

		<div class="text-center">

			
			<div id="detialInfo">										
						<label class="col-md-3">Author</label>
							<p>${detail.m_name}</p> 
							
						<label class="col-md-3">Title</label>
							<p>${detail.m_title}</p> 
							
						<label class="col-md-3">BPM</label>
							<p>${detail.m_bpm}</p> 
							
						<label class="col-md-3">Content</label>
							<p>${detail.m_explain}</p>
			</div>
			<div>
				<button type="button" class="btn btn-success" id="checkOutBtn">구매</button>
				<button type="button" class="btn btn-success" id="addCartBtn">장바구니
					담기</button>
			</div>
		</div>
		<div>
			<jsp:include page="reply.jsp" />
		</div>
	</div>
</body>
</html>