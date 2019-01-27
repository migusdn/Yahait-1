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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

p {
	margin: 0px;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
}
</style>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2>Shop Manager</h2>
			<div class="form-group">

				<label for="id" class="col-sm-3 control-label">n번째 상점*</label>
				<div class="col-sm-9">

					만물은 얼음이 있을 뿐~~~~~~~~~~~~ <label class="switch"> <input
						type="checkbox"> <span class="slider round"></span>
					</label>
					<p>OFF</p>
					<p style="display: none;">ON</p>

				</div>


			</div>
			<div class="form-group">

				<label for="id" class="col-sm-3 control-label">n번째 상점*</label>
				<div class="col-sm-9">

					만물은 얼음이 있을 뿐~~~~~~~~~~~~ <label class="switch"> <input
						type="checkbox"> <span class="slider round"></span>
					</label>
					<p>OFF</p>
					<p style="display: none;">ON</p>

				</div>


			</div>
			<div class="form-group">

				<label for="id" class="col-sm-3 control-label">n번째 상점*</label>
				<div class="col-sm-9">

					만물은 얼음이 있을 뿐~~~~~~~~~~~~ <label class="switch"> <input
						type="checkbox"> <span class="slider round"></span>
					</label>
					<p>OFF</p>
					<p style="display: none;">ON</p>

				</div>


			</div>
	</div>
</body>
</html>