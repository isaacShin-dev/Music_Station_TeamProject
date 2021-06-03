<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/"%>


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
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>


<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap-theme.css">




<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>



<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<style type="text/css">


/* -webkit-box-shadow: 15px 15px 20px rgba(0,0, 0, 0.4);
-moz-box-shadow: 15px 15px 20px rgba(0,0, 0, 0.4);
box-shadow: 15px 15px 20px rgba(0,0, 0, 0.4);
-webkit-transform: scale(1.05);
-moz-transform: scale(1.05);
transform: scale(1.05);
}
with:-

audio
{
-webkit-transition:all 0.5s linear;
-moz-transition:all 0.5s linear;
-o-transition:all 0.5s linear;
transition:all 0.5s linear;
-moz-box-shadow: 2px 2px 4px 0px #006773;
-webkit-box-shadow:  2px 2px 4px 0px #006773;
box-shadow: 2px 2px 4px 0px #006773;
-moz-border-radius:7px 7px 7px 7px ;
-webkit-border-radius:7px 7px 7px 7px ;
border-radius:7px 7px 7px 7px ;
} */

/* audio::-webkit-media-controls-fullscreen-button
 */
</style>
<script type="text/javascript">
function goPage() {
	if($("#search").val()=="all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method" : "get",
		"action" :"/board/boardList"
	});
	$("#f_search").submit();	
}

// 좋아요 여부 체크function
	

/* 	function likeCheck(m_no) {
		var like_Check ;
		$.ajax({
			url : "/board/likeCheck",
			type : "get",
			data : {
				m_no : m_no
			},
			success : function(result) {
				like_Check = result;
				console.log(like_Check);
			},
			error : function() {
				alert("system error !!");
			}
		});
		return like_Check;
	} */

/* 	 function likeCheck(m_no) {
	
	 
	
	 console.log(m_no);
	 $("#m_no").val(m_no);
	 $("#detailForm").attr({
	 "method" : "get",
	 "action" : "/board/likeCheck"
	 });
	 $("#detailForm").submit();
	 } */
	

	$(function() {
		//새로운 글 불러오기
		
		
		
		
 //리스트 전체 선택  
		$("#allCheck").click(function(){
			 var chk = $("#allCheck").prop("checked");
			 if(chk) {
			  $(".chkbox").prop("checked", true);
			  
			 } else {
			  $(".chkbox").prop("checked", false);
			  
			 }
			});
		 
		 //개별 선택 시 전체 선택 해제
		 $(".chkbox").click(function(){
			  $("#allCheck").prop("checked", false);
			  
			 });
	

		/* 제목 클릭 시 상세 페이지 이동을 위한 이벤트  */
		$(".goDetail,.img").click(function() {
			var m_no = $(this).parents("tr").attr("data-num");
			console.log(m_no);
			$("#m_no").val(m_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardDetail"
			});
			$("#detailForm").submit();
		});



		//선택된 항목  삭제 
		 $("#selectDelete_btn").click(function(){
			  var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chkbox']:checked").each(function(){
			    checkArr.push($(this).attr("data-m_no")); //선택된 체크박스가 가지고 있는 m_no를 배열에 담는다 . 
			   });
			    
			   $.ajax({
			    url : "/board/adminDelete",
			    type : "post",
			    data : { check : checkArr },
			    success : function(result){
			    	if(result ==1){
			    		location.href = "/board/adminPaage";		
			    		
			    	}else{
			    		alert("System Error");
			    	}
			     
			    }
			   });
			  } 
			 });
		
		
		

		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word = "<c:out value ='${data.keyword}'/>";
		let value = "";

		if (word != "") {
			$("#keyword").val("<c:out value ='${data.keyword}'/>");
			$("#search").val("<c:out value ='${data.search}'/>");

			if ($("#search").val() != 'm_explain') {
				//:contains()는 특정 텍스틀 포함한 요소 반환
				if ($("#search").val() == 'm_title')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'm_name')
					value = "#list tr td.name";

				console.log($(value + ":contains('" + word + "')").html());

				$(value + ":contains('" + word + "')").each(
						function() {
							var regex = new RegExp(word, 'gi');
							$(this).html(
									$(this).html().replace(
											regex,
											"<span class = 'required'>" + word
													+ "</span>"));
						});

			}
		}
		


		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkData("#keyword", "검색어를")) return;
			} else if ($("#search").val() == "all") {
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/board/boardList"

			});
			$("#f_search").submit();
		});

		/* pageMaker */
    	$(".paginate_button a").click(function (e) {
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		});
	
	}); // 최상위 종료
</script>

<title>BoardList</title>
</head>

<body>
<div class ="text-left">
				<input type="button" id="selectDelete_btn" class="btn btn-default"
				value="Delete">
				<input type="button" id="hideBtn" class="btn btn-default"
				value="Hide"/>
 </div>
	<div class="container">
		<h3 class ="text-center">Administration Page</h3>		

		<form id="detailForm">
			<input type="hidden" id="m_no" name="m_no" />
			
		</form>
		<%-- =====================검색기능 시작 =========================== --%>
		<div id="boardSearch" class="text-center">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"> 
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				<div class="form-group">
					<label>검색조건</label> <select id="search" name="search"
						class="form-control">
						<option value="all">전체</option>
						<option value="m_title">제목</option>
						<option value="m_explain">내용</option>
						<option value="m_name">작성자</option>
					</select> <input type="text" id="keyword" name="keyword"
						placeholder="검색어를 입력하세요" class="form-control" style="width: 300px;">
					<button type="button" id="searchData"
						class="btn btn-primary btn-sm">검색</button>
				</div>
			</form>
		</div>
		<%-- =====================검색기능 종료 =========================== --%>
		<div class="text-center">
			<!-- <h3>글목록</h3> -->
		</div>
		<%-- ==================== 리스트 시작 =========================== --%>
		<div id="boardsList">
			<table summary="게시판 리스트" class="table">

				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="21%" />
					<col width="13%" />
					<col width="24%" />
					<col width="50%" />
				</colgroup>
				<thead>
					<tr>
					
						<th>선택</th>
						<th>제목</th>
						<th>가격</th>
						<th>작성자</th>
						<th>장르</th>
						<th>추천수</th>
						<th></th>

					</tr>
				</thead>
				<tbody id="list" class="table">
					<!-- 데이터 출력 -->
					<tr>
						
						<td><input type="checkbox" name="allCheck" id="allCheck" class="" /></td>
						<td class="text-left"><label for="allCheck" class="">전체선택</label></td>
					</tr>
					<c:choose>
						<c:when test="${not empty boardList }">
							<!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
							<c:forEach var="board" items="${boardList}" varStatus="status">
								<!-- items 의 항목을 모두 반복 -->
								<tr class="text-center" data-num="${board.m_no}">
									<!-- data-num 이 해당 글번호를 가지고있다. -->
									<td class ="text-left"><input type="checkbox" class ="chkbox" name ="check"  data-m_no ="${board.m_no}"/></td>
									<td class="goDetail text-left">${board.m_title}</td>
									<c:choose>
										<c:when test ="${board.m_price != 0}">
											<td class="text-left"> <fmt:formatNumber value="${board.m_price}" type="currency"  currencyCode ="KRW" pattern="₩ ###,###,###" /></td>
										</c:when>
										<c:otherwise>
											<td class="text-left">무료 배포</td>
										</c:otherwise>
									</c:choose>								
									<td class="name text-left">${board.m_name}</td>
									<td class ="genre text-left">${board.m_genre}</td>
									<td class="">
											${board.m_recommentcnt}
											<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
											</td>
											
									<td class="player-container" oncontextmenu='return false'>
									
									<audio id="player" controls controlsList="nodownload"
											src="/uploadStorage/audioFile/${board.m_file}"></audio></td>
									<c:choose>
									
										<c:when test ="${board.m_price !=0}">
											<c:if test ="${board.m_stock !=0}">
												<td>In Stock</td>

											</c:if>
											<c:if test = "${board.m_stock !=1}">
												<td><button type="button" class="btn btn-default payment" disabled="disabled"
														 aria-label="Left Align">
														<span aria-hidden="true">Out of Stock</span>
													</button></td>
											</c:if>
										</c:when>
										
										<c:otherwise>
											<td>Free Track</td>
										</c:otherwise>
									</c:choose>	
											
									
								</tr>


							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- if문의 else -->
							<tr>
								<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- ==========================리스트 종료============================== -->
		<!--==========================pagination============================== -->
		<tag:pagination endPage="${pageMaker.endPage }"
			startPage="${pageMaker.startPage }" amount="${pageMaker.cvo.amount }"
			next="${pageMaker.next }" prev="${pageMaker.prev }"
			pageNum="${pageMaker.cvo.pageNum }" />


		<!-- ==========================글쓰기 버튼 출력 시작====================== -->
		<div class="contentBtn text-right">

		</div>
		<!-- ==========================글쓰기 버튼 출력 종료======================= -->
	</div>

	<form id = "like_f">
	<input type ="hidden" id="likecnt" name ="likecnt" value ="${result.likecnt}"/>
	</form>

</body>
</html>