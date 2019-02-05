<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<form class="form-horizontal" name="Login" method="post" action="FindPWAct">
		<h2>비밀번호 찾기</h1>
			<div class="form-group">
					<label for="lastName" class="col-sm-3 control-label">ID</label>
					<div class="col-sm-9">
                        <input type="text" name="id" id="id" placeholder="ID" required="required" class="form-control" autofocus>
                    </div>
				</div>
				<div class="form-group">
					<label for="lastName" class="col-sm-3 control-label">이름</label>
					<div class="col-sm-9">
                        <input type="text" name="name" id="name" placeholder="NAME" required="required" class="form-control" >
                    </div>
				</div>
				<div class="form-group">
					<label for="lastName" class="col-sm-3 control-label">전화번호</label>
					<div class="col-sm-9">
                        <input type="text" name="phone" id="phone" placeholder="PHONE" required="required" class="form-control" >
                    </div>
				</div>
				<input type="submit" class="btn btn-primary btn-block" value="비밀번호 찾기">
		</form>
	</div>
</body>
<script>
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

var cellPhone = document.getElementById('phone');
cellPhone.onkeyup = function(event) {
	event = event || window.event;
	var _val = this.value.trim();
	this.value = autoHypenPhone(_val);
}
</script>
</html>