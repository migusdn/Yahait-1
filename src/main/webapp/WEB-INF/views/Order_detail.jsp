<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yahait.app.Dto.OrderDto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="https://malsup.github.com/jquery.form.js "></script>
<title>Sell</title>

</head>
<body>
	<div class="container" id ="container">
			<h2>Order_detail</h2>

			<!-- <div class="form-group">
				<label for="id" class="col-sm-3 control-label">카테고리*</label>
				<div class="col-sm-9">
					<input type="text" name="id" id="category" placeholder="아이디"
						class="form-control" autofocus>
				</div>
			</div> -->

			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">주문번호</label>
				<div class="col-sm-9">
					<label>${ordered_num }</label>
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">상점번호</label>
				<div class="col-sm-9">
					<label>${shop_num }</label>
				</div>
			</div> 
			<hr>
			<%
			ArrayList<OrderDto> list = (ArrayList<OrderDto>)request.getAttribute("detail_list");
			int total=0;
			for(int i=0; i<list.size();i++){
				total = list.get(i).getItem_price()*list.get(i).getItem_count();			
			%>
			
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">상품명 : <%=list.get(i).getItem_name() %></label>
				<div class="col-sm-9">
					<label>가격 :<%=list.get(i).getItem_price() %> 수량 : <%=list.get(i).getItem_count() %></label>
				</div>
			</div>
			
			<%} %>
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">총 가격 </label>
				<div class="col-sm-9">
					<%=total %>
				</div>
			
			</div>


	</div>
</body>