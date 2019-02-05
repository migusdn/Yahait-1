<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<form class="form-horizontal">
		<h2>찾은 아이디값</h2>
		<h3>이름:</h3>${username}
		<h3>이메일:</h3>${usermail}
		<h3>찾은아이디값:</h3>${finidactid}
		</form>
		<button class="btn btn-primary btn-block" onclick="Login()">로그인</button>
		<button class="btn btn-primary btn-block" onclick="FindPW()">비밀번호 찾기</button>
		</div>
</body>
<script>
function Login() {
	window.location.href = "Login"
}
function FindPW() {
	window.location.href = "FindPW"
}

</script>
</html>