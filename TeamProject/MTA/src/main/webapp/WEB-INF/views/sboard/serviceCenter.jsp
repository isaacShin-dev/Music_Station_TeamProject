<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "tag" tagdir = "/WEB-INF/tags/" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>목록보기</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <!-- 모바일 웹 페이지 설정 -->
         <link rel="shortcut icon" href="/resources/include/image/icon.png" />
         <link rel="apple-touch-icon" href="/resources/include/image/icon.png" />
         <!-- 모바일 웹 페이지 설정 끝 -->
      
         <!--[if lt IE 9]>
        <script src="/siteProject/include/js/html5shiv.js"></script>
         <![endif]-->
         
        <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap.min.css" />
		<link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap-theme.css" />
		<style type="text/css">
		       form {margin-bottom: 30px;}
		       .required{
		       		color : red;
		       }
		</style>
		<script type = "text/javascript"  src = "/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type = "text/javascript"  src = "/resources/include/js/common.js"></script>
		<script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js"></script>
		<script type = "text/javascript">
            $(function(){
            	/* 검색 후 검색 대상과 검색 단어 출력 */
          		/* if ('${param.keyword}'!="") {
					$("#keyword").val('${param.keyword}');
					$("#search").val('${param.search}');
				}
            	 */
            	 $(".page-header").removeClass();
            	 
            	let word = "<c:out value='${data.keyword}' />";
            	let value="";
            	if(word!=""){
            		$("#keyword").val("<c:out value='${data.keyword}' />");
            		$("#search").val("<c:out value='${data.search}' />");
            		
            		if($("#search").val()!='scb_text'){
            			//:contains()는 특정 텍스트를 포함한 요ㅅ반환
            			if($("#search").val()=='scb_title') value = "#list tr td.goDetail";
            			else if($("#search").val()=='user_id') value="#list tr td.user_id";
            		
            			console.log($(value+":contains('"+word+"')").html());
            			
            			$(value+":contains('"+word+"')").each(function() {
							var regex = new RegExp(word, 'gi');
							$(this).html($(this).html().replace(regex,
									"<span class='required'>" +word+ "</span>"));
						});
            		}
            	}
            	 
            	/* 검색 버튼 클릭 시 처리 이벤트 */
            	$("#searchData").click(function() {
					if($("#search").val()!= "all"){
						if(!chkData("#keyword","검색어를")) return;
					}else if($("#search").val()=="all"){
						$("#keyword").val("");
					}
					$("#f_search").attr({
						"method" : "GET",
						"action" : "/sboard/serviceCenter"
						
					});
					$("#f_search").submit();
				});
            	
            	/* pageMaker */
            	$(".paginate_button a").click(function (e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
            	
            	
          		/* 글쓰기 버튼 클릭 시 처리 이벤트 */
          		$("#insertFormBtn").click(function() {
					location.href = "/sboard/serviceWriteForm";
				});
            	
          		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
          		$(".goDetail").click(function() {
					var scb_no = $(this).parents("tr").attr("data-num");
					$("#scb_no").val(scb_no);
					console.log("글번호:" +scb_no);
					//상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/sboard/serviceboardDetail"
					});
					$("#detailForm").submit();
				});
			});
            
         
            
            /* 검색을 위한 실질적인 처리 함수 */
            function goPage() {
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" :"/sboard/serviceCenter"
				});
				$("#f_search").submit();	
			}
         </script>
    </head>
   <body>
      <div class = "container">
       <h3 class="text-center">[Service Center]</h3>
       <form id="detailForm">
       		<input type="hidden" id="scb_no" name="scb_no">
       </form>
       		   <div id="boardSearch" class="text-right">
		         <form id="f_search" name="f_search" class="form-inline">
		         	<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
		         	<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			         <div class="form-group">
			         		<label>검색조건</label>
							<select id="search" name="search" class="form-control">
							    <option value="all">전체</option>
							    <option value="scb_title">제목</option>
							    <option value="scb_text">내용</option>
							    <option value="user_id">작성자</option>
							</select>
							<input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" />
							<button type="button" id="searchData" class="btn btn-primary">검색</button>
			         </div>
		         </form>
        	 </div>
       		
         <%-- ====================== 리스트 시작 ====================== --%>
         <div id = "boardList">
            <table summary = "게시판 리스트" class = "table">
               <colgroup>
                  <col width ="10%" />
                  <col width ="52%" />
                  <col width ="15%" />
                  <col width ="13%" />
                  <col width ="10%" /> 
               </colgroup>
               <thead>
                  <tr>
                     <th data-value="scb_no" class="order text-center">글번호</th>
                     <th class="text-center">글제목</th>
                     <th data-value="scb_regdate" class="order">작성일</th>
                     <th class="text-center">작성자</th>
                     <th data-value="scb_replyCnt" class="order text-center">답변수</th>
      				
                  </tr>
               </thead>
               <tbody id="list" class="table-striped" >
      				<!-- 데이터 출력 -->
      				<c:choose>
      					<c:when test="${not empty serviceList}">
      						<c:forEach var="board" items="${serviceList}" varStatus="status">
      							<tr class="text-center" data-num="${board.scb_no}">
      								<td>${board.scb_no}</td>
      								<td class="goDetail text-center">${board.scb_title}</td>
      								<td class="text-left">${board.scb_regdate}</td>
      								<td class="user_id">mta</td>
      								<td>${board.scb_replyCnt}</td>
      					
      							</tr>
      						</c:forEach>
      					</c:when>
      					<c:otherwise>
      						<tr>
      							<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
      						</tr>
      					</c:otherwise>
      				</c:choose>
               </tbody>
            </table>
            	<%-- ===============글쓰기 버튼 출력 시작 ===============--%>
            	<div class="contentBtn text-right">
               			<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-primary btn-sm">
            	</div>
            
           </div>
           <%--==================리스트 종료====================  --%>
           
           <%--==================페이징 출력 시작====================  --%>
           <tag:simple  pageNum= "${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
           				startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
           				prev="${pageMaker.prev}" next="${pageMaker.next}" />
           
           <%--==================페이징 출력 종료====================  --%>
           
         
    
      
   	</div>
   </body>
</html>