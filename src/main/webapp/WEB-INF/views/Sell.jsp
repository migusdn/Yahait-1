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
<title>Sell</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2>SELL</h2>

			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리*</label>
				<div class="col-sm-9">
					<input type="text" name="id" id="category" placeholder="아이디"
						class="form-control" autofocus>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">상점이름*</label>
				<div class="col-sm-9">
					<input type="text" name="title" id="title" placeholder="비밀번호"
						class="form-control">
				</div>
			</div>
			<hr>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상품명*</label>
				<div class="col-sm-9">
					<input type="text" name="product" id="product" class="form-control"
						placeholder="판매 상품의 이름을 입력해주세요" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">판매가격*</label>
				<div class="col-sm-9">
					<input type="text" name="price" id="price" class="form-control"
						placeholder="상품의 가격을 입력해주세요" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상품 설명</label>
				<div class="col-sm-9">
					<input type="text" name="explanation" id="explanation"
						class="form-control" placeholder="상품에 대한 설명을 입력해주세요"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*필수 기입</span>
				</div>
			</div>
		</form>
		<button class="btn btn-primary btn-block" onclick="sellact()">회원가입</button>

	</div>
</body>

<script>
	function sellact() {

		if (check() == false) return;
		//입력폼 JSON형태로 변환하여 객체생성
		var date = new Date($('#birthDate').val())
		var sellinfo = {
			"category" : $("#category").val().trim(),
			"product" : $("#product").val().trim(),
			"title" : $("#title").val().trim(),
			"price" : $("#price").val().trim(),
			"explanation" : $("#explanation").val().trim()
		};

		$.ajax({
			url : 'SellAct', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(sellinfo), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
				if (data == "EX") {
					alert("이미 가입된 아이디입니다.");

				} else if (data == "OK") {
					alert("회원 가입이 완료되었습니다.");
					window.location.href = "login";
				}
			}

		});

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
		var name = $("#category").val().trim();
		if (name == "") {
			alert("카테고리를 입력해주세요.");
			return false;
		}

		var id = $("#title").val().trim();
		if (id == "") {
			alert("상품명을 입력해주세요.");
			return false;
		}
		var id = $("#price").val().trim();
		if (id == "") {
			alert("가격을 입력해주세요.");
			return false;
		}
		var id = $("#explanation").val().trim();
		if (id == "") {
			alert("설명을 입력해주세요.");
			return false;
		}
		return true;
	}
</script>

</html>