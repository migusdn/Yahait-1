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
		<form class="form-horizontal" name="Login" method="post" action="FindIDAct">
		<h2>아이디 찾기</h2>
		
     	<div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">이름</label>
                    <div class="col-sm-9">
                        <input type="text" name="name" placeholder="이름" required="required" class="form-control" autofocus>
                    </div>
                </div>
                       <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">이메일</label>
                    <div class="col-sm-9">
                        <input type="email" name="mail" placeholder="이메일주소" class="form-control">
                    </div>
                </div>
			<input type="submit" class="btn btn-primary btn-block" value="아이디 찾기">
		</form>
		</div>
		
</body>
<script>
</script>
</html>