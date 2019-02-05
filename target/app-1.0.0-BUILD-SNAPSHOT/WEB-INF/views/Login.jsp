<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<!-- kakao_API -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!-- naver_API -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" name="Login" method="post" action="LoginAct">
		<h2>로그인</h2>
		
     	<div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">아이디</label>
                    <div class="col-sm-9">
                        <input type="text" name="id" placeholder="아이디" required="required" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">비밀번호</label>
                    <div class="col-sm-9">
                        <input type="password" name="password" placeholder="비밀번호" required="required" class="form-control">
                    </div>
                </div>
			<input type="submit" class="btn btn-primary btn-block" value="Login">
		</form>
		</div>
		
		
		<center>
		<div class="sns">
			<div id="naverIdLogin" style="margin: 10px 10px">
				</div>
			<div class=kakaoIdLogin style="margin: 10px 10px">
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/></a>
			</div>
			<script type='text/javascript'>
//네이버로그인
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "q4HUZwPH_Ov0K9t4moiE",
		callbackUrl: "http://localhost:8080/test/callback.jsp",
		isPopup: false, /* 팝업을 통한 연동처리 여부 */
		loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
	}
);

/* 설정정보를 초기화하고 연동을 준비 */
naverLogin.init();
/* (4) Callback의처리. 정상적으로Callback 처리가완료될경우main page로redirect(또는Popup close) */
window.addEventListener('load', function () {
naverLogin.getLoginStatus(function (status) {
if (status) {
/* (5) 필수적으로받아야하는프로필정보가있다면callback처리시점에체크*/
var email = naverLogin.user.getEmail();
var nickname = naverLogin.user.getNickName();
var id = naverLogin.user.getId();
if( email == undefined || email == null) {
alert("이메일은필수정보입니다. 정보제공을동의해주세요.");
/* (5-1) 사용자정보재동의를위하여다시네아로동의페이지로이동함*/
naverLogin.reprompt();
return
}
document.form2.id.value = id;
     document.form2.email.value = email;
     document.form2.nickname.value = nickname; 
     
     document.form2.submit(); //submit버튼없이수행가능

} else {
console.log("callback 처리에실패하였습니다.");
}
});
});

            	
            	
  //<![CDATA[
    // 사용할앱의JavaScript 키를설정해주세요.
    Kakao.init('29f368572184e58c307aadb9d48751ca');
    function loginWithKakao() {
      // 로그인창을띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
        Kakao.API.request({

        url: '/v2/user/me',

        success: function(res) {
        
        var user_id = JSON.stringify(res.id);
	// 2019.01.12. 카카오 로그인 설계
	// 2019.01.13. 카카오 로그인 설계
        var user_email = JSON.stringify(res.kakao_account.email);
        var user_nickname = JSON.stringify(res.properties.nickname);
        
        document.form1.id.value = user_id
        document.form1.email.value = user_email
        document.form1.nickname.value = user_nickname
        
        document.form1.submit(); //submit버튼없이수행가능

        }
        })

        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
 
</script>		
			</div>	
		<div class="other">
			<a href="Signup">회원가입 </a> <a href="FindID">아이디 찾기</a> <a
				href="FindPW">비밀번호 찾기</a>
		</div>
		
	</div>
	</center>

</body>
</html>