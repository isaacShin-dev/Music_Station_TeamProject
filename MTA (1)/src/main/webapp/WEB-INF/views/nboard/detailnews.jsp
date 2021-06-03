<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
      <meta charset="UTF-8" />
      <title>뉴스 작성폼</title>
      <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/include/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/include/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
       <!-- 합쳐지고 최소화된 최신 CSS -->
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
		
	  <!-- 부가적인 테마 -->
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
	 
	  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	  <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>
	  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	  <script type="text/javascript"src="/resources/include/dist/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="/resources/include/js/common.js"></script>
	   <script type="text/javascript">
	   $(function(){
		   
		   
           
           /* 수정 버튼 클릭 시 처리 이벤트 */
           $("#updateFormBtn").click(function(){
        	  $("#news_numform").attr("action","/nboard/updatenews");
 			  $("#news_numform").submit();
           });
           
           /* 삭제 버큰 클릭 */
           $("#newsDeleteBtn").click(function(){
        	  
        	  $("#news_numform").attr("action","/nboard/deletenews");
			  $("#news_numform").submit();	 
           });
           
            /*삭제 버튼 클릭시 댓글 확인 후 처리 이벤트 */
           /*$("#newsDeleteBtn").click(function(){
               $.ajax({
               	url : "/board/replyCnt",
               	type : "post",
               	data : "n_no="+$("#n_no").val(),
               	dataType : "text",
               	error : function(){
               		alert('시스템 오류 관리자에게 문의 하세요');
               	},
               	success : function(resultData){
               		if(resultData==0){
               			$("#pwdChk").css("visibillty","visible");
               			$("msg").text("작성시 입력한 비밀번호를 입력해주세요.").css("color","#000099");
               			buttonCheck = 2;
               			
               		}else {
               			alert("댓글 존재시 게시물 작성할 수가 없습니다.\n 댓글 삭제 후 다시 확인 해 주세요.");
               			return;
               		}
               	}
               
               })
            }); */
           
		   /* 목록 버튼 클릭 시 처리 이벤트 */
	       $("#newsListBtn").click(function(){
	           location.href = "/nboard/listnews";
	        });
		   
	       /* 글쓰기 버튼 클릭 시 처리 이벤트 */
           $("#insertFormBtn").click(function(){
           	 location.href = "/nboard/writenews";
           });
           
	   });
	   </script>
	</head>
	<div class = "container">
       <div class = "text-center"><h3>게시판 상세화면</h3></div>
         <form id="news_numform" name="news_numform" method = "post">
         	<input type = "hidden" name = "n_no" id="n_no" value = "${detail.n_no}"/>
       	</form>
       		<div class="btnArea col-md-3 text-right">
	   			<button type="button" id="newsListBtn" class="btn btn-primary btn-sm" >목록</button>
	   		</div>
         <div class="btnArea col-md-3 text-right">
	   		<button type="button" id="updateFormBtn" class="btn btn-primary btn-sm" >뉴스글수정</button>
	   		<button type="button" id="newsDeleteBtn" class="btn btn-primary btn-sm" >뉴스글삭제</button>
	   		<button type="button" id="insertFormBtn" class="btn btn-primary btn-sm" >뉴스글쓰기</button>
	    </div>
	   
    </div>	   		
   		<div>
   			<table class="table table-bordered">
   			<caption>상세 페이지</caption>
	   			<tr>
	   				<td class="col-md-3">글번호</td>
	   				<td class="col-md-3 text-left">${detail.n_no}
	   				<td class="col-md-3">작성일</td>
	   				<td class="col-md-3 text-left">${detail.n_regdate}</td>
	   			</tr>
   				<tr>
   					<td class="col-md-3">글제목 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.n_title}</td>
   				</tr>
   				 <tr>
   					<td class="col-md-3">이미지</td>
   					<td colspan="3" class="col-md-9 text-left">
                         <c:if test="${not empty detail.n_image }">
                              <img src="/uploadStorage/news/${detail.n_image }"/>
                         </c:if>	
					</td>		  
   				</tr> 
   				<tr>
   					<td class="col-md-3">부제목</td>
   					<td colspan="3" class="col-md-9 text-left">${detail.n_note}</td>
   				</tr>
   				<tr class="table-height">
   					<td class="col-md-3">글 내용 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.n_text}</td>
   				</tr>
   				   		
   				
   			</table>
   			<jsp:include page="reply.jsp"/>	
   			
   		</div>	
	</body>
</html>