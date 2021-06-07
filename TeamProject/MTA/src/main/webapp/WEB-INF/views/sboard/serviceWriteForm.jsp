<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>글쓰기</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <!-- 모바일 웹 페이지 설정 -->
         <link rel="shortcut icon" href="/resources/include/image/icon.png" />
         <link rel="apple-touch-icon" href="/resources/include/image/icon.png" />
         <!-- 모바일 웹 페이지 설정 끝 -->
      	 <link rel>
         <!--[if lt IE 9]>
        <script src="/siteProject/include/js/html5shiv.js"></script>
         <![endif]-->
         <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
         <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
        
         	
         <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>	
         
         <script type="text/javascript" src="/resources/include/js/common.js"></script> 	
         <script type = "text/javascript"src = "/resources/include/dist/js/bootstrap.min.js"></script>
         
         <script type="text/javascript">
         
         
         	$(function() {
			
			
	         	/* 저장버튼 클릭 시 처리 이벤트 */
	         	$("#boardInsertBtn").click(function() {
					//입력값 체크
					if(!chkData("#scb_title","제목은"))return;
					else if(!chkData("#scb_text","작성할 내용은"))return;
				
					else{
						$("#b_writeForm").attr({
							"method" : "post",
							"action" : "/sboard/serviceboardInsert"
						});
						
						$("#b_writeForm").submit();
						
					}
				});
	         	
	         	/* 취소 버튼 클릭시 인풋 초기화 */
	         	$("#boardCancelBtn").click(function() {
					$("#b_writeForm").each(function() {
						this.reset();
					});
				});
	         	
	         	
	         	/* 목록 버튼 클릭시 처리 이벤트*/
	         	$("#boardListBtn").click(function() {
					location.href = "/sboard/serviceCenter";
				});
         	
         	});
         </script>
           
         
   </head>
   <body>
   	<div class="container" style="width: 70%;">
   	  <h3>글쓰기</h3>
      <div class = "contentTB">
         <form id = "b_writeForm" name = "b_writeForm" >
            <table class="table table-condensed">
               <colgroup>
                  <col width="17%" />
                  <col width="83%" />
               </colgroup>
               
               <tr>
                  <td class = "ac">작 성 자</td>
                  <td colspan = "3">
                  <input type = "text" value="${userInfo.user_id}" ></td>
               </tr>   
               <tr>
                  <td class = "ac">글 제 목</td>
                  <td colspan = "3">
                  <input type = "text" id = "scb_title" name = "scb_title"  /></td>
               </tr>
               <tr>
                  <td class = "ac">글 내 용</td>
                  <td colspan = "3">
                  <textarea name = "scb_text" id = "scb_text" rows = "10" cols = "70" ></textarea></td>
               </tr>
          
             
             
            </table>
         </form>
                <div class="text-right">
           <input type = "button" id = "boardInsertBtn" name = "boardInsertBtn" class="btn btn-success" value = "입력" />
           <input type = "button" id = "boardCancelBtn" name = "boardCancelBtn" class="btn btn-success" value = "취소" />
           <input type = "button" id = "boardListBtn" name = "boardListBtn" class="btn btn-info" value = "목록" />
      	  </div>
      </div>
      
     
   </div>
   
   </body>
</html>