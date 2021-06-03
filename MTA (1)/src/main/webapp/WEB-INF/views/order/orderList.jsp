<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
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
        <style type="text/css">
        	img{
        		width:60px;
        		height:60px;
        	}
        </style>
            
         <script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>   
         
         <script type="text/javascript" src="/resources/include/js/common.js"></script>    
         <script type = "text/javascript"src = "/resources/include/dist/js/bootstrap.min.js"></script>
         <script type="text/javascript">
         $(function name() {
        	 $("#checkOutBtn").click(function(){
     			
    			 if(confirm("결제하시겠습니까?")){
    				 
    				 alert("결제가 완료 되었습니다. ") ;
    			 }else{
    				 alert("결제가 취소 되었습니다.");
    			 }
    			 
    			 location.href="/";
    			
    		 });
    		 $("#ListBtn").click(function(){
    			if(confirm("결제를 취소하고 목록으로 돌아가시겠습니까?"))	
    			 
    			 alert("결제가 취소되었습니다.") ;
    			location.href="/order/cartList";
    			 });
    		 
    		 
    		 

    			//장바구니 리스트 전체 선택  
    			$("#allCheck").click(function(){
    				 var chk = $("#allCheck").prop("checked");
    				 if(chk) {
    				  $(".chkbox").prop("checked", true);
    				  itemSum();
    				 } else {
    				  $(".chkbox").prop("checked", false);
    				  itemSum();
    				 }
    				});
    			 
    			 //개별 선택 시 전체 선택 해제
    			 $(".chkbox").click(function(){
    				  $("#allCheck").prop("checked", false);
    				  itemSum();
    				 });
    			 
    			 
    			 var total =0 ;

    			 //장바구니 가격 구하기. 
    			 $(".check").click(function(){
    				 if($("input[class='chkbox']").is(":checked")){
    			            itemSum();

    			        }else {
    			        	itemSum();
    			        }
    			 });
    			 
		});
       
         function itemSum(){
     	    var str = "";
     	    var sum = 0;
     	    var count = $(".chkbox").length;
     	    for(var i=0; i < count; i++ ){
     	        if( $(".chkbox")[i].checked == true ){
     	         sum += parseInt($(".chkbox")[i].value);
     	        }
     	    }
     	    $("#total").val(sum);
     	     
     	 }

         
         </script>
     </head>
     <body>   
      <div class= "container">



    <table class="table table-hover">
 			<colgroup>
 				<col width="30%" />
 				<col width="70%" />
 			</colgroup>
            <tr>
                <td> 
                Name : ${userInfo.user_name}    
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number : 
                </td>
                <td><input type="text" name="user_phone" id="user_phone"  value="${userInfo.user_phone}"></td>
                
            </tr>
            <tr>
                <td>
                   E-mail : 
                </td>
                <td>
                    <input type="text" name="user_email" id="user_email" value="${userInfo.user_email}">
                </td>
            </tr>
        
    </table> 
    <hr />
    <h3 class="text-center"><b>결제 리스트</b></h3>
    	<div id="boardsList">
			<table summary="결제 리스트" class="table">

				<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="13%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th>선택</th>
						<th>앨범커버</th>						
						<th>제목</th>
						<th>가격</th>
					
					</tr>
				</thead>
				<tbody id = "list" class ="table table-hover">
					<!-- 데이터 출력 -->
					
					
					<c:choose>
						<c:when test ="${not empty cartList }"> <!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
						<tr class = "text-center">
						<td class = "text-left"><input type ="checkbox" name = "allCheck" id = "allCheck" class =""/><label for ="allCheck" class ="">&nbsp;&nbsp;&nbsp;전체선택</label></td></tr>
						<c:set var="sum" value="0" />
							<c:forEach var ="cart" items="${cartList}" varStatus="status"> <!-- items 의 항목을 모두 반복 -->
								<tr class ="text-center" > 
									<td class ="text-left"><input type="checkbox" class ="chkbox" name ="check" data-cartNum ="${cart.cart_id}" data-mPrice= "${cart.m_price}" value ="${cart.m_price}"/></td>
									<td class = "text-left"><img src="/uploadStorage/coverImg/${cart.m_coverimage}"/></td>
									<td class = "goDetail text-left">${cart.m_title}</td>
									<td class ="text-left">${cart.m_price}</td>
									<td class ="name">${cart.m_name}</td>													
								</tr>
								
								<c:set var="sum" value="0" />
							</c:forEach>
							<div class="text-right">
								 <div class="sum">
									  총 합계 : <input type = "number" id ="total" readonly="readonly" value ="0"/>원
									 </div>
								</div>
						</c:when>
						<c:otherwise> <!-- if문의 else -->
							<tr>
								<td colspan="4" class ="tac text-center">장바구니에 담긴 상품이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class ="text-center">
				<button id = "checkOutBtn" class ="btn btn-success" data-cartNum ="${cart.cart_id}">Check Out</button>
				<button id = "ListBtn" class ="btn btn-success">Back to List</button>	
				<button id = "selectDelete_btn" class ="btn btn-success" >Cancel</button>
			</div>
		</div>
</div>
   
   </body>
</html>