<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=2, user-scalable=no">

    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style>
      /*상단바 css*/
        #ys{
          text-align: center;
          width: 100%;
          margin-top: 20px;
        }
        .fixed{
          position: fixed;
          top: 0px;
        }
        .rec{
          border: 1px solid black;
          margin: 20px;
        }
        .list{
          border: solid black 1px;
          margin: 20px;
          padding: 10px;
        }
        .delButton{
          float: right;
        }
        /*하단 버튼 고정*/
        .bottom{
          position:fixed;
          left:0px;
          bottom:0px;
          width:100%;
          background-color: white;
          text-align: center;
        }
        .order{
          width:100%;
          background-color: #60b2e5;
          padding: 20px;
        }
    </style>
  </head>
  <body>
    <div id="ys">
      YouSell
    </div>
    <div class="target">

      <div class="list">
        <div class="item_name">뚝불</div>
        <input type="button" class="delButton" value="삭제">
        <div class="item_price">5500원</div>
        <div class="btn-group" role="group" aria-label="...">
          <button type="button" class="btn btn-default minus">-</button>
          <button type="button" class="btn btn-default num">1</button>
          <button type="button" class="btn btn-default plus">+</button>
        </div>
      </div>

      <div class="list">
        <div class="item_name">제육덮밥</div>
        <input type="button" class="delButton" value="삭제">
        <div class="item_price">5500원</div>
        <div class="btn-group" role="group" aria-label="...">
          <button type="button" class="btn btn-default minus">-</button>
          <button type="button" class="btn btn-default num">1</button>
          <button type="button" class="btn btn-default plus">+</button>
        </div>
      </div>

      <div class="list">
        <div class="item_name">돈까스</div>
        <input type="button" class="delButton" value="삭제">
        <div class="item_price">6000원</div>
        <div class="btn-group" role="group" aria-label="...">
          <button type="button" class="btn btn-default minus">-</button>
          <button type="button" class="btn btn-default num">1</button>
          <button type="button" class="btn btn-default plus">+</button>
        </div>
      </div>

    </div>
    <div class="bottom">
      <div>총 주문금액 : 18000원
      </div>
      <button type="button" class="order">주문하기</button>
    </div>
  </body>
</html>

<script>
  //수량 추가
  $('.minus').click(function(){
    var num = $(this).parent().children('.num').text();
    num--;
    $(this).parent().children('.num').text(num);
  })
  //수량 감소
  $('.plus').click(function(){
    var num = $(this).parent().children('.num').text();
    num++;
    $(this).parent().children('.num').text(num);
  })
</script>