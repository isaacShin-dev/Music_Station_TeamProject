<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

      <title>Insert title here</title>      
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      <link rel="stylesheet" href="/resources/include/css/reset.css" />
      <link rel="stylesheet" href="/resources/include/css/success.css" />
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript">
      function allCheck() {
          $("[name=check2]").prop("checked",true); 
  }// 모두 체크하기
   
  function oneCheck(a)
  {
      var allChkBox = $("[name=check1]");
      var chkBoxName = $(a).attr("name");
   
      if( $(a).prop("checked") )
      {
          checkBoxLength = $("[name="+ chkBoxName +"]").length;
           //전체체크박스 수(모두동의하기 체크박스 제외)
          checkedLength = $("[name="+ chkBoxName +"]:checked").length;
          //체크된 체크박스 수 
          if( checkBoxLength == checkedLength ) {
              allChkBox.prop("checked", true);
              //전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
   
          } else {
              allChkBox.prop("checked", false);
              
          }
      }
      else
      {
          allChkBox.prop("checked", false);
      }
  }
   
  $(function(){
	 
	  $(".fpmgBt2").click(function() {
		  if (!$("input:checked[id='check_1']").is(":checked")){ alert("필수사항에 동의하여 주십시오."); $("#check_1").focus(); return; }
		  else if (!$("input:checked[id='check_2']").is(":checked")){ alert("필수사항에 동의하여 주십시오."); $("#check_2").focus(); return; }
		  else{
			  location.href='/user/userJoin'
		  }
 
		});
	  
	  
      $("[name=check1]").click(function(){
          allCheck(this);
          //모두동의하기 체크박스 클릭시
      });
      $("[name=check2]").each(function(){
          $(this).click(function(){
              oneCheck(this);
          });
      });
   // 체크박스 전체 선택
      $(".checkbox_group").on("click", "#check_all", function () {
          $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
      });

      // 체크박스 개별 선택
      $(".checkbox_group").on("click", ".normal", function() {
          var is_checked = true;

          $(".checkbox_group .normal").each(function(){
              is_checked = is_checked && $(this).is(":checked");
          });

          $("#check_all").prop("checked", is_checked);
      });
  });

</script>
   </head>
   <body>
	<div class="checkbox_group">
   		<div id="joinForm">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" id="check_all" >
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" id="check_1" class="normal" > 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
MTA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 MTA 서비스의 이용과 관련하여 MTA 서비스를 제공하는 MTA 주식회사(이하 ‘MTA’)와 이를 이용하는 MTA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 MTA 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" id="check_2" class="normal" >
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
MTA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 MTA 서비스의 이용과 관련하여 MTA 서비스를 제공하는 MTA 주식회사(이하 ‘MTA’)와 이를 이용하는 MTA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 MTA 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" id="check_3" class="normal" >
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
MTA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 MTA 서비스의 이용과 관련하여 MTA 서비스를 제공하는 MTA 주식회사(이하 ‘MTA’)와 이를 이용하는 MTA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 MTA 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" id="check_4" class="normal" >
                        </li>
                    </ul>
 
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1" onClick="history.go(-1)">비동의</button></li>
                <li><button class="fpmgBt2">동의</button></li>
            </ul>
        </div>
      </div>  
   </body>
</html>