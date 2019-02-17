<!--김민섭 1.9 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.container {
	marginBottom: 0;
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
	background-color: white margin: 30px
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
	<div id="container">
		<div class="store">
			<h1>${shop_name}</h1>
		</div>
		<hr>

		<div role="tabpanel">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#menu"
					aria-controls="menu" role="tab" data-toggle="tab">메뉴</a></li>
				<li role="presentation"><a id="info" href="#information"
					aria-controls="information" role="tab" data-toggle="tab">정보</a></li>
				<li role="presentation"><a href="#review"
					aria-controls="review" role="tab" data-toggle="tab">리뷰</a></li>
			</ul>

			<div class="tab-content">

				<div role="tabpanel" class="tab-pane fade in active" id="menu">
					<%
						ArrayList<ItemDto> item_list = (ArrayList<ItemDto>) request.getAttribute("item_list");
						for (int i = 0; i < item_list.size(); i++) {
					%>
					<form action="Order" name="<%=item_list.get(i).getItem_num()%>"
						method="post">
						<input type="hidden" name="item_num"
							value="<%=item_list.get(i).getItem_num()%>">
						<div class="btn-group btn-lg btn-block" data-toggle="buttons">

							<button class="btn btn-info btn-lg btn-block" onclick="submit()";>
								<h2><%=item_list.get(i).getItem_name()%></h2>
							</button>
						</div>
					</form>
					<%
						}
					%>
				</div>
				<div role="tabpanel" class="tab-pane fade in active"
					id="information">
					<div class="information">
						<h2>${shop_name }</h2>
						<h3>${shop_info }</h3>
					</div>
					<div id="map_container" style="margin: 20px">
						<div id="map" style="width: 100%; height: 400px;"></div>
					</div>

				</div>


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
				<a href="Basket"><button class="btn btn">aaa</button></a>
			</div>
			<div class="shoplist">
				<a href="Basket"><button class="btn btn">장바구니</button></a>
			</div>
		</div>
	</div>
</body>
<script>

$("#info").click(function() {
	var height = $('.bottom').height();

	document,container.style.marginBottom = height+'px';
		
}
		);
function map_load(){
	
}

var container = document.getElementById('map');
				var options = {
					center: new daum.maps.LatLng(${gps_x}, ${gps_y}),
					level: 3
				};

				var map = new daum.maps.Map(container, options);
				var markerPosition  = new daum.maps.LatLng(${gps_x}, ${gps_y});
				
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});
				marker.setMap(map);
				document.getElementById("information").className = "tab-pane fade";

</script>
</html>