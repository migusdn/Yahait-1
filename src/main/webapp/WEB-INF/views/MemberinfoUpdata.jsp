<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Sign up</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2>회원정보수정</h2>

			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">아이디*</label>
				<div class="col-sm-9">
					<input type="text" name="id" id="id" placeholder="${iogincheck}"
						class="form-control" disabled autofocus>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">비밀번호*</label>
				<div class="col-sm-9">
					<input type="password" name="pw" id="pw" placeholder="비밀번호"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">비밀번호
					재확인*</label>
				<div class="col-sm-9">
					<input type="password" name="pw_check" id="pw_check"
						placeholder="비밀번호 재확인" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="birthDate" class="col-sm-3 control-label">생년월일*</label>
				<div class="col-sm-9">
					<input type="date" name="brithDate" id="birthDate"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">이메일*</label>
				<div class="col-sm-9">
					<input type="email" name="mail_id" id="mail_id" placeholder="${mailinfo}"
						class="form-control" disabled>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">이름*</label>
				<div class="col-sm-9">
					<input type="text" name="name" id="name" placeholder="${name}" class="form-control" disabled>
				</div>
			</div>
			<div class="form-group">
				<label for="phoneNumber" class="col-sm-3 control-label">휴대폰
					번호*</label>
				<div class="col-sm-9">
					<input type="phoneNumber" name="cellphone" id="cellPhone"
						placeholder="${phone}" class="form-control" disabled> <span
						class="help-block" >인증에 필요합니다. </span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">성별</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="radio"
								name="gender" value="Woman">여자
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" value="Man">남자
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*필수 기입</span>
				</div>
			</div>
		</form>
		<button class="btn btn-primary btn-block" onclick="memberinfoupdata()">회원정보 수정</button>

	</div>
</body>

<script>
	function memberinfoupdata() {

		//if (check() == false)
		//	return;
		//입력폼 JSON형태로 변환하여 객체생성
		var signinfo = {
			"pass" : $("#pw").val().trim()
		};

		$.ajax({
			url : 'MemberinfoUpdataAct', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(signinfo), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리

				if (data == "duplicated_id") {
					alert("이미 가입된 아이디입니다.");

				} else if (data == "OK") {
					alert("회원 가입이 완료되었습니다.");
					window.location.href = "Login";
				} else if (data == "BirthError") {
					alert("생년월일을 정확히 입력해주십시오.")
				}
			}

		});

	}
	//핸드폰 번호폼 스크립트
	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
	//핸드폰 번호폼 스크립트
	var cellPhone = document.getElementById('cellPhone');
	cellPhone.onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	}
	//입력값 체크
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