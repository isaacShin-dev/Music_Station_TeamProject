<%@ tag language="java" pageEncoding="UTF-8"%>

<%@attribute name = "pageNum" type = "java.lang.Integer" required ="true"%>
<%@attribute name = "amount" type = "java.lang.Integer" required ="true"%>
<%@attribute name = "startPage" type = "java.lang.Integer" required ="true"%>
<%@attribute name = "endPage" type = "java.lang.Integer" required ="true"%>
<%@attribute name = "prev" type = "java.lang.Boolean" required ="true"%>
<%@attribute name = "next" type = "java.lang.Boolean" required ="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class = "text-center">
			<ul class = "pagination">
				<c:if test ="${prev}">
					<li class = "paginate_button previous">
						<a href ="${startPage - 1}">Previous</a>
					</li>
				</c:if>
				<c:forEach var = "num" begin ="${startPage}" end = "${endPage}">
					<li class = "paginate_button ${pageNum == num ? 'active':''}">
						<a href = "${num}">${num}</a>
					</li>								
				</c:forEach>
				<c:if test ="${next}">
					<li class = "paginate_button next">
						<a href = "${endPage +1}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>