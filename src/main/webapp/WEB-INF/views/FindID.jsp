<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<div class="FindID-body">
		<form name="FindID" method="post" action="FindID2">
			<div class="form-group">
				<div class="form-findID">
					<label>이름</label> <input type="text" name="ID">
				</div>
				<div class="form-birth">
				<label>주민번호</label> 
				<input type="text" name="birth">-<input type="text"
					name="gender" size="1">****** 
				</div>	
					<input type="submit"
					value="확인">
				
			</div>
		</form>
	</div>
</body>
</html>