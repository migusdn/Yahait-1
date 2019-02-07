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
<title>Test</title>
</head>
<body>
	<div class="container">
		<form name="shop1" method="post" action="Shop">
		<input type="text" name="shop_num" value="1">
		<input type="submit" class="btn btn-primary btn-block" >
		</form>
		

	</div>
</body>

<!-- <script>
	function signcehck() {

		
		
		var signinfo = {
			"shop_num" : "1"
		};

		$.ajax({
			url : 'ShopAct', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
			dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
			type : 'POST', //post 일경부 rquestbody 안으로들어감
			contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
			data : JSON.stringify(signinfo), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
			success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
			
				var return_data = JSON.parse(data);				
				
				$.ajax({
					url : 'Shop', //내가 보내는 서버주소(컨트롤러 매핑: @RequestMapping("/SignupCheck"))
					dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태 
					type : 'POST', //post 일경부 rquestbody 안으로들어감
					contentType : 'application/json; charset=UTF-8', //보내는 데이터 형태
					data : JSON.stringify(return_data), //내가 서버로 보내는 데이터(signinfo 제이슨 객체)를 보냄
					success : function(data) { //data는 서버측에서 날라온 데이터를 다시 받아서 ajax 처리
						if(data==OK)
										
						
						
					}

				});
			}

		});

	}
</script> -->

</html>