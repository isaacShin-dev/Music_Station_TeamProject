<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

      <title>상세페이지</title>      
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap.min.css" />
	  <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap-theme.css" />
      <style type="text/css">
       form {margin-bottom: 30px;}
       .image_size{
       			height: 200px;
       			width: 400px;
       }
       
       #fc_insertBtn{
       		height: 110px;
       		width: 70px;
       }
       
       #h{
       		width:100%;
       }
      </style>
      <script type = "text/javascript"  src = "/resources/include/js/jquery-3.6.0.min.js"></script>
      <script type = "text/javascript"  src = "/resources/include/js/common.js"></script>
      <script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js"></script>
           <script type="text/javascript">
         let buttonCheck = 0; // buttonCheck는 수정버튼과 삭제버튼을 구별하기 위한 변수
         $(function() {
        	 $(".page-header").removeClass();
        	  
            /* 수정 버튼 클릭 시 처리 이벤트 */
            $("#noticeUpdateFormBtn").click(function(){
				$("#f_data").attr("action", "/notice/fnoticeUpdateForm");
				$("#f_data").submit();
            });
           
            
            /* 삭젲 버튼 클릭 시 처리 이벤트 */
            $("#noticeDeleteBtn").click(function(){
            	if(confirm("정말 삭제하시겠습니까?")){
					$("#f_data").attr("action","/notice/fnoticeDelete");
					$("#f_data").submit();
				}
            });
                 
            /* 공지사항 글쓰기 버튼 클릭 시 처리 이벤트 */
            $("#insertFormBtn").click(function(){
            	 location.href = "/notice/fnoticeWriteForm";
            });
           	
           
            
            /* 목록 버튼 클릭 시 처리 이벤트 */
            $("#boardListBtn").click(function(){
                location.href = "/board/freeboard";
             });
            
           
            
        	   /* 댓글삭제 버튼 클릭 시 처리 이벤트 */
               $("#fcdeleteBtn").click(function(){
            	   console.log("댓글삭제클릭");
               	if(confirm("정말 삭제하시겠습니까?")){
   					$("#fc_form").attr("action","/fcomment/fcDelete");
   					$("#fc_form").submit();
   				}
               });
        	   
            
               
         });
         </script>
      
   </head>
   <body>
   <div class = "container-fluid">
         <form name = "f_data" id = "f_data" method = "post">
            <input type = "hidden" name = "fn_no" value = "${detail.fn_no}">
         </form>
    </div>
   	   		
	   	<div class="btnArea col-md-12 text-right" style="margin-top:50px; margin-bottom:30px;">
	   		<button type="button" id="noticeUpdateFormBtn" class="btn btn-primary btn-sm" >공지글수정</button>
	   		<button type="button" id="noticeDeleteBtn" class="btn btn-primary btn-sm" >공지글삭제</button>
	   		<button type="button" id="insertFormBtn" class="btn btn-primary btn-sm" >공지쓰기</button>
	   		<button type="button" id="boardListBtn" class="btn btn-primary btn-sm" >목록</button>
	   	</div>
	
   		
   		
   			<table class="table table-bordered" >
	   			<tr>
	   				<td class="col-md-3">글번호</td>
	   				<td class="col-md-3 text-left">${detail.fn_no}
	   				<td class="col-md-3">작성일</td>
	   				<td class="col-md-3 text-left">${detail.fn_regdate}</td>
	   			</tr>
   				<tr>
   					<td class="col-md-3">작성자 </td>
   					<td colspan="3" class="col-md-9 text-left">manager</td>
   				</tr>
   				<tr>
   					<td class="col-md-3">글제목 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.fn_title}</td>
   				</tr>
   				<tr class="table-height">
   					<td class="col-md-3">글 내용 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.fn_text}</td>
   				</tr>
   			

   			</table>
   		
   		
   	
   </body>
</html>