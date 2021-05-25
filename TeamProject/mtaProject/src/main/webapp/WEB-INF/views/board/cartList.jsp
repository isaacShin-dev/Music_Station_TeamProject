<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

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
</head>
<body>
		<div id="boardsList">
			<table summary="장바구니 리스트" class="table">

				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="15%" />
					<col width="13%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th>카트 번호</th>
						<th>앨범커버</th>						
						<th>가격</th>
						<th>작성자</th>
					
					</tr>
				</thead>
				<tbody id = "list" class ="table table-hover">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test ="${not empty cartList }"> <!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
							<c:forEach var ="cart" items="${cartList}" varStatus="status"> <!-- items 의 항목을 모두 반복 -->
								<tr class ="text-center" data-num ="${cart.m_no}"> <!-- data-num 이 해당 글번호를 가지고있다. -->
									<td rowspan="1"><img src="/uploadStorage/coverImg/${cart.m_coverimage}"/></td>
									<td class = "goDetail text-left">${cart.m_title}</td>
									<td class ="text-left">${cart.m_price}</td>
									<td class ="name">${cart.m_name}</td>													
								</tr>
								
								
							</c:forEach>
						</c:when>
						<c:otherwise> <!-- if문의 else -->
							<tr>
								<td colspan="4" class ="tac text-center">장바구니에 담긴 상품이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>			
		</div>
</body>
</html>