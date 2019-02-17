<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yahait.app.Dto.OrderDto" %>
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
      .orderlist{
        border: solid black 1px;
        margin: 20px;
        padding: 10px;
      }
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
        /*하단 버튼 고정*/
        .bottom{
          position:fixed;
          left:0px;
          bottom:0px;
          width:100%;
          background-color: white;
        }
        .lb{
          margin: 20px;
        }
        .rb{
          margin: 20px;
          float: right;
        }
    </style>
  </head>
  <body>
    <div id="ys">
      YouSell
    </div>
    <div class="target">
    <%
    ArrayList<OrderDto> list = (ArrayList<OrderDto>)request.getAttribute("list");
    for(int i=0;i<list.size(); i++){
    	
    
    %>
    
    
      <div class="orderlist">
      <form method="post" name="order_<%=list.get(i).getOrdered_num() %>" action="Order_detail">
      <input type="hidden" name="ordered_num" value="<%=list.get(i).getOrdered_num() %>">
      <input type="submit" class="btn btn" value="<%=list.get(i).getOrdered_num() %>번 주문">
      </form>
      </div>
     <%} %> 
    </div>

    <div class="bottom">
      <input type="button" class="lb" value="List">
      <input type="button" class="rb" value="Walk">
    </div>
  </body>
</html>