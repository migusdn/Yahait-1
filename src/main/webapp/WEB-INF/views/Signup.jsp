<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up</title>
</head>
<body>
	<form name="Signup" method="post" action="SignupAct.jsp">
		<table align=center width=600 cellpading=0 cellpacting=0>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pw_check"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td><input type="text" name="birth"> - <input
					type="text" name="gender" size="1">******</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr">
					<button>주소찾기</button></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="mail_id">@ <input
					type=text name="mail_domain"></td>
			</tr>
			<tr>
				<td></td>
				<td><select name="mail_domain">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="abc">직접입력</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit"></td>
				<td><button>취소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>