<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>NaverLoginSDK</title>
</head>

<body>
<form> <!-- name="form2" action="main.jsp" method="post"> -->
   

   <!-- (1) LoginWithNaverId Javscript SDK -->
   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
   <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>

   <!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
   <script>
   
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "{q4HUZwPH_Ov0K9t4moiE}",
            callbackUrl: "{http://localhost:8080/test/callback.jsp}",
            isPopup: false,
            callbackHandle: false
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
         }
      );

      /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
      naverLogin.init();

      /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {
            if (status) {
               /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
               var user_email = naverLogin.user.getEmail();
               var user_nickname = naverLogin.user.getNickName();
               var user_id = naverLogin.user.getId();
               var user_birthday = naverLogin.user.getBirthday();
               var user_gender = naverLogin.user.getGender();
               
               var userinfo = {
            		   	"company" : "naver_id",
                         "id" : user_id,
                         "name" : user_nickname,
                        "mail" : user_email,
                        "birthday" : user_birthday,
                        "gender" : user_gender
               };
               
                $.ajax({
                       type: 'POST',
                       url: "SNSAct",
                       dataType: 'text',
                       data: JSON.stringify(userinfo),
                       contentType:'application/json; charset=utf-8',
                       success: function(data){
                    	   //self.close();
                    	   if(data=="Already"){
								window.location.href="Main";
							} else if(data=="sign_up"){
								alert("가입된 아이디가 없습니다. Sign_up 페이지로 이동합니다.");
								window.location.href="Signup";
							}
                       }
                  });
               
               
               /* document.form2.id.value = id;
                   document.form2.email.value = email;
                   document.form2.nickname.value = nickname; 
                   
                   document.form2.submit(); //submit버튼없이 수행가능 */
               
            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
   </script>
<!-- <input type="hidden" name="id" value="">
<input type="hidden" name="email" value="">
<input type="hidden" name="nickname" value=""><br> -->
</form>
</body>

</html>