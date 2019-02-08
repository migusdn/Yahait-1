package com.yahait.app.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.yahait.app.Dao.IDao;
import com.yahait.app.Dao.SDao;
import com.yahait.app.Dto.ItemDto;
import com.yahait.app.Dto.MemberDto;
import com.yahait.app.Dto.OrderDto;
import com.yahait.app.Dto.ShopDto;

import com.yahait.app.Dao.MemberDao;

@Controller
public class OrderController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/ShoppingBasket")
	public String ShoppingBasket() {
		return "ShoppingBasket";
	}

	@RequestMapping("/payment")
	public String payment() {
		return "payment";
	}

	@RequestMapping("/Order")
	public String Order(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Order Controller 접속");
		System.out.println("-----------------------------");
		String item_num = request.getParameter("item_num");
		Map map = new HashMap();
		if (item_num != null) {
			System.out.println("form send data :" + item_num);
			IDao dao = sqlSession.getMapper(IDao.class);
			ItemDto item = dao.item_show(item_num);
			map.put("item_num", item_num);
			map.put("item_name", item.getItem_name());
			map.put("item_contents", item.getItem_contents());
			map.put("item_price", item.getItem_price());
			map.put("item_pic", item.getItem_pic());
			map.put("shop_num", item.getShop_num());
			model.addAllAttributes(map);
			System.out.println("Search data");

			System.out.println("item_name :" + map.get("item_name"));
			System.out.println("item_contents :" + map.get("item_contents"));
			System.out.println("item_price :" + map.get("item_price"));
			System.out.println("item_pic :" + map.get("item_pic"));
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('올바르지 않은 접근 입니다'); window.location.href='Main';</script>");
			out.flush();
		}

		return "Order";
	}

	@RequestMapping("/BasketAct")
	@ResponseBody
	public void OrderAct(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ParseException, IOException {
		System.out.println("Basket Controller 접속");
		System.out.println("---------------------------");
		boolean duplication_item = false;
		int total = 0;
		ArrayList<OrderDto> Order_list = null;
		if (session.getAttribute("basket") != null)
			Order_list = (ArrayList<OrderDto>) session.getAttribute("basket");
		else
			Order_list = new ArrayList<OrderDto>();
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		int shop_num = Integer.parseInt(request.getParameter("shop_num"));
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		String item_name = request.getParameter("item_name");
		int item_count = Integer.parseInt(request.getParameter("quantity"));
		OrderDto order = new OrderDto(shop_num, item_price, item_name, item_count, item_num);
		for (int i = 0; i < Order_list.size(); i++) {
			if (item_num == Order_list.get(i).getItem_num()) {
				Order_list.get(i).setItem_count(item_count);
				duplication_item = true;
			}
		}
		if (!duplication_item)
			Order_list.add(order);
		for (int i = 0; i < Order_list.size(); i++) {
			total += Order_list.get(i).getItem_price() * Order_list.get(i).getItem_count();
		}

		System.out.println("담긴 아이템 개수 :" + Order_list.size());
		session.setAttribute("basket", Order_list);
		session.setAttribute("total", total);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('장바구니 담기 성공'); window.location.href='Shop?shop_num="
				+ request.getParameter("shop_num") + "';</script>");
		out.flush();
	}

	@RequestMapping("/Basket")
	public String Basket(Model model, HttpSession session, HttpServletResponse response) throws IOException {

		ArrayList<OrderDto> Order_list = null;

		if (session.getAttribute("basket") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('장바구니가 비어있습니다'); history.go(-1);</script>");
			out.flush();
		} else {
			Order_list = (ArrayList<OrderDto>) session.getAttribute("basket");
		}
		model.addAttribute("Order_list", Order_list);

		return "Basket";
	}

	@RequestMapping("/Basket_modify")
	@ResponseBody
	public int Basket_modify( HttpSession session, @RequestBody String paramData) throws ParseException{
		System.out.println("장바구니 수정 컨트롤러 접속");
		// 클라이언트측에서 날라온 데이터확인
		System.out.println("클라이언트전송데이터(JSON):" + paramData);
		JSONParser parser = new JSONParser(); // –JSON Parser 생성
		JSONObject jsonObj = (JSONObject) parser.parse(paramData); // – 넘어온 문자열을 JSON 객체로 변환
		int total=0;
		int item_num = Integer.parseInt(jsonObj.get("item_num").toString());
		ArrayList<OrderDto> Order_list = (ArrayList<OrderDto>)session.getAttribute("basket");
		
		if(jsonObj.get("item_count") == null){
		
		for(int i=0;i<Order_list.size();i++){
			if(Order_list.get(i).getItem_num() == item_num){
				Order_list.remove(i);
				break;
			}
		}
		}else {
			for(int i=0;i<Order_list.size();i++){
				if(Order_list.get(i).getItem_num() == item_num){
					Order_list.get(i).setItem_count(Integer.parseInt(jsonObj.get("item_count").toString()));;
					break;
				}
			}
		}
		for(int i=0; i<Order_list.size();i++){
			total += Order_list.get(i).getItem_price()*Order_list.get(i).getItem_count();
		}
		System.out.println("총금액 :"+total);
		session.setAttribute("basket", Order_list);
		return total;
	}

}
