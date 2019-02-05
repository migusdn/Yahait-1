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
<script src="http://malsup.github.com/jquery.form.js"></script>
<title>Sign up</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" name="multiform" id="multiform"
			action="ShopinfoUpdateAct" method="POST" enctype="multipart/form-data">
			<h2>상점정보수정</h2>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">상점이름*</label>
				<div class="col-sm-9">
					<input type="text" name="shop_name" id="shop_name"
						value="${shop_name}" class="form-control">
				</div>
			</div>
			<hr>

			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리 1</label>
				<div class="col-sm-9">
					<input type="text" name="category_name1" id="category_name1"
						class="form-control" value="${category_name1}" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리 2</label>
				<div class="col-sm-9">
					<input type="text" name="category_name2" id="category_name2"
						class="form-control" value="${category_name2}" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상점 정보</label>
				<div class="col-sm-9">
					<input type="text" name="shop_info" id="shop_info"
						class="form-control" value="${shop_info}" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상점 이미지*</label>
				<div class="col-sm-9">
					<input type="file" name="shop_pic" id="shop_pic"
						class="form-control" value="상점 이미지" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*필수 기입</span>
				</div>
			</div>
			<input type="hidden" name="shop_num" value="${shop_num }">
			<input type="submit" class="btn btn-primary btn-block" value="상점 정보 수정">
		</form>
	</div>
</body>

<script>
$(function() {

	//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
	$('#multiform').ajaxForm({
		cache : false,
		dataType : 'text',
		//보내기전 validation check가 필요할경우
		beforeSubmit : function(data, frm, opt) {
			//console.log(data);
			alert("전송전!!");
			return true;
		},
		//submit이후의 처리
		success : function(data) {
			if (data == "OK") {
				alert("전송성공!!");
				history.go(-1);
			}
			if (data == "NAME") {
				alert("이미 생성된 상품명 입니다. 다른 상품명을 입력해주세요");
			}
		},
		//ajax error
		error : function(e) {
			alert("에러발생!!");
			console.log(e);
		}
	});
});
</script>

</html>