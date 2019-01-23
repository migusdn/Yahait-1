<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<div class="FindID-body">
		<form name="FindID" method="post" action="FindID2">
			<div class="form-group">
				<div class="form-findID">
					<label>이름</label> <input type="text" name="ID">
				</div>
				<div class="form-name">
					<label>이름</label> 
					<input type="text" name="name" id="name"
						placeholder="이름을 입력해주세요" required="required">
				</div>
				<div class="form-phone">
					<label>전화번호</label> 
					<input type="text" name="phone" id="phone"
						placeholder="전화번호를 입력해주세요" required="required">
				</div>
				<div class="form-name">
					<label>이름</label> 
					<input type="text" name="verify" id="verify"
						placeholder="인증번호를 입력해주세요" required="required">
				</div>
				<input type="submit" value="확인">

			</div>
		</form>
	</div>
</body>
</html>