<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
      <meta charset="UTF-8" />
      <title>Insert title here</title>
      <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
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
	   <script type="text/javascript">
	   		
	   		$(function(){
	   			/**기본 댓글 목록 불러오기 */
	   			let n_no = ${detail.n_no};
	   			listAll(n_no);
	   			
	   			
	   		
		   		/** data-button 속성으로 모달창에서 등록버튼과수정버튼 구분 */
		   		if(!$("#replyInsertBtn").attr("data-button")){
		   			$("#replyInsertBtn").attr("data-button","insertBtn");
		   		}
		   		
		   		/** 댓글 등록 버튼 클릭시 모달창 설정 작업 */
		   		$("#replyInseretFormBtn").click(function(){
		   			setModal("댓글등록","insertBtn","등록");
		   			dataReset();
		   			 //수정시 작성자가 일기 전용 해제 하기위한 코드
		   			//$("#user_id").removeAttr("readonly");
		   			$("#user_id").val("lss8710");
		   			$('#replyModal').modal(); 
		   		});
		   			
		   		/**글입력을 위한 ajax 연동처리 */
		   		$(document).on("click","button[data-button='insertBtn']",function(){
		   			console.log("등록버튼");
		   	
		   			var insertUrl = "/replies/replyInsert";
		   			/*json,stringify():javascript값이나 객체를 json문자열로 변환*/
		   			var value = JSON.stringify({
		   				n_no:n_no,
		   				user_id:$("#user_id").val(),
		   				nc_text:$("#nc_text").val()
		   			});

		   			$.ajax({
		   				url : insertUrl,	//전송 url
		   				type : "post", 	//전송시 method 방식
		   				headers : {
		   					"Content-Type" : "application/json",
		   					"X-HTTP-Method-Override" : "POST"
		   				},
		   				dataType : "text",
		   				data : value,
		   				error : function(){ // 실행시 오류 발생하였을경우 
		   					alert('시스템 오류 입니다.관리자에게 문의 하세요.');
		   				},
		   				beforeSend: function(){
		   					if(!checkForm("#user_id","작성자를"))	return false;
		   					else if(!checkForm("#nc_text", "댓글내용을"))	 return false;
		   					
		   				},
		   				success : function(result){
		   					if(result=="SUCCESS"){
		   						alert("댓글 등록이 완료되었습니다.");
		   						dataReset();
		   						$("#replyModal").modal('hide');
		   						listAll(n_no);
		   					}
		   				}
		   			});
		   		});
		   		

		   		 $('button[data-dismiss="modal"]').click(function(){
	   				dataReset();
	   			 });
		   		
		   		
		   		/**글수정을 위한 ajax 연동처리 */
		   		function updateForm(nc_no){
		   			$.ajax({
		   				url : "/replies/"+nc_no+".json",	//전송 url
		   				type : "get", 	//전송시 method 방식
		   				dataType : "json",
		   				error : function(){ // 실행시 오류 발생하였을경우 
		   					alert('글수정 오류 입니다.관리자에게 문의 하세요.');
		   				},
		   				success : function(data){
		   					$("#user_id").val(data.user_id);
		   					$("#nc_text").val(data.nc_text);
		   					
		   					var num_input = $("<input>");
		   					num_input.attr({
		   						"type":"hidden",
		   						"name":"nc_no"});
		   					num_input.val(nc_no);
		   					$("#comment_form").append(num_input);
		   					setModal("댓글수정","updateBtn","수정");
		   					//수정시 작성자 읽기 전용을 위한 콛,
		   					//작성자 수정 발가능
							//$("#nc_no").attr("readonly","readonly");
		   					$('#replyModal').modal();
		   					
		   				}
		   							   				
		   			});
		   			
		   		}

		   	 	$(document).on("click","button[data-btn='upBtn']",function(){
			   		var nc_no = $(this).parents("div.panel").attr("data-num");
			   		console.log("클릭 버튼 nc_no: " + nc_no);
			   		updateForm(nc_no);
			   			
		   	 	});
		   	 	
			   	 $(document).on("click","button[data-btn='delBtn']",function(){
				   		var nc_no = $(this).parents("div.panel").attr("data-num");
				   		console.log("클릭 버튼 nc_no: " + nc_no);
				   		deleteBtn(nc_no);
				   			
			   	 });
			
			   	 	function deleteBtn(nc_no){
					   	if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
						   	$.ajax({
						   		//url : "/replies/"+n_no+'/'+nc_no,	//전송 url
						   		url : "/replies/"+nc_no,	//전송 url
						   		type : 'delete',//전송시 method 방식
						   		headers : {
						   					
						   			"X-HTTP-Method-Override" : "DELETE"
						   		},
						   		dataType : "text",
						   		error : function(){ // 실행시 오류 발생하였을경우 
						   			alert('글삭제 오류 입니다.관리자에게 문의 하세요.');
						   		},
						   		success : function(result){
						   			console.log("result:"+result);
						   			if(result == 'SUCCESS'){
						   				alert("댓글삭제가 완료되었습니다.");
						   					listAll(n_no);
						   			}
					   			}
					   		});
				   		}
		   	 		}
		   	 
		   	 	
		   	 	   		
		   		/** 수정을 위한 ajax 연동처리 */
		   	
		   		$(document).on("click","button[data-button='updateBtn']",function(){
		   			console.log("클릭 버튼 nc_no: " + nc_no);
		   			var nc_no = $("input[name='nc_no']").val();
		   			if(!checkForm("#nc_text","댓글 내용을")) return;
		   			else{
		   				$.ajax({
		   					url:'/replies/'+nc_no,
		   					type:'put',
		   					headers:{
		   						"Content-type":"application/json",
		   						"X-HTTP-Method-Override":"PUT"
		   					},
		   					data:JSON.stringify({
		   						nc_text:$("#nc_text").val()
		   					}),
		   					dataType:'text',
		   					error:function(){
		   						alert('댓글연동처리 오류입니다.');
		   						
		   					},
		   					success:function(result){
		   						console.log("result:"+result);
		   						if(result=="SUCCESS"){
		   							alert("댓글수정이 완료되었습니다.");
		   							dataReset();
		   							
		   							$('#replyModal').modal('hide');
		   							listAll(n_no);
		   						}
		   						
		   					}
		   				});
		   			}
		   		});
		   	
	   		});	
		   		
		   		
	   			
	   		
		   		//최상위 $ 종료 
	   		
	   		 
	   		/**댓글 목록 보여주는 함수 */
	   		function listAll(n_no){
	   			$("#reviewList").html("");
	   			var url = "/replies/all/"+n_no+".json";
	   			
	   			$.getJSON(url, function(data){
	   			 	console.log("list count:" + data.length); 
	   			     replyCnt = data.length; 
	   				$(data).each(function(){
	   					var n_no = this.n_no;
	   					var nc_no = this.nc_no;
	   					var user_id = this.user_id;
	   					var nc_text = this.nc_text;
	   					var nc_regdate = this.nc_regdate;
	   					nc_text = nc_text.replace(/(\r\n|\r|\n)/g, "<br/>");
	   					addItem(n_no, nc_no, user_id, nc_text, nc_regdate);
	   				});
	   			}).fail(function(){
	   				alert("댓글 목록을 불러오는데 실패했습니다.");
	   			});
	   			
	   		
	   			
	   		}
	   		
	   		/** 새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
	   		function addItem(n_no, nc_no, user_id, nc_text, nc_regdate) {
	   			// 새로운 글이 추가될 div태그 객체
	   			let wrapper_div = $("<div>");
	   			
	   			wrapper_div.attr("data-num", nc_no);
	   			wrapper_div.addClass("panel panel-default");
	   						
	   			
	   			let new_div = $("<div>");
	   			new_div.addClass("panel-heading");
	   			
	   			// 작성자 정보의 이름
	   			let name_span = $("<span>");
	   			name_span.addClass("user_id");
	   			name_span.html(user_id + "님");
	   			
	   			// 작성일시
	   			let date_span = $("<span>");
	   			date_span.html(" / "+nc_regdate+" ");
	   			
	   		    // 수정하기 버튼
	            let upBtn = $("<button>");
	            upBtn.attr({"type" : "button"});
	            upBtn.attr("data-btn","upBtn");
	            upBtn.addClass("btn btn-primary gap");
	            upBtn.html("수정하기");

	   						
	   						
	   		   // 삭제하기 버튼
	            let delBtn = $("<button>");
	            delBtn.attr({"type" : "button"});
	            delBtn.attr("data-btn","delBtn");
	            delBtn.addClass("btn btn-primary gap");
	            delBtn.html("삭제하기");

	   						
	   			// 내용 
	   			let content_div = $("<div>");
	   			content_div.html(nc_text);
	   			content_div.addClass("panel-body");
	   			
	   			// 조립하기
	   			new_div.append(name_span).append(date_span).append(upBtn).append(delBtn);
	   			wrapper_div.append(new_div).append(content_div);
	   			$("#reviewList").append(wrapper_div);
	   		
	   		}
	   		
	   		
	   		/*입력 폼 초기화*/
	   		function dataReset(){
	   			$("#user_id").val("");
	   			$("#nc_text").val("");
	   		}
	   		
	   		/*모달창 초기화 */
	   		function setModal(title, value, text){
	   			$("#replyModalabel").html(title);
	   			$("#replyInsertBtn").attr("data-button",value);
	   			$("#replyInsertBtn").html(text);
	   		}
	   	
	   		
	   </script>
	</head>
	<body>
	<div id="replyContainer container">
		<%--등록 버튼 영역 --%>
		<p class="text-rigth">
			<button type="button" class="btn btn-success" id="replyInseretFormBtn">댓글등록</button>
		</p>
				
		  <%-- 리스트 영역 --%>
		 <div id="reviewList"></div> 
		
		
		<%-- 등록 화면 영역(modal) --%>
		<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="replyModalLabel">댓글 등록</h4>
					</div>
					<div class="modal-body">
						<form id="comment_form" name="comment_form">
							<input type="hidden" name="n_no" value="${detail.n_no }" />
							<div class="form-group">
								<label for="user_id" class="control-label">작성자</label>
								<!--작성자 value는 user_id를 대려오기위해 강제로 데이터 준 경우임  -->
								<input type="text" class="form-control" name="user_id" id="user_id"  maxlength="10" />
							</div>
							<div class="form-group">
								<label for="nc_text" class="control-label">글내용</label>
								<textarea class="form-control" name="nc_text" id="nc_text" rows="5"></textarea>
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