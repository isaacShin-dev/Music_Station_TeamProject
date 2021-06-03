<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>이벤트 리스너로 장바구니 수량 변경 및 자동 합계 구하기</title>
	<link rel="stylesheet" href="/resources/include/css/mainpage/cart.css" />
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/cart.js">
	</script>
</head>
<body>

    <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">Choice</div>
                        <div class="img">Image</div>
                        <div class="pname">Music Name</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">Price</div>
                       <div class="num"></div> 
                        <div class="sum">Plus</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">Delete</div>
                    </div>
                    <div class="split"></div>
                </div>
        
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div>
                        <div class="img"><img src="/resources/include/img/musicpop.png" width="60"></div>
                        <div class="pname">
                            <span>화성 갈끄니까</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>
                        <div class="num">
                            <div class="updown">
                               <!--  <input type="text" name="p_num1" id="p_num1" size="1" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(1);"> -->
   <!--                         <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span> -->
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">20,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="261" checked="">&nbsp;</div>
                        <div class="img"><img src="./img/basket2.jpg" width="60"></div>
                        <div class="pname">
                            <span>노바 요거팜(JP-268T)</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="19000">19,000원</div>
                        <div class="num">
                            <div class="updown">
                               <!--  <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);"> -->
                              <!--   <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span> -->
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">19,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="262" checked="">&nbsp;</div>
                        <div class="img"><img src="./img/basket3.jpg" width="60"></div>
                        <div class="pname">
                            <span>아날도 바시니 보스톤 가방 20인치 (ab-380)</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price" value="15200">15,200원</div>
                        <div class="num">
                            <div class="updown">
                               <!--  <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);"> -->
                             <!--    <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-up up"></i></span> -->
                                <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">15,200원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
        
            </div>
    
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 4개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 74,200원</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <span onclick="location.href='product_purchase_list'">선택한 상품 주문</span>
                </div>
            </div>
        </form>

</body>
</html>
