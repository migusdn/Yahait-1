<html>
<head> 
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
</a>
<form>
<!-- <form name="form1" action="main.jsp" method="post"> -->
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('29f368572184e58c307aadb9d48751ca');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
            Kakao.API.request({

                  url: '/v2/user/me',

                  success: function(res) {
                    
                     
                     var user_id = JSON.stringify(res.id);
                     
                     var user_email = JSON.stringify(res.kakao_account.email);
                     var user_nickname = JSON.stringify(res.properties.nickname);
                     var userinfo = {
                              "id" : JSON.stringify(res.id),
                              "name" : JSON.stringify(res.properties.nickname),
                                 "mail" : JSON.stringify(res.kakao_account.email)
                     };
                  alert(userinfo);
                     $.ajax({
                          type: 'POST',
                          url: "TestAct",
                          dataType: 'text',
                          data: JSON.stringify(userinfo),
                          contentType:'application/json; charset=utf-8',
                          success: function(data){
                             alert('성공');
                          }
                     });

                     /* document.form1.id.value = user_id;
                     document.form1.email.value = user_email;
                     document.form1.nickname.value = user_nickname;
                     
                     document.form1.submit(); //submit버튼없이 수행가능  */
                  
                     
                  }
             })
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script> <!-- 자바스크립트 변수는 클라이언트 측에 있고 스크립트릿 변수는 서버 측에 있음 -->
<!-- <input type="hidden" name="id" value="">
<input type="hidden" name="email" value="">
<input type="hidden" name="nickname" value=""><br> -->
</form>
</body>
</html>