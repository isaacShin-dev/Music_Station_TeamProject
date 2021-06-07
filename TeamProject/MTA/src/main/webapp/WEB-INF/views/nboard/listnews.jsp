<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "tag" tagdir = "/WEB-INF/tags/" %>
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
	  <style type="text/css">
	  	img{
	  		width: 200px;
	  		height: 200px;
	  	}
	  </style>
	   <script type="text/javascript">
	   $(function(){
           /* 검색 버튼 클릭 시 처리 이벤트 */
            $("#searchData").click(function() {
           	 if($("#search").val()!= "all"){
               if(!chkData("#keyword","검색어를")) return;
             }
           	 goPage();	
        	});
           
            /* 글쓰기 버튼 클릭 시 처리 이벤트 */
            $("#insertFormBtn").click(function(){
               location.href = "/nboard/writenews";
            });
               

            
           /* 검색 후 검색 대상과 검색 단어 출력 */
            if ('${param.keyword}'!="") {
           $("#keyword").val('${param.keyword}');
           $("#search").val('${param.search}');
           }
           
           /* 검색 버튼 클릭 시 처리 이벤트 */
           let word="<c:out value='${data.keyword}' />";
           let value="";
           if(word!=""){
              $("#keyword").val("<c:out value='${data.keyword}' />");
              $("#search").val("<c:out value='${data.search}' />");
              
              if($("#search").val()!='n_text'){
                 if($("#search").val()=='n_title') value = "#list tr td.goDetail";
                 else if($("#search").val()=='n_note') value= "#list tr td.note";
                 
                 console.log($(value+":contains('"+word+"')").html());
                 $(value+":contains('"+word+"')").each(function(){
                    var regex = new RegExp(word,'gi');
                    $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                 });
              }
           } 
           
           
           
           
           /* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
           $(".goDetail").click(function(){
              var n_no = $(this).parents("tr").attr("data-num");
              $("#n_no").val(n_no);
              // console.log("글번호 : " + b_num);
              // 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
              $("#detailForm").attr({
                 "method" : "get",
                 "action" : "/nboard/detailnews"
              });
              $("#detailForm").submit();
           });
     });
        
      /*검색을 위한 실질적인 처리 함수*/   
   	function goPage(){    
   	 if($("#search").val()=="all"){
     	   $("#keyword").val("");
     	}
     	$("#n_search").attr({
        	"method" : "GET",
        	"action" : "/nboard/listnews"
        
     	});
    	 $("#n_search").submit();
   	 }  
     
     </script>
	</head>
	<body>
      <div class = "container">
         <div class = "contentTit page-header"><h3 class = "text-center">뉴스 리스트</h3></div>
         <form id = "detailForm">
            <input type = "hidden" id = "n_no" name = "n_no">
         </form>
         
         <div id="newsSearch" class="text-right">
               <form id="n_search" name="n_search" class="form-inline">
                  <div class="form-group">
                        <label>검색</label>
                     <select id="search" name="search" class="form-control">
                         <option value="all">전체</option>
                         <option value="n_title">제목</option>
                         <option value="n_text">내용</option>
                         <option value="n_note">부제목</option>
                     </select>
                     <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" />
                     <button type="button" id="searchData" class="btn btn-primary">검색</button>
                  </div>
               </form>
            </div>
         
         <%-- ====================== 리스트 시작 ====================== --%>
         <div id = "newsList" >
            <table summary = "게시판 리스트" class = "table table-striped">
               <colgroup>
                  <col width = "10%" />
                  <col width = "42%" />
                  <col width = "15%" />
                  <col width = "23%" />
                  <col width = "10%"/>
               </colgroup>
               <thead>
                  <tr>
                     <th data-value = "n_no" class = "order text-center" >뉴스번호</th>
                     <th class = "text-center">커버사진</th>
                     <th class = "text-center">글제목</th>
                     <th class = "text-center">부제목</th>
                     <th data-value = "n_regdate" class = "order">작성일</th>
                  </tr>
               </thead>
               <tbody id = "list" class = "table-striped">
                  <!-- 데이터 출력 -->
                  <c:choose>
                     <c:when test = "${not empty listnews }">
                        <c:forEach var = "news" items= "${listnews}" varStatus = "status">
                           <tr class = "text-center" data-num = "${news.n_no}">
                              <td>${news.n_no}</td>
                              <td>
                              	 <c:if test="${not empty news.n_image }">
                              		<img src="/uploadStorage/news/${news.n_image }"/>
                              	</c:if>	
							  </td>
                              <td class = "goDetail text-left">${news.n_title}</td>
                              <td class = "note" >${news.n_note}</td>
                              <td class = "text-left">${news.n_regdate}</td> 
                           </tr>
                        </c:forEach>
                     </c:when>
                     <c:otherwise>
                        <tr>
                           <td colspan = "4" class = "tac text-center">등록된 게시물이 존재하지 않습니다.</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>
         </div>
         <%-- ====================== 리스트 종료 ====================== --%>
         <%--================================= 검색기능 시작 ============================ --%>
          <div id="newsSearch" class="text-right">
      		<form id="n_search" name="n_search" class="form-inline">
      			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
      			<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
      		</form>
      	   </div>
      	<%--============================페이지 마커 ============================= --%>
      	 <tag:simple pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
	    				startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }"
	    				prev="${pageMaker.prev}" next="${pageMaker.next }"/>
      	<%--============================= 글쓰기 버튼 ========================== --%>
      		<div class="contentBtn text-right">
	   			<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success">
	   		</div>
      
 	     
		</div>
	</body>
</html>