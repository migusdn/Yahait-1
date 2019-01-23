<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="Container">
		<div class="Header">
			<h3 align="center">정우의 세마리 치킨</h3>
		</div>
		<div class="Pay">
			<p>결제방법</p>
			<p align="right	">
				<a href="#">바로결제|</a><a href="#">만나서 결제</a>
			</p>
		</div>
		<div class="Shop_Data">
			<div>
				<div id="section1" class="label" >
					<p>메뉴</p>
				</div>
				<div class="elements" >
					<input type="checkbox" name="box1" /> 후라이드 치킨<br /> 
					<input type="checkbox" name="box1" /> 후라이드 치킨<br />
					<input type="checkbox" name="box1" /> 후라이드 치킨<br />
					<input type="checkbox" name="box1" /> 후라이드 치킨<br />
				</div>
			</div>
			<div>

				<div id="section2" class="label">
					<p>정보</p>
				</div>
				<div class="elements">
					<input type="radio" name="button1" /> - button one<br /> <input
						type="radio" name="button1" /> - button one<br /> <input
						type="radio" name="button1" /> - button one<br /> <input
						type="radio" name="button1" /> - button one<br /> <input
						type="radio" name="button1" /> - button one<br />
					<button>Submit</button>
				</div>
			</div>
			<div>
				<div id="section1" class="label">
					<p>메뉴</p>
				</div>
				<div class="elements">
					<input type="checkbox" name="box1" /> 후라이드 치킨<br /> 
					<input type="checkbox" name="box1" /> 후라이드 치킨<br />
					<input type="checkbox" name="box1" /> 후라이드 치킨<br />
					<input type="checkbox" name="box1" /> 후라이드 치킨<br />
				</div>
			</div>
		</div>
		</div>

		<script type="text/javascript">
			var elements = document.getElementsByTagName("div");
			// 모든 영역 접기
			for (var i = 0; i < elements.length; i++) {
				if (elements[i].className == "elements") {
					elements[i].style.display = "none";
				} else if (elements[i].className == "label") {
					elements[i].onclick = switchDisplay;
				}
			}
			// 상태에 따라 접거나 펼치기
			function switchDisplay() {
				var elements = document.getElementsByTagName("div");
				// 모든 영역 접기
				for (var i = 0; i < elements.length; i++) {
					if (elements[i].className == "elements") {
						elements[i].style.display = "none";
					} else if (elements[i].className == "label") {
						elements[i].onclick = switchDisplay;
					}
				}
				var parent = this.parentNode;
				var target = parent.getElementsByTagName("div")[1];
				if (target.style.display == "none") {
					target.style.display = "block";
				} else {
					target.style.display = "none";
				}
				return false;
			}
		</script>
</body>
</html>