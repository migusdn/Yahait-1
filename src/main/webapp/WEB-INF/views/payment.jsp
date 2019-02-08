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
          margin-bottom: 20px;
        }
        .fixed{
          position: fixed;
          top: 0px;
        }
        .rec{
          border: 1px solid black;
          margin: 20px;
        }
        .product{
          border-top: 1px solid black;
          margin-left: 30px;
          margin-right: 30px;
        }
        .item{
          padding: 10px;
        }
        .item_name{
          width: 20%;
        }
        .item_count{
          width: 20%;
        }
        .item_price{
          width: 20%;
        }
        .payInfo{
          border-top: 1px solid black;
          margin: 20px;
        }
        .sum{
          float: right;
        }
        .pay{
          margin: 20px;
          position:fixed;
          left:0px;
          bottom:0px;
          width:100%;
          background-color: white;
        }
        .payment{
          background-color: #60b2e5;
          width:100%;
          padding: 10px;
        }
    </style>
  </head>
  <body>
    <div id="ys">
      YouSell
    </div>
    <div class="product">
      <div class="item">
        <label class="item_name">뚝불</label>
        <label class="item_count">1</label>
        <label class="item_price">5500원</label>
      </div>
      <div class="item">
        <label class="item_name">제육덮밥</label>
        <label class="item_count">1</label>
        <label class="item_price">5500원</label>
      </div>
    </div>

    <div class="payInfo">
      <label>최종 결제 금액</label>
      <div class="sum">18000원</div>
      <div class="">
        <select>
          <option value="">네이버페이</option>
          <option value="">카카오페이</option>
          <option value="">삼성페이</option>
        </select><br>
        <input type="text" placeholder="픽업시간 설정"><br>
        <input type="text" placeholder="요청사항">
      </div>
    </div>

    <div class="pay">
      <input type="checkbox" value=""><label>개인정보 동의</label><br>
      <button type="button" class="payment">65000원 결제하기</button>
    </div>
  </body>
</html>