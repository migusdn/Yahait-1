<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      </head>
      <style>
        html, body{
          width : 100%;
          height: 100%;
        }
        /*슬라이드 css*/
      body {
        font-family: "Lato", sans-serif;
        transition: background-color .5s;
      }

      .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #111;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
      }

      .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
        transition: 0.3s;
      }

      .sidenav a:hover {
        color: #f1f1f1;
      }

      .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
      }

      #main {
        transition: margin-left .5s;
       padding: 16px;
      }

      @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
      }
      
        /*상단바 css*/
        #ys{
          text-align: center;
          width: 100%;
        }
        .fixed{
          position: fixed;
          top: 0px;
        }
        .rec{
          border: 1px solid black;
          margin: 20px;
        }
        /* 포토슬라이드 css */
        .ps{
          display: block;
          margin: 0px auto;
        }
        .slide{
          height: 20%;
        }
        .carousel-inner, .item{
          height: 100%;
        }
        .carousel-caption{
          color: black;
        }
        .carousel-control.left, .carousel-control.right{
          background-image: none;
        }
        /*하단 고정 메뉴바*/
        .page-footer{
        
          position:fixed;
          
          bottom:0px;
          
          width:100%;
          background-color: white;
          text-align: center;
          }
          
        /*로딩*/
        .postLoader{
          text-align: center;
          margin-bottom: 200px;
        }
        
        /*템플릿*/
      	.media {

	  	background-color: #fffafa;
      	border-style: solid;
      	border-color: #dcdcdc;
		
      	}

      	.media-object{
		
      	margin: 20px;
 		
      	}
      	</style>

  </head>
  <body>
  
<div id="main">
     <!-- 슬라이드 버튼 -->
     <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;메뉴</span>
     <!--  버튼부분 -->
    <div id="ys">
    <h1>YOUSELL</h1>
</div>

    
    <!-- 슬라이드 부분 -->
   <div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
     <a href="MemberinfoUpdata">내정보 수정</a>
     <a href="Sell">판매하기</a>
     <a href="Manager">내 상점 관리</a>
     <a href="#">문의</a>
     <a href="loginout">로그아웃</a>
   </div>
   
        <h1>랭킹순위</h1>
    <div id="carousel-example-generic" class="carousel slide" data-interval="false" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="ps" src="images/짜장면.jpg">
          <div class="carousel-caption">
            <h1>중국관</h1>
            <h2>매해볶 5000원</h2>
          </div>
        </div>
        <div class="item">
          <img class="ps" src="images/치킨.jpg">
          <div class="carousel-caption">
            <h1>정안식당</h1>
            <h2>제육덮밥 5500원</h2>
          </div>
        </div>
        <div class="item">
          <img class="ps" src="images/삽겹살.jpg">
          <div class="carousel-caption">
            <h1>홍원</h1>
            <h2>탕짬 6000원</h2>
          </div>
        </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
      <h1>
      
      </h1>
    </div>
    
<div class="target">
</div>
<div class="postLoader">
</div>


	    <footer class="page-footer font-small indigo">
	        <div class="container">
	     	<div class="row text-center text-xs-center text-sm-left text-md-left">
	       <div class="col-xs-12 col-sm-3 col-md-3">
          	<h6 class="text-uppercase font-weight-bold">
            <a href="#"><h2>홈</h2></a>
          		</h6>
        	</div>
        	
	         <div class="col-xs-12 col-sm-3 col-md-3">
          	<h6 class="text-uppercase font-weight-bold">
            <a href="#"><h2>즐겨찾기</h2><a>
          	</h6>
        	</div>
        	
	       <div class="col-xs-12 col-sm-3 col-md-3">
          	<h6 class="text-uppercase font-weight-bold">
            <a href="#"><h2>주문알림</h2></a>
          		</h6>
        	</div>
        	
	       <div class="col-xs-12 col-sm-3 col-md-3">
          	<h6 class="text-uppercase font-weight-bold">
            <a href="#"><h2>지도</h2></a>
          		</h6>
        	</div>
        	</div>
     
     </div>
   		 </footer>

    
</div>
  </body>
</html>

<script>
$(document).ready(function() {
	
	var Mainfetch = null;
	
	
	$.ajax({
		url : 'sessioncheck', //내가 보내는 서버주소(컨트롤러)
		dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태
		type : 'POST', 
		data : null, //내가 서버로 보내는 데이터
		success: function (data) { 
			if (data == "OK") {
                console.log("세션값있음")
            	$.ajax({
            		url : "Mainfetch", //내가 보내는 서버주소(컨트롤러)
            		dataType : 'text', //내가 서버로 부터 리턴받는 데이터 형태
            		type : 'POST',
            		data : null, //내가 서버로 보내는 데이터
            		success: function (data) {
            
            			console.log(data);
            			Mainfetch = JSON.parse(data);
            			console.log(Mainfetch.shop.length);
            			
            			for(i=0; i<Mainfetch.shop.length; i++){
            			console.log(i+"번째 jsob값"+Mainfetch.shop[i].shopname+"   "+Mainfetch.shop[i].shoppic);
            			var shopname = Mainfetch.shop[i].shopname;
            			var shoppic = Mainfetch.shop[i].shoppic;
            			
            			var str =  '<div class="media">'
            			    str += '<div class="media-left">'
            				str += '<a href="#"><img class="media-object" src="images/'+shoppic+ '" alt="test"></a></div>'
            				str += '<div class="media-body" style="opacity: 0.8;">'
            				str += '<p><a href="#" class="btn btn-primary" role="button">상점바로가기</a>' 
            				str += '<a href="#" class="btn btn-default" role="button">상점위치찾기</a></p>'
            				str += '<div class="col-xs-12 col-md-3 text-center">'
            				str += '<h1 class="rating-num">4.0</h1>'
            				str += '<div class="rating">'
            				str += '<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">'
            				str += '</span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">'
            			    str += '</span><span class="glyphicon glyphicon-star-empty"></span></div>'
            			    str += '<div><span class="glyphicon glyphicon-user"></span>1,050,008 total</div></div>'
            			    str += ' <h4 class="media-heading">'+shopname+'</h4>'
            			    str += 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pin</div>'
            			    str += '</div>'
          		      	    $('.target').append(str);
          		      	
          		      	
            			}
            		}
            	});
			}	
			else if (data == "NO") {
				alert("로그인이 필요합니다.");
				location.replace("Login");
			}			
		}
	
   });
});

function postFunc(){
    $('.postLoader').html('<img class="loader" src="images/loading.gif">');
  }

//김민섭 1.10슬라이드 메뉴 -> 오경환 다시 수정
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
}
 
  //김민섭 1.15 상단바 고정
  var ysOffset = $('#ys').offset();
  $(window).scroll(function(){
    if($(document).scrollTop() > ysOffset.top){
      $('#ys').addClass('fixed');
    }else{
      $('#ys').removeClass('fixed');
    }
  })

      
  
  
  //김민섭 1.14 더보기 로딩 버튼 <-- 스크롤했을때 자동 로딩으로 바꿔야함 1.22 완성

  var processScroll = true;
  $(window).scroll(function() {
      if (processScroll  && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
          processScroll = false;
          if($('.postLoader').html() != '<img class="loader" src="images/loading.gif">');
            postFunc();
            setTimeout(function(){
            $('.postLoader').empty();
            $('.target').append("<div><h1>테스트창</h1></div>");
      }, 2000);
      processScroll = true;
    }
  })
  
  
</script>