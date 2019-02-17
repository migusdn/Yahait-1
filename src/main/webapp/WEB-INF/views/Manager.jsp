<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.yahait.app.Dto.ShopDto"%>
<%@page import="java.util.ArrayList"%>
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
<%
	ArrayList<ShopDto> shop_data = (ArrayList<ShopDto>) request.getAttribute("shop_data");
	String[] state = {" ", "checked"};
%>
</head>
<body>
	<div id="container" class="container">

		<h2>Shop Manager</h2>
		
		<%
			if(shop_data.size()==0){
		%>
		<h3>개설된 상점이 없습니다.</h3>
		<%		
			}
			for (int i = 0; i < shop_data.size(); i++) {
		%>
		<form class="form-horizontal" id="<%=shop_data.get(i).getShop_num()%>"
			method="post" action="Item">
			<div class="form-group">
				<a href="javascript:{}"
					onclick="document.getElementById('<%=shop_data.get(i).getShop_num()%>').submit();"><h3 class="col-sm-9"><%=i%>번째 상점
				</h3></a>
				<img width="80" heigth="80"
					src="resources/images/<%=shop_data.get(i).getShop_pic()%>"
					class="col-sm-9"><label
					for="id" class="col-sm-3 control-label"></label>
				<div class="col-sm-9">
					<%=shop_data.get(i).getShop_name()%><label class="switch">
						<input type="checkbox" class="update_state" id="shop<%=i%>"
						data-id="<%=shop_data.get(i).getShop_name()%>"
						<%=state[shop_data.get(i).getState()]%>
						state="<%=shop_data.get(i).getState()%>"> <span
						class="slider round"></span>
					</label> <input type="hidden" name="shop_num"
						value="<%=shop_data.get(i).getShop_num()%>">
				</div>
			</div>
		</form>
		<form class="form-horizontal"
			name="update_<%=shop_data.get(i).getShop_num()%>" method="post"
			action="ShopinfoUpdate">
			<input type="hidden" name="shop_num"
				value="<%=shop_data.get(i).getShop_num()%>">
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="수정하기">
			</div>
		</form>
		<%
			}
		%>


	</div>
</body>
<script type="text/javascript">
	$(".update_state").click(function() {
		if ($(this).attr('state').trim() == 0) {
			$(this).attr('state', '1')
		} else {
			$(this).attr('state', '0')
		}
		var shop = {
			"shop_name" : $(this).attr("data-id"),
			"shop_state" : $(this).attr("state").trim()
		};
		$.ajax({
			url : 'StateUpdate', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(shop), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
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
	});
</script>
</html>