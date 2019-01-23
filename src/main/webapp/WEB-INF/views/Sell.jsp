<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="Sell-body">
		<form name="Sell" method="post" action="SellAct.jsp">
			<div class="form-group">
				<div class="form-category">
					<label>카테고리</label> <select>
						<option>1번째 분류</option>
					</select> <select>
						<option>2번째 분류</option>
					</select>

				</div>
				<div class="from-title">
					<label>제목</label> 
					<input type="text" name="title" id="title"
						class="form-control" placeholder="제목을 입력해주세요" required="required">
				</div>
			</div>
			<hr>
			<div class="form-group">
				<div class="form-product">
				<label>상품명</label>
					<input type="text" name="product" id="product"
						class="form-control" placeholder="판매 상품의 이름을 입력해주세요" required="required">
				</div>
				<div class="from-price">
					<label>판매가격</label>
					<input type="text" name="price" id="price"
						class="form-control" placeholder="상품의 가격을 입력해주세요" required="required">
				</div>
				<div class="from-explanation">
					<label>상품 설명</label>
					<input type="text" name="explanation" id="explanation"
						class="form-control" placeholder="상품에 대한 설명을 입력해주세요" required="required">
				</div>
			</div>
			<hr>
			<div class="product_img">
				<img src="">
			</div>
			
			<input type="submit" value="개설하기">
		</form>
		
	</div>
</body>
</html>