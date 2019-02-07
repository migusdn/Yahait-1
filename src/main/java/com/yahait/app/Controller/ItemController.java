package com.yahait.app.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
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

import com.yahait.app.Dto.ItemDto;
import com.yahait.app.Dao.IDao;
import com.yahait.app.Dao.SDao;

@Controller
public class ItemController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/Item_add")
	public String Item_add(Model model, @RequestBody String paramData, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException, ParseException {
		String shop_num = (String) request.getParameter("shop_num");

		String logincheckstring = (String) session.getAttribute("iogincheck");
		if (logincheckstring == null) {
			System.out.println("로그인세션 없음");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근'); window.location.href = \"Login\";</script>");
			out.flush();
		} else {
			System.out.println("Login Session : " + logincheckstring);
		}
		if (shop_num == null) {
			System.out.println("shop_num이 파라미터에 없습니다");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근'); window.location.href = \"Login\";</script>");
			out.flush();
		} else {
			System.out.println("Shop_num : " + shop_num);
		}

		return "Item_add";
	}

	@RequestMapping("/Item")
	public String Item(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String shop_num = (String) request.getParameter("shop_num");
		String logincheckstring = (String) session.getAttribute("iogincheck");
		if (logincheckstring == null) {
			System.out.println("로그인세션 없음");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 먼저 진행해주세요'); window.location.href = \"Login\";</script>");
			out.flush();
		} else {
			System.out.println("Login Session : " + logincheckstring);
		}
		if (shop_num == null) {
			System.out.println("shop_num이 파라미터에 없습니다");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근'); window.location.href = \"Login\";</script>");
			out.flush();
		} else {
			System.out.println("Shop_num : " + shop_num);
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<ItemDto> Item_list = dao.Item_list(shop_num);
		model.addAttribute("Item_list", Item_list);
		return "Item";
	}

	@RequestMapping("/ItemStateUpdate")
	public String ItemStateUpdate(Model model, HttpSession session, @RequestBody String paramData)
			throws IOException, ParseException {
		System.out.println("ItemState_Update 컨트롤러 접속");
		// 클라이언트측에서 날라온 데이터확인
		System.out.println("클라이언트전송데이터(JSON):" + paramData);
		// JSON객체를 생성하여 키&벨류 값으로 쪼개기
		JSONParser parser = new JSONParser(); // –JSON Parser 생성
		JSONObject jsonObj = (JSONObject) parser.parse(paramData); // – 넘어온 문자열을 JSON 객체로 변환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item_num", jsonObj.get("Item_num").toString().trim());
		map.put("state", jsonObj.get("Item_state").toString().trim());
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.StateUpdate(map);
		try {
			
			System.out.println("상품 번호: " + map.get("item_num") + "상태" + map.get("state"));
			System.out.println("UPDATE SUCCESS");
		} catch (Exception e) {
			System.out.println("SQL 에러");
		}
		return "EX";
	}
	@RequestMapping(value = "Item_addAct", produces = "application/json")
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest request) throws Exception {

		// Multipart 요청이 들어올때 내부적으로 원본 HttptServletRequest 대신 사용되는 인터페이스.
		// MultipartHttpServletRequest 인터페이스는
		// HttpServletRequest 인터페이스와 MultipartRequest인터페이스를 상속받고있다.
		// 즉 웹 요청 정보를 구하기 위한 getParameter()와 같은 메서드와 Multipart관련 메서드를 모두 사용가능.

		// 일반 양식은 이전에 사용하던 방식과 같이 데이터를 가져올수있음
		
		System.out.println("상품 추가 컨트롤러 접속");
		System.out.println("------------------------------");
		
		
		// 파일
		MultipartFile mf = request.getFile("file");
		Map map = new HashMap();
		if (mf != null) {
			String name = mf.getName(); // 필드 이름 얻기
			String fileName = mf.getOriginalFilename(); // 파일명 얻기
			String contentType = mf.getContentType(); // 컨텐츠 타입 얻기

			// 업로드 파일명을 변경후 저장
			String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString()
					+ fileName.substring(fileName.lastIndexOf("."));
			Path p = Paths.get("C:\\Yahait\\src\\main\\webapp\\resources\\images");
			String uploadPath = p.toString();
			
			
			// 지정한주소에 파일 저장
			if (mf.getSize() != 0) {
				mf.transferTo(new File(uploadPath + "/" + uploadedFileName));
			}
			// item 테이블에 들어갈 map객체 작성
			
			map.put("shop_num", (String) request.getParameter("shop_num").trim());
			map.put("item_name", (String) request.getParameter("item_name").trim());
			map.put("item_price", (String) request.getParameter("item_price").trim());
			map.put("item_contents", (String) request.getParameter("item_contents").trim());
			map.put("item_pic",uploadedFileName);
			IDao item_check = sqlSession.getMapper(IDao.class);
			ItemDto check = item_check.item_duplication_check(map);
			if(check != null) {
				System.out.println("중복된 상품명");
				return "NAME";
				}
			else {
			//콘솔 출력
			System.out.println("입력 파일정보\n");
			System.out.println("파라미터이름:" + mf.getName());
			System.out.println("파일명:" + mf.getOriginalFilename());
			System.out.println("파일사이즈:" + mf.getSize());
			System.out.println("업로드 파일명: "+uploadedFileName);
			System.out.println("실제 파일 업로드 경로 : " + uploadPath);
			System.out.println("------------------------------");
			System.out.println("상품 입력 데이터\n");
			System.out.println("상점 번호: "+map.get("shop_num"));
			System.out.println("상품 이름: "+map.get("item_name"));
			System.out.println("상품 가격: "+map.get("item_price"));
			System.out.println("상품 설명: "+map.get("item_contents"));
		
			}
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.Item_add(map);
		try {
			
		}catch(Exception e) {
			System.out.println("SQL 에러");
		}


		return "OK";
	}
	
	@RequestMapping("/item_delete")
	@ResponseBody
	public String Shop_delete(@RequestBody String paramData) throws ParseException{
		System.out.println("상품 삭제 컨트롤러 접속");
		System.out.println("----------------------");
		// 클라이언트측에서 날라온 데이터확인
		System.out.println("클라이언트전송데이터(JSON):" + paramData);
		JSONParser parser = new JSONParser(); // –JSON Parser 생성
		JSONObject jsonObj = (JSONObject) parser.parse(paramData); // – 넘어온 문자열을 JSON 객체로 변환
		String item_num = jsonObj.get("item_num").toString().trim();
		System.out.println("Delete_target_num: "+item_num);
		try {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.item_delete(item_num);
		}catch(Exception e) {
			System.out.println("삭제에 실패하였습니다");
			return "fail";
			
		}
		return "OK";
	}
}