<!--김민섭 1.9 -->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.yahait.app.Dto.ItemDto"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=336a082f61b3fa28ca74c3b8637a5025"></script>
<style>
html, body {
	width: 100%;
	height: 100%;
}

.store {
	text-align: center;
}

.menu {
	border: 1px solid black;
	text-align: center;
	margin: 20px;
}

.review {
	border: 1px solid black;
	margin: 20px;
}

.order {
	float: left;
	padding: 20px
}

.shoplist {
	float: right;
	padding: 20px;
}

.bottom {
	position: fixed;
	left: 0px;
	bottom: 0px;
	width: 100%;
	background-color: white
}

li {
	float: left;
	width: 33%;
}

a {
	text-align: center;
}

.lbtn {
	background-color: white;
	width: 100%;
	height: 100%;
	padding: 15px 30px;
	margin: 2px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	display: inline-block;
}
</style>
</head>
<body>
	<div class="store">
		<h1>${item_name}</h1>
	</div>
	<hr>

	<div role="tabpanel">
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation"></li>
			<li role="presentation" class="active"><a href="#information"
				aria-controls="information" role="tab" data-toggle="tab">정보</a></li>
			<li role="presentation"></li>
		</ul>

		<div class="tab-content">
			<form name="basket" method="post" action="BasketAct">
			<div role="tabpanel" class="tab-pane fade" id="menu"></div>
			<div role="tabpanel" class="tab-pane fade in active" id="information">
				<div class="information">
					<h2>상품 이름 :${item_name }</h2>
					
				</div>
				<div class="information">
					<h2>상품 가격 :${item_price }</h2>
					
				</div>
				<div class="information">
					<h2>상품 설명 :${item_contents }</h2>
				</div>
				<div class="information">
					<h2>
						상품 사진 :<img width="100" heigth="100"
							src="resources/images/${item_pic }">
					</h2>
				</div>
				<div class="information">
					<div>

						<button type="button" onclick="form_btn(1)">+</button>

						<input type="text" name="quantity"id="quantity" value="1" />

						<button type ="button" onclick="form_btn(-1)">-</button>

					</div>
				</div>
				<div class="information">
				<input type="hidden" name="item_num" value="${item_num }">
				<input type="hidden" name="item_name" value="${item_name }">
					<input type="hidden" name="item_price" value="${item_price }">
					<input type="hidden" name="shop_num" value="${shop_num }">
					<input type="submit" class="btn btn" value="장바구니에 담기">
				</div>
			</div>
			</form>


			<div role="tabpanel" class="tab-pane fade" id="review">
				<div class="review">
					<h2>JMT</h2>
				</div>
				<div class="review">
					<h2>즘트</h2>
				</div>
			</div>
		</div>
	</div>
	<hr>

	<div class="bottom">
		<div class="order">
			<input type="button" class="btn1" value="전화주문">
		</div>
		<div class="shoplist">
			<input type="submit" class="btn2" value="장바구니">
		</div>
	</div>

	
	<script type="text/javascript">
		// 폼값 증가&감소

		function form_btn(n) {

			var text = document.getElementById("quantity"); // 폼 선택

			text_val = parseInt(quantity.value); // 폼 값을 숫자열로 변환

			text_val += n; // 계산

			quantity.value = text_val; // 계산된 값을 바꾼다

			if (text_val <= 0) {
				quantity.value = 1; // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
			}

		}
	</script>
</body>
</html>