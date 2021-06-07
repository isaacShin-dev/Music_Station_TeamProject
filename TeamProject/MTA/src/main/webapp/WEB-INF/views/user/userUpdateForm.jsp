<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<title>회원정보 수정</title>
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
        
		$(function () {
			$('#user_passwd').keyup(function(){
			      $('#user_passwd2').html('');
			    });

			    $('#user_passwd2').keyup(function(){

			        if($('#user_passwd').val() != $('#user_passwd2').val()){
		
			          $('#chkNotice').html('비밀번호 입력 다름');
			        } else{
 
			          $('#chkNotice').html('비밀번호 입력 일치함');
			        }
			    });
			    
			    $("#insertUserBtn").click(function() {
					$("#userUpdateForm").attr({
						"method" : "post",
						"enctype":"multipart/form-data",
						"action" : "/user/userUpdate"
					});
					alert("회원정보가 수정되었습니다.");
					$("#userUpdateForm").submit();
				});
			    
		}); // oload function
  </script>

</head>
<body>
   <div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <div class="w3-center w3-large w3-margin-top">
            <h3>회원정보수정</h3>
         </div>
         <div>
            <form id="userUpdateForm" name="userUpdateForm">
               <p>
               	  <label>ID</label> 
                  <input class="w3-input" id="user_id" name="user_id" type="text" readonly="readonly" value = "${userInfo.user_id}">
               </p>
               <p>
                  <label>Password modify</label> 
                  <input class="w3-input" id="user_passwd" name="user_passwd" type="password" value = "${userInfo.user_passwd}">
               </p>
               <p>
                  <label>Password Confirm</label> 
                  <input class="w3-input" id="user_passwd2" type="password" required>
               </p>
               <p id="chkNotice"></p>
               <p>
                  <label>name</label> 
                  <input class="w3-input" type="text" id="user_name" name="user_name" readonly="readonly" value ="${userInfo.user_name}"> 
               </p>
               <p>
                  <label>phone</label> 
                  <input class="w3-input" type="text" id="user_phone" name="user_phone" value="${userInfo.user_phone}"> 
               </p>
                <p>
                  <label>email</label> 
                  <input class="w3-input" type="text" id="user_email" name="user_email" value="${userInfo.user_email}"> 
               </p>
                <p>
                  <label>profile-image</label> 
                  <c:if test="${not empty userInfo.profile_image }">
		                      <img class="w3-input" src="/uploadStorage/user/${userInfo.profile_image}" /></td> 
		          </c:if>
               </p>
                <p>
                  <label>profile-image input</label> 
                  <input class="w3-input" type="file" id="profile_file" name="profile_file" >(첨부된 파일변경)    
               </p>
               </form>
               <p class="w3-center">
                  <button type="button"  id="insertUserBtn"  class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">
                  Update</button>
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">
                  Cancel</button>
               </p>
            
         </div>
      </div>
   </div>
</body>
</html>