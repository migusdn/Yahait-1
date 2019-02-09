<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.yahait.app.Dto.OrderDto"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=2, user-scalable=no">

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style>
/*상단바 css*/
#ys {
	text-align: center;
	width: 100%;
	margin-top: 20px;
}

.fixed {
	position: fixed;
	top: 0px;
}

.rec {
	border: 1px solid black;
	margin: 20px;
}

.list {
	border: solid black 1px;
	margin: 20px;
	padding: 10px;
}

.delButton {
	float: right;
}
/*하단 버튼 고정*/
.bottom {
	position: fixed;
	left: 0px;
	bottom: 0px;
	width: 100%;
	background-color: white;
	text-align: center;
}

.order {
	width: 100%;
	background-color: #60b2e5;
	padding: 20px;
}
</style>
</head>
<body>
   <div class="container" id="container" style="margin-bottom = 0px;">
	<div id="ys">YouSell</div>
	<div class="target">
		<%
			if (request.getAttribute("Order_list") == null) {
		%>
		<script>
			alert('장바구니가 비어있습니다');
			history.go(-1);
		</script>
		<%
			} else {
				ArrayList<OrderDto> Order_list = (ArrayList<OrderDto>) request.getAttribute("Order_list");
			if(Order_list.size()==0){
		%>
		<script>
			alert('장바구니가 비어있습니다');
			history.go(-1);
		</script>
		<%		
			}
				for (int i = 0; i < Order_list.size(); i++) {
		%>
		<div id="item" class="list">
			<div class="item_name"><%=Order_list.get(i).getItem_name() %></div>
			
			
			<button class="btn pull-right delete" value="1">삭제</button>
			<input type="hidden" class ="item_num"id="item_num<%=i%>" value="<%=Order_list.get(i).getItem_num() %>">
			<div class="item_price"><%=Order_list.get(i).getItem_price() %></div>
			<div class="btn-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default minus">-</button>
				<button type="button" class="btn btn-default num"><%=Order_list.get(i).getItem_count() %></button>
				<button type="button" class="btn btn-default plus">+</button>
				<input class="input" type="hidden" name="item_count<%=i%>" value="<%=Order_list.get(i).getItem_count() %>">
			</div>
		</div>
		<input type="hidden" id="item_name<%=i%>" value="<%=Order_list.get(i).getItem_name() %>">
		
		<input type="hidden" id="item_price<%=i%>" value="<%=Order_list.get(i).getItem_price() %>">
		
		
		<%
				}
			}
		%>

	</div>
	<div>
		<div><h3>총 주문금액 : </h3><h3 id="total"><%=session.getAttribute("total") %></h3></div>
		<a href="OrderAct"><button type="button" class="order">주문하기</button></a>
	</div>
	</div>
</body>


<script>
	//수량 추가
	var total = Number($("#total").text());
	$('.minus').click(function() {
		var num = $(this).parent().children('.num').text();
		if(num!=1){
		num--;
		minus = Number($(this).parent().parent().children('.item_price').text());
		total -= minus;
		$("#total").text(total);
		$(this).parent().children('.num').text(num);
		$(this).parent().children('.input').val(num);
		var modify = { 
				"item_num" :$(this).parent().parent().children('.item_num').val(),
				"item_count" : $(this).parent().children('.num').text()
		};
		$.ajax({
			url : 'Basket_modify', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(modify), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
				$("#total").text(data);
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
		
		
	})
	//수량 감소
	$('.plus').click(function() {
		var num = $(this).parent().children('.num').text();
		num++;
		plus = Number($(this).parent().parent().children('.item_price').text());
		total += plus;
		$("#total").text(total);
		$(this).parent().children('.num').text(num);
		$(this).parent().children('.input').val(num);
		var modify = { 
				"item_num" :$(this).parent().parent().children('.item_num').val(),
				"item_count" : $(this).parent().children('.num').text()
		};
		$.ajax({
			url : 'Basket_modify', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(modify), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
				$("#total").text(data);
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
	})
	
	$('.delete').click(function(){
		var modify = { 
				"item_num" :$(this).parent().children('.item_num').val()
		};
		
		$(this).parents('div.list').remove();
		
		
		$.ajax({
			url : 'Basket_modify', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(modify), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
				$("#total").text(data);
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

		
	})
	
	
</script>
</html>