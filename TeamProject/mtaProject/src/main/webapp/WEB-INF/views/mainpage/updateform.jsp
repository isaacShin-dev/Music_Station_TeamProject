<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="../image/icon.png" />
    <link rel="apple-touch-icon" href="../image/icon.png" />
    <!-- 모바일 웹 페이지 설정 끝 -->

    <!--[if lt IE 9]>
        <script src="../js/html5shiv.js"></script>
         <![endif]-->

    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        
  </script>
<%-- <script>
   $(function(){
      $("#joinForm").submit(function(){
         if($("#pw").val() !== $("#pw2").val()){
            alert("비밀번호가 다릅니다.");
            $("#pw").val("").focus();
            $("#pw2").val("");
            return false;
         }else if ($("#pw").val().length < 8) {
            alert("비밀번호는 8자 이상으로 설정해야 합니다.");
            $("#pw").val("").focus();
            return false;
         }else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
            alert("공백은 입력이 불가능합니다.");
            return false;
         }
      })
      
      $("#id").keyup(function() {
         $.ajax({
            url : "../member/check_id.do",
            type : "POST",
            data : {
               id : $("#id").val()
            },
            success : function(result) {
               if (result == 1) {
                  $("#id_check").html("중복된 아이디가 있습니다.");
                  $("#joinBtn").attr("disabled", "disabled");
               } else {
                  $("#id_check").html("");
                  $("#joinBtn").removeAttr("disabled");
               }
            },
         })
      });
      
      $("#email").keyup(function(){
         $.ajax({
            url : "./check_email.do",
            type : "POST",
            data : {
               email : $("#email").val()
            },
            success : function(result) {
               if (result == 1) {
                  $("#email_check").html("중복된 이메일이 있습니다.");
               } else {
                  $("#email_check").html("");
               }
            },
         })
      });
   })
</script>--%>

<title>회원가입 폼</title>
</head>
<body>
   <div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <div class="w3-center w3-large w3-margin-top">
            <h3>Member Join</h3>
         </div>
         <div>
            <form id="usercheckForm">
               <p>
                  <label>ID</label> 
                  <input class="w3-input" type="text" id="user_id" name="user_id" required> 
                  <span id="id_check" class="w3-text-red"></span>
               </p>
               <p>
                  <label>Password</label> 
                  <input class="w3-input" id="user_passwd" name="user_passwd" type="password" value = "${mypageUpdate.user_paswwd}">
               </p>
               <p>
                  <label>Confirm</label> 
                  <input class="w3-input" id="user_passwd2" type="password" required>
               </p>
               <p>
                  <label>name</label> 
                  <input class="w3-input" type="text" id="user_name" name="user_name" required> 
               
               </p>
               <p>
                  <label>phone</label> 
                  <input class="w3-input" type="text" id="user_phone" name="user_phone" required> 
                  
               </p>
               <p>
                  <label>Email</label>
                  <input type="text" id="email" name="email" class="w3-input" required placeholder="이메일 인증 후 로그인이 가능합니다.">
                  <span id="email_check" class="w3-text-red"></span>
               </p>
               <p class="w3-center">
                  <button type="button" onclick="history.go(-1);" id="insertUserBtn" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join</button>
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
               </p>
            </form>
         </div>
      </div>
   </div>
</body>
</html>