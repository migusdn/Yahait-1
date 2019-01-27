<!--김민섭 1.9 -->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">

      <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

      <style>
        html, body{
          width : 100%;
          height: 100%;
        }
        hr{
          border-top: 3px solid black;
        }
        /*슬라이드 css*/
        #slide{
          float:left;
        }
        .sd{
          width: 80%; height: 100%;
          margin: 0;
          background-color: #DCD8D8;
          display: none;
        }
        .rec1, .rec2, .rec3{
          display: none;
        }
        /*상단바 css*/
        #ys{
          text-align: center;
          width: 100%;
          background-color: white
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
        .bottom{
          position:fixed;
          left:0px;
          bottom:0px;
          width:100%;
          background-color: white;
        }
        .bMenu{
          float:left;
        }
        /*로딩*/
        .postLoader{
          text-align: center;
          margin-bottom: 200px;
        }
      </style>

  </head>
  <body>
    <div id="ys">
      <button type="button" id="slide" class="btn btn-default" aria-label="Menu hamburger">
        <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
      </button>
      <h1>YOUSELL</h1>
    </div><hr>

    <div class="sd">
      <ul id="emilia-list">
        <li><a href="#">판매하기</a></li>
        <li><a href="#">판매정보</a></li>
        <li><a href="#">내정보 수정</a></li>
        <li><a href="#">문의</a></li>
        <li><a href="#">환경설정</a></li>
      </ul>
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
          <img class="ps" src="img/중국관.jpg">
          <div class="carousel-caption">
            <h1>중국관</h1>
            <h2>매해볶 5000원</h2>
          </div>
        </div>
        <div class="item">
          <img class="ps" src="img/정안식당.jpg">
          <div class="carousel-caption">
            <h1>정안식당</h1>
            <h2>제육덮밥 5500원</h2>
          </div>
        </div>
        <div class="item">
          <img class="ps" src="img/홍원.jpg">
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
    </div><hr>

    <h1>근처상점</h1>
    <div id="target"></div>
    <!-- 더보기 버튼 <button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">More View</button>-->
    <div class="postLoader"></div>

    <div class="bottom">
      <div class="bMenu">
        <h2><a href="#">홈</a></h2>
      </div>
      <div class="bMenu">
        <h2><a href="#">즐겨찾기</a></h2>
      </div>
      <div class="bMenu">
        <h2><a href="#">주문알림</a></h2>
      </div>
      <div class="bMenu">
        <h2><a href="#">지도</a></h2>
      </div>
    </div>

  </body>
</html>

<%
  Connection conn = null;
  PreparedStatement pst = null;
  ResultSet rs = null;

  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/yahait?serverTimezone=UTC";
  conn = DriverManager.getConnection(url, "root", "1111");
  int i = 3;
  int j;
  String Query = "select * from list limit " + i;
  pst = conn.prepareStatement(Query);
  
  
  rs = pst.executeQuery();
  if(rs!=null){
  while(rs.next()){
    String store = rs.getString("store");
    String product = rs.getString("product");
    if(store==null)
    	store="text";
    if(product==null)
    	product="product";
%>
  <script>
    var store = "<%=store%>"
    var product = "<%=product%>"

    $('#target').append('<div class="rec"><h1>'+store+'<br>메뉴:'+product+'</h1></div>');
  </script>
<%
  }
  }else {
	  String store="text";
	  String product="abc";
  }
%>

<script>
  //김민섭 1.10슬라이드 메뉴
  $('#slide').click(function(){
    $('html').animate({scrollTop : 0}, 0); //맨위로 이동
    $('.sd').toggle("slide", { direction: "left" }, 1000);
  })

  //김민섭 1.15 상단바 고정
  var ysOffset = $('#ys').offset();
  $(window).scroll(function(){
    if($(document).scrollTop() > ysOffset.top){
      $('#ys').addClass('fixed');
    }else{
      $('#ys').removeClass('fixed');
    }
  })

  //김민섭 1.14 더보기 로딩 버튼 <-- 스크롤했을때 자동 로딩으로 바꿔야함 1.22
  function postFunc(){
    $('.postLoader').html('<img class="loader" src="img/loader.gif">');
  }
  var processScroll = true;
  $(window).scroll(function() {
      if (processScroll  && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
          processScroll = false;
          if($('.postLoader').html() != '<img class="loader" src="img/loader.gif">');
          postFunc();
          setTimeout(function(){
              $('.postLoader').empty();
              <%
              j = i;
              i = i + 3;
              Query = "select * from list limit " + j + ", " + i;
              pst = conn.prepareStatement(Query);
              rs = pst.executeQuery();

              while(rs.next()){
                String store = rs.getString("store");
                String product = rs.getString("product");
              %>
              var store = "<%=store%>"
              var product = "<%=product%>"

              $('#target').append('<div class="rec"><h1>'+store+'<br>메뉴:'+product+'</h1></div>');

              <%
                }
              %>

          }, 1000);
          processScroll = true;
        }
      })
  /*$('#myButton').click(function(){
    var btn = $(this).button('loading');

    setTimeout(function(){
        btn.button('reset');
        <%
        j = i;
        i = i + 3;
        Query = "select * from list limit " + j + ", " + i;
        pst = conn.prepareStatement(Query);
        rs = pst.executeQuery();

        while(rs.next()){
          String store = rs.getString("store");
          String product = rs.getString("product");
        %>
        var store = "<%=store%>"
        var product = "<%=product%>"

        $('#target').append('<div class="rec"><h1>'+store+'<br>메뉴:'+product+'</h1></div>');

        <%
          }
        %>

    }, 1000);
  })*/
</script>
