<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
   <head>
      <meta charset="UTF-8" />
      <!-- html4 : 파일의 인코딩 방식 지정 -->
      <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" type = "text/css" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" type = "text/css" href="/resources/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      <style type="text/css">
      .col-md-2.nimage{
      	float:left;
      	padding: 0;
      
      	border: 5px solid gray;
      	height: 150px;
      	width: 200px;
      }
      
      td{
      	padding: 0;
      	margin: 0;
      }
      </style>
      <!--[if lt IE 9]>
      
      <script src
      ="../js/html5shiv.js"></script>
      <![endif]-->
      <link rel="stylesheet" type = "text/css" href="/resources/include/css/leftslide.css"/>
      <link rel="stylesheet" type = "text/css" href="/resources/include/css/mainpage/main_login.css"/>



      <title>MTA에 오신걸 환영합니다.</title>
      <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
	    <link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css">
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
	  var clicks= 0;
      $(function(){
    	/*
    	  $("#mainlogin_page").click(function(){
    		  if(clicks==0){
    			  $(".inner").addClass("open");
    			  clicks++;
    			  console.log(clicks);
    		  }else{
    			  $(".inner").removeClass("open");
    			  
    			  clicks--;
    			  console.log(clicks);
    		  }
    	  });
    	*/
    	
		  $("#loginbutton").click(function(){
			 $("#inner").addClass("open");
		  });
		  $("#main_page").click(function(){
			 $(".inner").removeClass("open");
			});
		  
		
      });
     </script>
   </head>
	<body>
		
		<div class = "container">
		</br><br></br></br>
			<!--뉴스 게시판-->
			<div id="news_chart" style="width:80%;"><h4>***News Chart***</h4>
				<table class="table table-hover" style="width:100%;">
				<thead>
				<colcolgroup>
				  <col width ="10%" />
                  <col width ="30%" />
                  <col width ="60%" />
				</colcolgroup>
					 <tr>
		                     <th data-value="n_no" class="order text-center">No</th>
		                     <th class="text-center">title</th>
		                     <th class="text-center">sub-title</th>
		                    
		                  </tr>
				</thead>
				<tbody>
					<c:choose>
      					<c:when test="${not empty newsList}">
      						<c:forEach var="news" items="${newsList}" varStatus="status">
      							<tr class="text-center" id="notice_line" data-num="${news.n_no}">
      								<td class="col-md-2">${news.n_no}</td>
      								<td class="col-md-4">${news.n_title}</td>
      								<td class="text-left">${news.n_note}</td>
      							</tr>
      						</c:forEach>
      					</c:when>
      					<c:otherwise>
      						<tr>
      							<td colspan="4" class="tac text-center">등록된 공지사항이 존재하지 않습니다.</td>
      						</tr>
      					</c:otherwise>
      				</c:choose>
      				</tbody>
				</table>
				<table class="table">
      				<tr>
      				<c:choose>
      					<c:when test="${not empty newsList}">
      						<c:forEach var="news" items="${newsList}" varStatus="status">
      							
      								<td>
      								<img class="col-md-2 nimage"  src="/uploadStorage/news/${news.n_image}" />
									</td>
      							
      						</c:forEach>
      					</c:when>
      				
      				</c:choose>
      				</tr>
      			</table>
			</div>
			<br><br><br><br>
			<!-- 뮤직 차트-->
			
				<!--랭킹 게시판-->
				<div id="rank_chart"><h4>***Music Chart***</h4>
					<table summary="음악 랭크 차트" class="table table-hover">
						<thead>
		                  <tr>
		                     <th data-value="m_no" class="order text-center">No</th>
		                     <th class="text-center">title</th>
		                     <th class="text-center">genre</th>
		                     <th class="text-center">recommend</th>
		                  </tr>
		               </thead>
						<tbody>
										<c:choose>
											<c:when test="${not empty recentList }">
												<!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
							
							
												<c:forEach var="board" items="${recentList}" varStatus="status">
													<tr class="rank_track" data-num="${board.m_no}">
														<!-- click function() -->
														
															<td class="track_nm" style="text-align:center;">${board.m_title}</td>
															<td class="artist_nm" style="text-align:center;">${board.m_name}</td>
															<td class="artist_nm" style="text-align:center;">${board.m_genre}</td>
														<td style="text-align:center;">${board.m_recommentcnt}</td>
													</tr>
												</c:forEach>
							
											</c:when>
							
							
											<c:otherwise>
												<!-- if문의 else -->
												<p class="tac text-center">등록된 게시물이 존재하지 않습니다.</p>
											</c:otherwise>
										</c:choose>
							
							
						</tbody>
					</table>	
				</div>
				<!--장르 음악게시판-->
				<div id="like_chart">
					<h4>***Like Chart***</h4>				
				<table summary="음악 랭크 차트" class="table table-hover col-md-8">
						<thead>
		                  <tr>
		                     <th data-value="m_no" class="order text-center">No</th>
		                     <th class="text-center">title</th>
		                     <th class="text-center">genre</th>
		                     <th class="text-center">recommend</th>
		                  </tr>
		               </thead>
						<tbody>
										<c:choose>
											<c:when test="${not empty recentList }">
												<!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
							
							
												<c:forEach var="board" items="${recentList}" varStatus="status">
													<tr class="rank_track" data-num="${board.m_no}">
														<!-- click function() -->
														
															<td class="track_nm" style="text-align:center;">${board.m_title}</td>
															<td class="artist_nm" style="text-align:center;">${board.m_name}</td>
															<td style="text-align:center;">${board.m_genre}</td>
															<td style="text-align:center;">${board.m_recommentcnt}</td>
													</tr>
												</c:forEach>
							
											</c:when>
							
							
											<c:otherwise>
												<!-- if문의 else -->
												<p class="tac text-center">등록된 게시물이 존재하지 않습니다.</p>
											</c:otherwise>
										</c:choose>

						</tbody>
					</table>	
				</div>
			
		</div>
   </body>
</html>