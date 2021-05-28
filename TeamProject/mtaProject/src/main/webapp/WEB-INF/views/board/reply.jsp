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
	<title>Insert title here</title>
	<script type="text/javascript">
	
		let message = "작성시 입력한 비밀번호를 입력해 주세요. ", btnkind ="";
				
		$(function(){
					/*기본 댓글 목록 불러오기 */
					let m_no = ${detail.m_no};
					listAll(m_no);
					
					/*data-button 속성으로 모달창에서 등록버튼과 수정버튼 구성*/
					if(!$("#replyInsertBtn").attr("data-button")){
						$("#replyInsertBtn").attr("data-button", "insertBtn");
					}
					
					/*댓글 등록 버튼 클릭 시 모달창 설정 작업*/
					$("#replyInsertFormBtn").click(function(){
						setModal("댓글 등록", "insertBtn", "등록");
						dataReset();
						$('#replyModal').modal();
					});
					
					/*글입력을 위한 Ajax 연동 처리 */
					$(document).on("click", "button[data-button='insertBtn']", function(){
						console.log("insertBtn");
						var insertUrl = "/replies/replyInsert";
						/*JSON.stringfy(): JavaScript 값이나 객체를 JSON 문자열로 변환.*/
						var value = JSON.stringify({
							m_no:m_no,
							r_name:$("#r_name").val(),
							r_pwd:$("#r_pwd").val(),
							r_content:$("#r_content").val()
						});

					
					
					$.ajax({
						url : insertUrl, 
						type : "post",
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType :"text",
						data : value,
						error : function(){
							alert("시스템 오류. 관리자 문의 요망");
						},
						beforeSend: function(){
							if(!checkForm("#r_name","작성자를")) return false;
							else if(!checkForm("#r_content","내용을")) return false; 
							else if(!checkForm("#r_pwd","비밀번호를")) return false;
						},
						success: function(result){
							if(result =="SUCCESS"){
								alert("댓글 등록이 완료되었습니다.");
								dataReset();
								$('#replyModal').modal('hide');
								listAll(m_no);
							}
						}
					
						});
					});
					$('#button[data-dismiss="modal"]').click(function(){
						dataReset();
					});
					
				}); //최상위 종료
				
				/*댓글목록 보여주는 함수 */
				function listAll(m_no){
					$("#reviewList").html("");
					let url = "/replies/all/"+m_no; // +".json";
					
					$.getJSON(url, function(data){
						
						replyCnt = data.length; 
						$(data).each(function(){
							var r_num = this.r_num;
							var r_name = this.r_name;
							var r_content = this.r_content;
							var r_date = this.r_date;
							r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br/>");
							addItem(r_num, r_name, r_content, r_date);
						});
					}).fail(function(){
						alert("댓글 목록 불러오기 실패.")
					});
				}
				
				/** 새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
				
				function addItem(r_num, r_name, r_content, r_date) {
					// 새로운 글이 추가될 div태그 객체
					let wrapper_div = $("<div>");
					wrapper_div.attr("data-num", r_num);
					wrapper_div.addClass("panel panel-default");
	
					let new_div = $("<div>");
					new_div.addClass("panel-heading");
	
					// 작성자 정보의 이름
					let name_span = $("<span>");
					name_span.addClass("name");
					name_span.html(r_name + "님");
	
					// 작성일시
					let date_span = $("<span>");
					date_span.html(" / " + r_date + " ");
	
					// 수정하기 버튼
					let upBtn = $("<button>");
					upBtn.attr({
						"type" : "button"
					});
					upBtn.attr("data-btn", "upBtn");
					upBtn.addClass("btn btn-primary gap");
					upBtn.html("수정하기");
	
					// 삭제하기 버튼
					let delBtn = $("<button>");
					delBtn.attr({
						"type" : "button"
					});
					delBtn.attr("data-btn", "delBtn");
					delBtn.addClass("btn btn-primary gap");
					delBtn.html("삭제하기");
	
					// 내용 
					let content_div = $("<div>");
					content_div.html(r_content);
					content_div.addClass("panel-body");
	
					// 조립하기
					new_div.append(name_span).append(date_span).append(upBtn)
							.append(delBtn);
					wrapper_div.append(new_div).append(content_div);
					$("#reviewList").append(wrapper_div);
				}
				/*모달창 초기화
				*댓글 등록과, 수정을 해야하기에, 제목을 바꾼다. 
				*/
				function setModal(title, value, text) {
					$("#replyModalLabel").html(title);
					$("#replyInsertBtn").attr("data-button",value);
					$("#replyInsertBtn").html(text);
				}
				function dataReset() {
					$("#r_name").val("");
					$("#r_pwd").val("");
					$("#r_content").val("");
				}
				
			</script>
	</head>
	<body>
		<div class="container">
			<%--등록버튼 영역 --%>
			<p class="text-right">
				<button type="button" class="btn btn-success" id="replyInsertFormBtn">댓글
					등록</button>
			</p>
	
			<%--리스트 영역 --%>
			<div id="reviewList"></div>
	
			<%-- 등록 화면 영역(modal) --%>
			<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
				aria-labelledby="replyModalLabel" aria-hidden="true"
				data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="replyModalLabel">댓글 등록</h4>
						</div>
						<div class="modal-body">
							<form id="comment_form" name="comment_form">
								<input type="hidden" name="m_no" value="${detail.m_no}" />
								<div class="form-group">
									<label for="g_name" class="control-label">작성자</label> <input
										type="text" class="form-control" name="r_name" id="r_name"
										maxlength="5" />
								</div>
								<div class="form-group">
									<label for="g_content" class="control-label">글내용</label>
									<textarea class="form-control" name="r_content" id="r_content"
										rows="5"></textarea>
								</div>
								<div class="form-group">
									<label for="g_pwd" class="control-label">비밀번호</label> <input
										type="password" class="form-control" name="r_pwd" id="r_pwd" />
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-success" id="replyInsertBtn">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>