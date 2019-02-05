package com.yahait.app.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.yahait.app.Dto.ShopDto;

@Controller
public class ShopController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/Order")
	public String Order(Model model) {
		return "Order";
	}

	@RequestMapping("/Sell")
	public String Sell(Model model, HttpSession session, HttpServletResponse response) throws IOException {
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
		return "Sell";
	}

	@RequestMapping("/Shop")
	public String Shop(Model model, HttpSession session, @RequestBody String paramData, ServletRequest request)
			throws IOException, ParseException {

		System.out.println("상점 컨트롤러 접속");
		// 클라이언트측에서 날라온 데이터확인
		System.out.println("클라이언트전송데이터(JSON):" + paramData);
		// JSON객체를 생성하여 키&벨류 값으로 쪼개기
		String shop_num = request.getParameter("shop_num");
		System.out.println(shop_num);
		SDao dao = sqlSession.getMapper(SDao.class);
		ArrayList<ShopDto> Shop_info = dao.Shop_info(shop_num);
		IDao idao = sqlSession.getMapper(IDao.class);
		ArrayList<ItemDto> item_list = idao.Item_list(shop_num);
		try {
		String member_num = Shop_info.get(0).getMember_num();
		String shop_name = Shop_info.get(0).getShop_name();
		String category_name1 = Shop_info.get(0).getCategory_name1();
		String category_name2 = Shop_info.get(0).getCategory_name2();
		String shop_info = Shop_info.get(0).getShop_info();
		int state = Shop_info.get(0).getState();
		Map map = new HashMap();
		System.out.println("상점 이름 :" + shop_name + " member_num :" + member_num);
		map.put("shop_name", shop_name);
		map.put("member_num", member_num);
		map.put("category_name1", category_name1);
		map.put("category_name2", category_name2);
		model.addAllAttributes(map);
		model.addAttribute("item_list", item_list);
		}catch (Exception e) {
			System.out.println("NULL");
		}
		return "Shop";
	}

	@RequestMapping("/SellAct")
	@ResponseBody
	public String SellAct(MultipartHttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws Exception {

		System.out.println("상점 등록 컨트롤러 접속");
		System.out.println("------------------------------");
		// 클라이언트측에서 날라온 데이터확인
		String logincheckstring = (String) session.getAttribute("iogincheck");
		if (logincheckstring == null) {
			System.out.println("로그인세션 없음");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근'); window.location.href = \"Login\";</script>");
			out.flush();
		} else {
			System.out.println("세션ID :" + logincheckstring);
		}

		// Multipart 요청이 들어올때 내부적으로 원본 HttptServletRequest 대신 사용되는 인터페이스.
		// MultipartHttpServletRequest 인터페이스는
		// HttpServletRequest 인터페이스와 MultipartRequest인터페이스를 상속받고있다.
		// 즉 웹 요청 정보를 구하기 위한 getParameter()와 같은 메서드와 Multipart관련 메서드를 모두 사용가능.

		// 일반 양식은 이전에 사용하던 방식과 같이 데이터를 가져올수있음

		// 파일
		MultipartFile mf = request.getFile("shop_pic");
		Map map = new HashMap();
		if (mf != null) {
			String name = mf.getName(); // 필드 이름 얻기
			String fileName = mf.getOriginalFilename(); // 파일명 얻기
			String contentType = mf.getContentType(); // 컨텐츠 타입 얻기
			
			// 업로드 파일명을 변경후 저장
			String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString()
					+ fileName.substring(fileName.lastIndexOf("."));
			String rootPath = request.getSession().getServletContext().getRealPath("/") ;
			Path p = Paths.get("C:\\Yahait\\src\\main\\webapp\\resources\\images");
			
			String uploadPath = rootPath + "resources/images/" ;
			// 지정한주소에 파일 저장
			if (mf.getSize() != 0) {
				mf.transferTo(new File(uploadPath + "/" + uploadedFileName));
			}
			// item 테이블에 들어갈 map객체 작성

			SDao dao1 = sqlSession.getMapper(SDao.class);
			ShopDto dto = dao1.Shop_admin(logincheckstring);
			System.out.println(dto.getMember_num());
			map.put("member_num", dto.getMember_num());
			map.put("shop_name", (String) request.getParameter("shop_name").trim());
			map.put("category_name1", (String) request.getParameter("category_name1").trim());
			map.put("category_name2", (String) request.getParameter("category_name2").trim());
			map.put("shop_info", (String) request.getParameter("shop_info").trim());
			map.put("shop_pic", uploadedFileName);
			map.put("gps_x", (String) request.getParameter("gps_x").trim());
			map.put("gps_y", (String) request.getParameter("gps_y").trim());
			SDao name_check = sqlSession.getMapper(SDao.class);
			ShopDto check = name_check.name_duplication_check((String) map.get("shop_name"));
			if (check != null) {
				System.out.println("중복된 상점명");
				return "NAME";
			} else {
				// 콘솔 출력
				System.out.println("입력 파일정보\n");
				System.out.println("파라미터이름:" + mf.getName());
				System.out.println("파일명:" + mf.getOriginalFilename());
				System.out.println("파일사이즈:" + mf.getSize());
				System.out.println("업로드 파일명: " + uploadedFileName);
				System.out.println("실제 파일 업로드 경로 : " + uploadPath);
				System.out.println("------------------------------");
				System.out.println("form이 전송한  데이터\n");
				System.out.println("상점 이름: " + map.get("shop_name"));
				System.out.println("상점 카테고리: " + map.get("category_name1"));
				System.out.println("상점 카테고리: " + map.get("category_name2"));
				System.out.println("상점 설명: " + map.get("shop_info"));
				System.out.println("상점 X 좌표: " + map.get("gps_x"));
				System.out.println("상점 Y 좌표: " + map.get("gps_y"));

			}
		}
		SDao dao = sqlSession.getMapper(SDao.class);
		dao.Shop_add(map);
		try {

		} catch (Exception e) {
			System.out.println("SQL 에러");
		}

		return "OK";
	}
	/*
	 * public String SellAct(Model model, HttpSession session, HttpServletResponse
	 * response, @RequestBody String paramData) throws IOException, ParseException {
	 * System.out.println("상품등록 컨트롤러 접속"); // 클라이언트측에서 날라온 데이터확인 String
	 * logincheckstring = (String) session.getAttribute("iogincheck"); if
	 * (logincheckstring == null) { System.out.println("로그인세션 없음");
	 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
	 * response.getWriter(); out.
	 * println("<script>alert('잘못된 접근'); window.location.href = \"Login\";</script>"
	 * ); out.flush(); } else { System.out.println("세션 존재"); }
	 * System.out.println("클라이언트전송데이터(JSON):" + paramData); // JSON객체를 생성하여 키&벨류 값으로
	 * 쪼개기 JSONParser parser = new JSONParser(); // –JSON Parser 생성 JSONObject
	 * jsonObj = (JSONObject) parser.parse(paramData); // – 넘어온 문자열을 JSON 객체로 변환 //
	 * JSON데이값을 스트링 객체로 저장 Map map = new HashMap(); SDao dao =
	 * sqlSession.getMapper(SDao.class); ShopDto dto =
	 * dao.Shop_admin(logincheckstring); map.put("member_num", dto.getMember_num());
	 * map.put("shop_name", jsonObj.get("title").toString()); map.put("category1",
	 * jsonObj.get("category1").toString()); map.put("category2",
	 * jsonObj.get("category2").toString()); // 클라이언트측에서 날라온 JSON데이터를 서버측에서 받은 데이터
	 * 확인 System.out.println("서버측 받은 데이터 "); System.out.println("TITLE:" +
	 * map.get("shop_name") + " CATEGORY:" + map.get("category1") + "CATEGORY:" +
	 * map.get("category2")); try { SDao dao1 = sqlSession.getMapper(SDao.class);
	 * dao1.Shop_add(map); } catch (Exception e) { return "ERROR"; } return "OK"; }
	 */

	@RequestMapping("/Product")
	public String Product(Model model) {
		return "Product";
	}

	@RequestMapping("/Manager")
	public String Manager(Model model, HttpSession session, HttpServletResponse response) throws IOException {
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
		SDao dao = sqlSession.getMapper(SDao.class);
		ShopDto dto = dao.Shop_admin(logincheckstring);
		String member_num = dto.getMember_num();
		SDao dao1 = sqlSession.getMapper(SDao.class);
		ArrayList<ShopDto> list = dao1.Shop_list(member_num);

		/*
		 * //최종 완성될 JSONObject 선언(전체) JSONObject ShopObject = new JSONObject();
		 * 
		 * //Shop의 JSON정보를 담을 Array 선언 JSONArray ShopArray = new JSONArray();
		 * 
		 * //person의 한명 정보가 들어갈 JSONObject 선언
		 * 
		 * 
		 * for(int i=0;i<list.size();i++) { JSONObject ShopInfo = new JSONObject();
		 * ShopInfo.put("shop_num", list.get(i).getShop_num());
		 * ShopInfo.put("shop_name",list.get(i).getShop_name());
		 * ShopInfo.put("shop_category_name1", list.get(i).getCategory_name1());
		 * ShopInfo.put("shop_category_name2", list.get(i).getCategory_name2());
		 * ShopInfo.put("state", list.get(i).getState()); ShopArray.add(ShopInfo); }
		 * String[] jsonlist= new String[ShopArray.size()]; for(int
		 * i=0;i<ShopArray.size();i++) { JSONObject info = (JSONObject)ShopArray.get(i);
		 * jsonlist[i]=info.toJSONString(); System.out.println("json 정보"+jsonlist[i]); }
		 */
		model.addAttribute("shop_data", list);
		return "Manager";
	}

	@RequestMapping("/Test")
	public String Test(Model model) {
		return "Test";
	}

	@RequestMapping("/StateUpdate")
	public String StateUpdate(Model model, HttpSession session, @RequestBody String paramData)
			throws IOException, ParseException {
		System.out.println("State_Update 컨트롤러 접속");
		// 클라이언트측에서 날라온 데이터확인
		System.out.println("클라이언트전송데이터(JSON):" + paramData);
		// JSON객체를 생성하여 키&벨류 값으로 쪼개기
		JSONParser parser = new JSONParser(); // –JSON Parser 생성
		JSONObject jsonObj = (JSONObject) parser.parse(paramData); // – 넘어온 문자열을 JSON 객체로 변환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shop_name", jsonObj.get("shop_name").toString().trim());
		map.put("state", jsonObj.get("shop_state").toString().trim());

		try {
			SDao dao = sqlSession.getMapper(SDao.class);
			dao.StateUpdate(map);
			System.out.println("상점 번호: " + map.get("shop_name") + "상태" + map.get("state"));
			System.out.println("UPDATE SUCCESS");
		} catch (Exception e) {
			System.out.println("SQL 에러");
		}
		return "EX";
	}

	@RequestMapping("/ShopinfoUpdate")
	public String ShopinfoUpdate(Model model, HttpServletRequest request) {
		String shop_num = (String) request.getParameter("shop_num");
		SDao dao = sqlSession.getMapper(SDao.class);
		ArrayList<ShopDto> shop_info = dao.Shop_info(shop_num);
		Map map = new HashMap();
		map.put("shop_num", shop_num);
		map.put("shop_name", shop_info.get(0).getShop_name());
		map.put("category_name1", shop_info.get(0).getCategory_name1());
		map.put("category_name2", shop_info.get(0).getCategory_name2());
		map.put("shop_info", shop_info.get(0).getShop_info());
		map.put("shop_pic", shop_info.get(0).getShop_pic());
		model.addAllAttributes(map);

		return "ShopinfoUpdate";
	}

	@RequestMapping("/ShopinfoUpdateAct")
	public String ShopinfoUpdateAct(MultipartHttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {

		System.out.println("상점 정보 수정 컨트롤러 접속");
		System.out.println("------------------------------");
		// 클라이언트측에서 날라온 데이터확인
		String logincheckstring = (String) session.getAttribute("iogincheck");
		if (logincheckstring == null) {
			System.out.println("로그인세션 없음");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근'); window.location.href = \"Login\";</script>");
			out.flush();
		} else {
			System.out.println("세션ID :" + logincheckstring);
		}

		// Multipart 요청이 들어올때 내부적으로 원본 HttptServletRequest 대신 사용되는 인터페이스.
		// MultipartHttpServletRequest 인터페이스는
		// HttpServletRequest 인터페이스와 MultipartRequest인터페이스를 상속받고있다.
		// 즉 웹 요청 정보를 구하기 위한 getParameter()와 같은 메서드와 Multipart관련 메서드를 모두 사용가능.

		// 일반 양식은 이전에 사용하던 방식과 같이 데이터를 가져올수있음

		// 파일
		MultipartFile mf = request.getFile("shop_pic");
		Map map = new HashMap();
		if (mf != null) {
			String name = mf.getName(); // 필드 이름 얻기
			String fileName = mf.getOriginalFilename(); // 파일명 얻기
			String contentType = mf.getContentType(); // 컨텐츠 타입 얻기

			// 업로드 파일명을 변경후 저장
			String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString()
					+ fileName.substring(fileName.lastIndexOf("."));
			String rootPath = request.getSession().getServletContext().getRealPath("/") ;
			Path p = Paths.get("C:\\Yahait\\src\\main\\webapp\\resources\\images");
			
			String uploadPath = rootPath + "resources/images/" ;
			// 지정한주소에 파일 저장
			if (mf.getSize() != 0) {
				mf.transferTo(new File(uploadPath + "/" + uploadedFileName));
			}
			// item 테이블에 들어갈 map객체 작성
			map.put("shop_num", (String) request.getParameter("shop_num").trim());
			map.put("shop_name", (String) request.getParameter("shop_name").trim());
			map.put("category_name1", (String) request.getParameter("category_name1").trim());
			map.put("category_name2", (String) request.getParameter("category_name2").trim());
			map.put("shop_info", (String) request.getParameter("shop_info").trim());
			map.put("shop_pic", uploadedFileName);

			// 콘솔 출력
			System.out.println("입력 파일정보\n");
			System.out.println("파라미터이름:" + mf.getName());
			System.out.println("파일명:" + mf.getOriginalFilename());
			System.out.println("파일사이즈:" + mf.getSize());
			System.out.println("업로드 파일명: " + uploadedFileName);
			System.out.println("실제 파일 업로드 경로 : " + uploadPath);
			System.out.println("------------------------------");
			System.out.println("form이 전송한  데이터\n");
			System.out.println("상점 이름: " + map.get("shop_name"));
			System.out.println("상점 카테고리: " + map.get("category_name1"));
			System.out.println("상점 카테고리: " + map.get("category_name2"));
			System.out.println("상점 설명: " + map.get("shop_info"));

		}

		try {
			SDao dao = sqlSession.getMapper(SDao.class);
			dao.Shop_info_Update(map);
		} catch (Exception e) {
			System.out.println("SQL 에러");
		}

		return "OK";
	}
}
