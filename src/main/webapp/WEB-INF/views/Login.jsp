<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<div class="login-body">
				<form name="Login" method="post" action="LoginAct.jsp">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" name="userEmail" id="inputEmail"
								class="form-control" placeholder="Email address"
								required="required" autofocus="autofocus">
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" name="userPassword" id="inputPassword"
								class="form-control" placeholder="Password" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								비밀번호 기억
							</label>
						</div>
					</div>
					<input type="submit" value="Login">
				</form>
				<div class="text-center">
					<a href="Signup.jsp">회원가입 </a> 
					<a href="FindID.jsp">아이디 찾기</a>
					<a href="FindPW.jsp">비밀번호 찾기</a>
				</div>
			</div>
		
</body>
</html>