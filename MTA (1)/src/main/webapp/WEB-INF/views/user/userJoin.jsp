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
 <style type="text/css"> td{ border:1px solid #000000; border-collapse:collapse; } </style>

    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        
       

        //모든 공백 체크 정규식
        var empJ = /\s/g;
        //아이디 정규식 
        var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
        // 비밀번호 정규식
        var pwJ = /^[A-Za-z0-9]{4,12}$/;
        // 이름 정규식
        var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
        // 이메일 검사 정규식
        var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        // 휴대폰 번호 정규식
        var phoneJ = /^\d{3}\d{3,4}\d{4}$/;
        
        // 관심음
        $(function() {
                    //아이디 중복확인 
                    $("#id").blur(function() {
                        if ($('#id').val() == '') {
                            $('#id_check').text('아이디를 입력하세요.');
                            $('#id_check').css('color', 'red');
                        } else if (idJ.test($('#user_id').val()) != true) {
                            $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
                            $('#id_check').css('color', 'red');
                        } else if ($('#user_id').val() != '') {

                            var user_id = $('#id').val();
                            $.ajax({
                            	 url: "/user/idCheck.json",
                                type: "post",
                                data: $("#usercheckForm").serialize(),
                                dateType: "text", 
                                error : function () {
									alert("error");
								},
                                success: function(result) {
									
                                    if ( result  == 1) {
                                        $('#id_check').text('중복된 아이디 입니다.');
                                        $('#id_check').css('color', 'red');
                                        $("#usercheckForm").attr("disabled", true);
                                    } else {
                                        if (idJ.test(user_id)) {
                                            $('#id_check').text('사용가능한 아이디 입니다.');
                                            $('#id_check').css('color', 'blue');
                                            $("#usercheckForm").attr("disabled", false);
                                        } else if (user_id == '') {
                                            $('#id_check').text('아이디를 입력해주세요.');
                                            $('#id_check').css('color', 'red');
                                            $("#usercheckForm").attr("disabled", true);
                                        } else {
                                            $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                                            $('#id_check').css('color', 'red');
                                            $("#usercheckForm").attr("disabled", true);
                                        }
                                    }
                                }
                            }); //ajax/// 
                        } //else if 
                    }); //blur 
                    $('form').on('submit', function() {
                        var inval_Arr = new Array(5).fill(false);
                        if (idJ.test($('#id').val())) {
                            inval_Arr[0] = true;
                        } else {
                            inval_Arr[0] = false;
                            alert('아이디를 확인하세요.');
                            return false;
                        }
                        // 비밀번호가 같은 경우 && 비밀번호 정규식
                        if (($('#user_pw').val() == ($('#user_pw2').val())) && pwJ.test($('#user_pw').val())) {
                            inval_Arr[1] = true;
                        } else {
                            inval_Arr[1] = false;
                            alert('비밀번호를 확인하세요.');
                            return false;
                        }
                        // 이름 정규식 
                        if (nameJ.test($('#user_name').val())) {
                            inval_Arr[2] = true;
                        } else {
                            inval_Arr[2] = false;
                            alert('이름을 확인하세요.');
                            return false;
                        }
                        // 휴대폰번호 정규식
                        if (phoneJ.test($('#user_phone').val())) {
                           
                            inval_Arr[3] = true;
                        } else {
                            inval_Arr[3] = false;
                            alert('휴대폰 번호를 확인하세요.');
                            return false;
                        }
                        // 이메일 정규식
                        if (mailJ.test($('#user_email').val())) {
                            
                            inval_Arr[4] = true;
                        } else {
                            inval_Arr[4] = false;
                            alert('이메일을 확인하세요.');
                            return false;
                        }
                       
                        //전체 유효성 검사 
                        var validAll = true;
                        for (var i = 0; i < inval_Arr.length; i++) {
                            if (inval_Arr[i] == false) {
                                validAll = false;
                            }
                            // 유효성 모두 통과 
                        }
                        if (validAll == true) {
                            alert('MTA 가족이 되어주셔 감사합니다.');
                        } else {
                            alert('정보를 다시 확인하세요.')
                        }
                    });
                    $('#id').blur(function() {
                        if (idJ.test($('#id').val())) {
                            console.log('true');
                            $('#id_check').text('');
                        } else {
                            console.log('false');
                            $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
                            $('#id_check').css('color', 'red');
                        }
                    });
                    $('#passwd').blur(function() {
                        if (pwJ.test($('#passwd').val())) {
                            console.log('true');
                            $('#pw_check').text('');
                        } else {
                            console.log('false');
                            $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
                            $('#pw_check').css('color', 'red');
                        }
                    });
                    //1~2 패스워드 일치 확인
                    $('#passwd2').blur(function() {
                        if ($('#passwd').val() != $(this).val()) {
                            $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
                            $('#pw2_check').css('color', 'red');
                        } else {
                            $('#pw2_check').text('');
                        }
                    }); 
                    //이름에 특수문자 들어가지 않도록 설정 
                    $("#user_name").blur(function() { 
                       if (nameJ.test($(this).val())) { 
                          console.log(nameJ.test($(this).val())); 
                          $("#name_check").text(''); 
                          } else { 
                             $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
                             $('#name_check').css('color', 'red'); 
                          } 
                    });
                    //이메일
                    $("#user_email").blur(function() {
                       if (mailJ.test($(this).val())) {
                    	   console.log(mailJ.test($(this).val()));
                          $("#email_check").text('');
                       } else { 
                          $('#email_check').text('이메일 양식을 확인해주세요.'); 
                          $('#email_check').css('color', 'red'); 
                       } 
                    }); 
                   
                       // 휴대전화 
                       $('#user_phone').blur(function(){ 
                          if(phoneJ.test($(this).val())){ 
                             console.log(phoneJ.test($(this).val()));
                             $("#phone_check").text(''); 
                          } else { 
                             $('#phone_check').text('휴대폰번호를 확인해주세요 '); 
                             $('#phone_check').css('color', 'red'); 
                          } 
                       });
                     //관심음악
                       var  user_favorite
                       $('#input[name=user_favorite]:radio').each(function(){
                    	     user_favorite = ($(this).val());
                    	     $("#user_favorite").val() = user_favorite; 
                       });
                    
                    
                    $("#insertUserBtn").click(function() {
                  $("#usercheckForm").attr({
                     "method" : "post",
                     "enctype" : "multipart/form-data",
                     "action" : "/user/userInsert"
                  });      
                  
                  $("#usercheckForm").submit();
               });
                   
       
        }); 
  </script>

  </head> 
  <body> 
     <article class="container"> 
     
           <div class="col-md-6 col-md-offset-3"> 
              <h3>Join</h3> 
           </div> 
    
        <div class="col-sm-6 col-md-offset-3"> 
           <form id="usercheckForm" name="member">
              <div class="form-group"> 
                 <label for="user_id">Id</label> 
                 <input type="text" class="form-control" id="id" name="user_id" placeholder="ID"> 
                 <div class="eheck_font" id="id_check"></div>
              </div> 
              <div class="form-group"> 
                 <label for="user_passwd">Password</label> 
                 <input type="password" class="form-control" id="passwd" name="user_passwd" placeholder="PASSWORD"> 
                 <div class="eheck_font" id="pw_check"></div> 
              </div> 
               <div class="form-group"> 
                 <label for="user_passwd2">Confirm Password</label> 
                 <input type="password" class="form-control" id="passwd2" name="user_passwd2" placeholder="Confirm Password"> 
                 <div class="eheck_font" id="pw2_check"></div> 
              </div>  
              <div class="form-group">
                 <label for="user_name">Name</label> 
                 <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name"> 
                 <div class="eheck_font" id="name_check"></div> 
              </div> 
              
              <div class="form-group"> 
                 <label for="user_phone">PhoneNumber('-'없이 번호만 입력해주세요)</label> 
                 <input type="tel" class="form-control" id="user_phone" name="user_phone" placeholder="Phone Number"> 
                 <div class="eheck_font" id="phone_check"></div> 
              </div> 
              
              <div class="form-group"> 
                 <label for="user_email">E-mail</label> 
                 <input type="email" class="form-control" id="user_email" name="user_email" placeholder="E-mail"> 
                 <div class="eheck_font" id="email_check"></div> 
              </div>
           
                <div class="form-group">
                 <label for="mem_email">관심 음악</label><br>
               <label class="radio-inline">
                    <input type="radio" name="user_favorite" id="user_favorite" value="ballade"> 발라드
               </label>
               <label class="radio-inline">
                    <input type="radio" name="user_favorite" id="user_favorite" value="Electronic"> 일렉트로닉
               </label>
               <label class="radio-inline">
                    <input type="radio" name="user_favorite" id="user_favorite" value="Rnb"> 알앤비
               </label>
               <label class="radio-inline">
                    <input type="radio" name="user_favorite" id="user_favorite" value="Rap"> 힙합
               </label>
               <label class="radio-inline">
                    <input type="radio" name="user_favorite" id="user_favorite" value="new age"> 뉴에이지
               </label>
            </div>
            
               
               <!--  <div class="form-group"> 
                 <label for="user_phone">이미지 파일첨부</label> 
                        <input type="file" id="file" name="file" accept="image/*" onchange="setThumbnail(event);"/>
                        <div id="image_container"></div>
              
              </div>-->  
              <div class="form-group text-center">
                 <button type="button" id="insertUserBtn"class="btn btn-primary">회원가입</button> 
              </div> 
           </form> 
        </div> 
     </article> 
  </body> 
 </html>
 