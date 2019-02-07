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
<title>Sell</title>

</head>
<body>
	<div class="container">
		<form class="form-horizontal" name="multiform" id="multiform"
			action="SellAct" method="POST" enctype="multipart/form-data">
			<h2>SELL</h2>
 
			<!-- <div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리*</label>
				<div class="col-sm-9">
					<input type="text" name="id" id="category" placeholder="아이디"
						class="form-control" autofocus>
				</div>
			</div> -->

			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">상점이름*</label>
				<div class="col-sm-9">
					<input type="text" name="shop_name" id="shop_name"
						placeholder="상점이름" class="form-control">
				</div>
			</div>
			<hr>

			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리 1</label>
				<div class="col-sm-9">
					<input type="text" name="category_name1" id="category_name1"
						class="form-control" placeholder="카테고리 1" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리 2</label>
				<div class="col-sm-9">
					<input type="text" name="category_name2" id="category_name2"
						class="form-control" placeholder="카테고리2" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상점 정보</label>
				<div class="col-sm-9">
					<input type="text" name="shop_info" id="shop_info"
						class="form-control" placeholder="상점 정보" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상점 이미지*</label>
				<div class="col-sm-9">
					<input type="file" name="shop_pic" id="shop_pic"
						class="form-control" placeholder="상점 이미지" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*필수 기입</span>
				</div>
			</div>
			<input type="hidden" name="gps_x" value="">
			<input type="hidden" name="gps_y" value="">
			<input type="submit" class="btn btn-primary btn-block" value="개설">
		</form>


	</div>
</body>
<script>
    var gps_x;
	var gps_y; 
	function getLocation() {
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				gps_x = position.coords.latitude;
				gps_y = position.coords.longitude;
				document.multiform.gps_x.value=gps_x;
				document.multiform.gps_y.value=gps_y;
				
				alert(gps_x + ' '
						+ gps_y);
			}, function(error) {
				console.error(error);
			}, {
				enableHighAccuracy : false,
				maximumAge : 0,
				timeout : Infinity
			});
		} else {
			alert('GPS를 지원하지 않습니다');
		}
	}
	getLocation();
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
	/* function check() {
		var name = $("#category1").val().trim();
		if (name == "") {
			alert("카테고리1를 입력해주세요.");
			return false;
		}
		var name = $("#category1").val().trim();
		if (name == "") {
			alert("카테고리2를 입력해주세요.");
			return false;
		}
		var id = $("#title").val().trim();
		if (id == "") {
			alert("상점이름을 입력해주세요.");
			return false;
		}
		return true;
	} */
</script>


</html>