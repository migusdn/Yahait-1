<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
	overflow: hidden;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	height: 9%;
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
	height: 100%;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
</head>
<body>
<div id="container" class="container">
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white" style="width: 40%;">
			<div class="option">
				<div style="height: 90%;">
					<select id="category" onchange="changeCategory();"
						style="width: 100%; height: 90%; font-size: 15px;">
						<option value="" selected disabled>카테고리 선택</option>
						<option value="foodTruck">푸드트럭</option>
						<option value="FreeMarket">플리마켓</option>
						<option value="UsedTransaction">중고거래</option>
					</select>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		
	</div>
	</div>
	<input type="button" id="reflesh" value="현재 위치에서 검색"
		onclick="changeCategory();">
	<input type="hidden" id="wlat" value="">
	<input type="hidden" id="wlong" value="">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=336a082f61b3fa28ca74c3b8637a5025&libraries=services"></script>
	<script>
	function load_shop(lat, lon, markers, infowindows){
		
		var menu = document.getElementById('category').value;
		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(),
		bounds = new daum.maps.LatLngBounds(),
		listStr = '';
		
		var Mainfetch = null;
		var load_info = {
				"gps_x" : ""+lat+"",
				"gps_y" : ""+lon+""
		};
		$.ajax({
			url : "MapAct", //내가 보내는 서버주소(컨트롤러)
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(load_info), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success: function (data) {
				if(data != "end"){
				console.log(data);
				Mainfetch = JSON.parse(data);
				console.log(Mainfetch.shop.length);
				
				for(i=0; i<Mainfetch.shop.length; i++){
				console.log(i+"번째 jsob값"+Mainfetch.shop[i].shopname+"   "+Mainfetch.shop[i].shoppic);
				var shopname = Mainfetch.shop[i].shopname;
				var shop_info = Mainfetch.shop[i].shop_info;
				var shop_num = Mainfetch.shop[i].shop_num;
				var shopgps_x = Mainfetch.shop[i].shopgps_x;
				var shopgps_y = Mainfetch.shop[i].shopgps_y;
				var category = Mainfetch.shop[i].category;
			
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
					spriteOrigin : new daum.maps.Point(0, (i * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new daum.maps.Point(13, 37)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new daum.maps.Marker({
					position : new daum.maps.LatLng(shopgps_x,shopgps_y),
					image : markerImage
				}), infowindow = new daum.maps.InfoWindow({
					content : shop_info
				});
				infowindows.push(infowindow);
				markers.push(marker);
				
			      	
			      	
				}
				displayPlaces(map, markers, fragment, listEl, menuEl, bounds);
				}
			}
		});
	}
	
	
	
	
	
		// 마커를 담을 배열입니다
		var markers = [];

		
		var checkedMarkers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		}), infowindows = [];
		var message = '<div style="padding:5px;">현재위치입니다!</div>';
		var locPosition;
		if (navigator.geolocation) {

			navigator.geolocation
					.getCurrentPosition(function(position) {

						var lat = position.coords.latitude, lon = position.coords.longitude;

						locPosition = new daum.maps.LatLng(lat, lon), message;
						load_shop(lat, lon, markers, infowindows);
						var marker = new daum.maps.Marker({
							map : map,
							position : locPosition
						});
						map.setCenter(locPosition);
					});

		} else {

			var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없습니다.'

			displayMarker(locPosition, message);
		}
		function changeCategory() {
			

			removeAllChildNods(listEl);
			removeMarkers();
			removeInfoWindows();
			if (menu === 'foodTruck') {
				checkPlace(foodTruck);
				if (checkedMarkers.length != 0) {
					createMarker(checkedMarkers);
					displayPagination(pagination)
					displayPlaces(map, markers, fragment, listEl, menuEl);
				}
			} else if (menu === 'FreeMarket') {
				checkPlace(FreeMarket);
				if (checkedMarkers.length != 0) {
					createMarker(checkedMarkers);
					displayPagination(pagination)
					displayPlaces(map, markers, fragment, listEl, menuEl);
				}
			}
		}

		function createMarker(place) {
			for (var i = 0; i < place.length; i++) {
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
					spriteOrigin : new daum.maps.Point(0, (i * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new daum.maps.Point(13, 37)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new daum.maps.Marker({
					position : place[i].position,
					image : markerImage
				}), infowindow = new daum.maps.InfoWindow({
					content : place[i].content
				});
				infowindows.push(infowindow);
				markers.push(marker);
			}
		}

		function checkPlace(shops) {
			for (var i = 0; i < shops.length; i++) {
				var polyline = new daum.maps.Polyline({
					map : map,
					path : [ map.getCenter(), shops[i].position ],
					strokeWeight : 2,
					strokeColor : '#000000',
					strokeOpacity : 0.9,
					strokeStyle : 'solid'
				});
				if (polyline.getLength() < 500) {
					checkedMarkers.push(shops[i]);
					polyline.setMap(null);
				} else {
					polyline.setMap(null);
				}
			}

		}

		function displayPlaces(map, markers, fragment, listEl, menuEl, bounds) {

			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
				itemEl = getListItem(i, infowindows[i].getContent());
				bounds.extend(markers[i].getPosition());
				(function(marker, title) {
					daum.maps.event.addListener(marker, 'click', function() {
						infowindow.close();
						displayInfowindow(marker, title);
					});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(markers[i], infowindows[i].getContent());
				fragment.appendChild(itemEl);
			}
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
			map.setBounds(bounds);
		}

		function getListItem(index, content) {
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + content + '</h5>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		function removeMarkers() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			checkedMarkers = [];
			markers = [];
		}

		function removeInfoWindows() {
			infowindows = [];
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>
