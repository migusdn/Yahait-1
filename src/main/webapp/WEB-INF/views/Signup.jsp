<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Sign up</title>
</head>
<body>
	
		<table align=center width=600 cellpading=0 cellpacting=0>
			<tr>
			<td>휴대폰번호</td>
			<td><input type="text" name="cellPhone" id="cellPhone" placeholder="핸드폰 번호 입력" maxlength="13" /></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" placeholder="아이디 "></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw" placeholder="패스워드"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="pw_check" placeholder="패스워드 (확인)"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" placeholder="이름"></td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td><input type="radio" id="gender" value="MAN">남자
					<input type="radio" id="gender" value="WOMAN">여자</td>
			</tr>	
			<tr>
				<td>이메일</td>
				<td><input type="text" id="mail_id"> @ <input type="text" id="mail_domain"></td>
			</tr>
			<tr>
				<td><button onclick="signcehck()">가입</button></td>
				<td><button history.back()>취소</button></td>
			</tr>
		</table>
</body>

<script>
function signcehck() {
	
	if (check() == false) return;
		//입력폼 JSON형태로 변환하여 객체생성
    	var signinfo = {
    		"id": $("#id").val().trim(),
    		"name": $("#name").val().trim(),
    		"pass": $("#pw").val().trim(),
    		"mail": $("#mail_id").val().trim() + "@" + $("#mail_domain").val().trim(),
    		"cellPhone": $("#cellPhone").val().trim(),
    		"gender": $("#gender").val().trim()
    	};
    	
    	$.ajax({
    		url : 'SignupCheck', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
    		dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
    		type : 'POST', //post 일경부 rquestbody 안으로들어감
    		contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
    		data : JSON.stringify(signinfo), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
    		success: function (data) {  //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
    			if (data == "EX") {
    				alert("이미 가입된 아이디입니다.");
    			
    			}
    			else if (data == "OK") {
    				alert("회원 가입이 완료되었습니다.");
    				window.location.href = "login";
    			        }
    			     }
    		
    	});
    	
   	}

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var cellPhone = document.getElementById('cellPhone');
cellPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}

function check() {
	var name = $("#name").val().trim();
	if (name == "") {
		alert("이름을 입력해주세요.");
		return false;
	}

	var id = $("#id").val().trim();
	if (id == "") {
		alert("아이디를 입력해주세요.");
		return false;
	}
	var id = $("#cellPhone").val().trim();
	if (id == "") {
		alert("휴대폰 번호를 입력해주세요.");
		return false;
	}
	var pass = $("#pw").val().trim();
	if (pass == "") {
		alert("패스워드를 입력해주세요.");
		return false;
	}

	var pass2 = $("#pw_check").val().trim();
	if (pass != pass2) {
		alert("입력된 두개의 패스워드가 일치하지 않습니다.");
		return false;
	}
	return true;
}

</script>

</html>