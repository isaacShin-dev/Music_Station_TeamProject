<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>글수정</title>
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
         <style type="text/css">
         		.image_size{
         			height:200px;
         			width: 400px;
         		}
         </style>
         <script type="text/javascript">
         $(function(){
             var msg = "${errorMsg}";
             if(msg != ""){
                alert(msg);
             }
             
             /* 저장 버튼 클릭 시 처리 이벤트 */
             $("#boardUpdate").click(function(){
                // 입력값 체크
                if (!chkData("#f_title", "제목을")) return;
                else if (!chkData("#f_text","작성할 내용을")) return;
                else {
                   $("#f_updateForm").attr({
                      "method":"post",
                      "enctype":"multipart/form-data",
                      "action":"/board/freeboardUpdate"
                   });
                   $("#f_updateForm").submit();
                }
             });
             
             /* 취소 버튼 클릭 시 처리 이벤트 */
             $("#boardCancelBtn").click(function() {
					$("#f_updateForm").each(function() {
						this.reset();
					});
				});
             
             /* 목록 버튼 클릭 시 처리 이벤트 */
             $("#boardListBtn").click(function(){
                location.href = "/board/freeboard";
             });
          });
        
         </script>
           
         
   </head>
   <body>
   	<div class="container" style="width: 70%;">
   	  <h3>글수정</h3>
      <div class = "contentTB">
         <form id = "f_updateForm" name = "f_updateForm" >
         <input type = "hidden" name = "f_no" id = "f_no" value = "${updateData.f_no}">
            <table class="table table-condensed">
               <colgroup>
                  <col width="17%" />
                  <col width="83%" />
               </colgroup>
                <tr>
                  <td class = "text-left">글 번 호</td>
                  <td>${updateData.f_no}
                  <td class = "ac">작 성 일</td>
                  <td>${updateData.f_regdate}</td>
               </tr>
               <tr>
                  <td class = "ac">작 성 자</td>
                  <td colspan = "3">
                  <input type = "text" value="${userInfo.user_id }" ></td>
               </tr>   
               <tr>
                  <td class = "ac">글 제 목</td>
                  <td colspan = "3" class="text-left">
                  <input type = "text" id = "f_title" name = "f_title" value = "${updateData.f_title}"><td>
               </tr>
               <tr>
                  <td class = "ac">글 내 용</td>
                  <td colspan = "3" class="text-left">
                  <textarea name = "f_text" id = "f_text" rows = "10" cols = "70" >${updateData.f_text}</textarea></td>
               </tr>
                <tr>
                  <td class = "ac">파일첨부</td>
                  <td colspan = "3">
                  <c:if test="${not empty detail.f_file }">
		                       <img class="image_size" src="/uploadStorage/board/${updateData.f_file}"/></td>
		          </c:if>
               </tr>
             	 <tr>
                  <td class = "ac">파일첨부_변경</td>
                  <td colspan = "3">
                  
                  <input type="file" class="form-control" id="file" name="file">(첨부된 파일변경)</td>
               </tr>
            </table>
         </form>
          <div class="contentBtn text-right">
                  <input type = "button" id = "boardUpdate" name = "boardUpdate" class="btn btn-success" value = "수정">
                   <input type = "button" id = "boardCancelBtn" name = "boardCancelBtn" class="btn btn-info" value = "취소">
                  <input type = "button" id = "boardListBtn" name = "boardListBtn" class="btn btn-info" value = "목록">
     	 </div>
      </div>
      
     
   </div>
   
   </body>
</html>