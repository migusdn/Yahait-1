package com.yahait.app.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.yahait.app.Dao.MDao;
import com.yahait.app.Dao.MemberDao;
import com.yahait.app.Dao.SDao;
import com.yahait.app.Dto.MemberDto;
import com.yahait.app.Dto.ShopDto;

@Controller
public class YahaitController {

	MemberDao memberdao;

	@Autowired
	private SqlSession sqlSession;

	// app/Login 으로 접속시 처리할 로직
	@RequestMapping("/Login")
	public String Login(Model model) {
/*
		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MemberDto> loigndate = dao.loigndate();
		// dao 인터페이스에 정의된 logindate SQL문을 불러와 리스트에 결과값을 담음
		System.out.println(loigndate.get(0));
		String Name = loigndate.get(0).getName();
		String password = loigndate.get(0).getPassword();
		String id = loigndate.get(0).getId();

		System.out.println("데이터베이스 회원정보 데이터값 이름:" + Name + " 패스워드:" + password + " ID:" + id);

		// Login.jsp을 불러옴
		*/
		return "Login";
		

	}
	
	@RequestMapping("/LoginAct")
	public String LoginAct(HttpServletRequest request, HttpServletResponse response,  HttpSession session) throws IOException {
       
		// request.getParameter 파라미터로 직접값을 받아오는 형태
		String userid = request.getParameter("id").toString();
		String userpassword = request.getParameter("password").toString();

		System.out.println("view에서받아온ID" + userid + "====" + "view에서받아온PW" + userpassword);

		// SQL문 불러오기
		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MemberDto> logincehck = dao.logincehck(userid);
		// 경고창 response 객체를 이용하여 PrintWriter 하여 쏴주기
		if (logincehck.isEmpty()) {
			System.out.println("아이디가 없습니다");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('ID정보를 를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		}

		else {

			System.out.println("입력결과 DB에 아이디존재");
			
			
			// DB에 아이디가 존재하면 로그인 SQL문 실행(userid값을 넣어서 아이디값 확인)
			MemberDto passwordcheck = logincehck.get(0);
			System.out.println("로그인입력 패스워드:" + userpassword);
			System.out.println("DB저장된 패스워드:" + passwordcheck.getMember_password().trim());
			// 클라이언트 입력값과 데이터베이스에 입력값 일치확인
			if (passwordcheck.getMember_password().trim().equals(userpassword)) {
				System.out.println("완벽한로그인");
				
				session.setAttribute("iogincheck", userid);
	    		String iogincheckstring = (String)session.getAttribute("iogincheck");
	            System.out.println("로그인 전달 세션확인-----:"+iogincheckstring);
			
	            
				return "redirect:/Main";
			} else {
				System.out.println("패스워드가 맞지 않습니다.");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
				out.flush();
			}

		}
		// 아직 메인창이 완료안되어 그대로 두기
		return "Login";
	}
	
	//로그인아웃 맵핑
	@RequestMapping("/loginout")
	public String Signup(Model model, HttpSession session) {
		
        System.out.println("메인창세션값확인-----:"+(String)session.getAttribute("iogincheck"));
        session.invalidate();
		return "redirect:/Login";
	}
	
	// 회원가입창 이동
	@RequestMapping("/Signup")
	public String Signup(Model model) {
		return "Signup";
	}
		


	@RequestMapping("/SignupCheck")
	@ResponseBody
	public String SignupCheck(Model model, HttpSession session, @RequestBody String paramData)
			throws IOException, ParseException {

		System.out.println("회원가입 컨트롤러 접속");
		// 클라이언트측에서 날라온 데이터확인
		System.out.println("클라이언트전송데이터(JSON):" + paramData);
		// JSON객체를 생성하여 키&벨류 값으로 쪼개기
		JSONParser parser = new JSONParser(); // –JSON Parser 생성
		JSONObject jsonObj = (JSONObject) parser.parse(paramData); // – 넘어온 문자열을 JSON 객체로 변환
		// JSON데이값을 스트링 객체로 저장
		
		//Birth 데이터 년 월 일로 쪼개기
		String Birthdata = null;
		Birthdata = jsonObj.get("birthDate").toString();
		String Year=null;
		String Month = null;
		String Day = null;
		SimpleDateFormat Y = new SimpleDateFormat("yyyy");
		SimpleDateFormat M = new SimpleDateFormat("MM");
		SimpleDateFormat D = new SimpleDateFormat("dd");
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(Birthdata);
			Year=Y.format(date);
			Month=M.format(date);
			Day=D.format(date);
		} catch (java.text.ParseException e1) {
			return "BirthError";
		}
		//ID 중복확인
		MDao dao = sqlSession.getMapper(MDao.class);
		MemberDto duplication_check = dao.id_duplication_check(jsonObj.get("id").toString());
		if(duplication_check!=null)
			return "duplicated_id";
		
		// @를 기준으로 문자열을 추출할 것이다.
        String mail = jsonObj.get("mail").toString();
        
        // 먼저 @ 의 인덱스를 찾는다 - 인덱스 값: 5
        int idx = mail.indexOf("@"); 
        
        // @ 앞부분을 추출
        // substring은 첫번째 지정한 인덱스는 포함하지 않는다.
        // 아래의 경우는 첫번째 문자열인 a 부터 추출된다.
        String mail1 = mail.substring(0, idx);
        
        // 뒷부분을 추출
        // 아래 substring은 @ 바로 뒷부분인 n부터 추출된다.
        String mail2 = mail.substring(idx+1);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", jsonObj.get("id").toString());
		map.put("password", jsonObj.get("pass").toString());
		map.put("name", jsonObj.get("name").toString());
		if(jsonObj.get("gender").toString().equals("Woman"))
			map.put("gender", "1");
		else
			map.put("gender", "0");
		map.put("mail1", mail1);
		map.put("mail2", mail2);
		map.put("phone1", jsonObj.get("cellPhone").toString());
		map.put("birth_y", Year);
		map.put("birth_m", Month);
		map.put("birth_d", Day);
		
		// 클라이언트측에서 날라온 JSON데이터를 서버측에서 받은 데이터 확인
		System.out.println("서버측 받은 데이터 ");
		System.out.println("ID:" + map.get("id") + " PW:" + map.get("password") + " NAME:" + map.get("name") + " MAIL:" + map.get("mail1")+map.get("mail2")
				+ " PHONE:" + map.get("phone1") + " GENDER:" + map.get("gender") + " birthDate:"+Year+Month+Day );
			MDao dao1 = sqlSession.getMapper(MDao.class);
			dao1.signup(map);
	
		
		return "OK";
	}

	@RequestMapping("/Main")
	public String Main(Model model, HttpSession session) {
		String iogincheckstring = (String)session.getAttribute("iogincheck");
        System.out.println("로그인 전달 세션확인-----:"+iogincheckstring);
		return "Main";
	}

	
	@RequestMapping(value="Mainfetch" ,produces="text/plain;charset=UTF-8")
	public @ResponseBody String Mainfetch(Model model,  HttpSession session, @RequestBody String paramData	) throws ParseException{

		System.out.println("메인 페치창 접속");
		SDao dao = sqlSession.getMapper(SDao.class);
		ArrayList<ShopDto> shoplist = dao.Shop_show();
		System.out.println("sql문 사이즈"+shoplist.size());
		
	    //최종 완성될 JSONObject 선언(전체)
        JSONObject jsonObject = new JSONObject();
        //person의 JSON정보를 담을 Array 선언
        JSONArray shopArray = new JSONArray();
        //shop의 한명 정보가 들어갈 JSONObject 선언
        
        
		for(int i=0; i<shoplist.size(); i++){
		JSONObject shopInfo = new JSONObject();
		String shopname = shoplist.get(i).getShop_name();
		String shoppic = shoplist.get(i).getShop_pic();
		System.out.println("상점아이디("+i+"):" +shopname+"상점이미지경로("+i+"):"  +shoppic);
		
		shopInfo.put("shopname",shopname);
		shopInfo.put("shoppic",shoppic);
		shopArray.add(shopInfo);
		jsonObject.put("shop", shopArray);
		}
		
		String jsonInfo = jsonObject.toJSONString();
		System.out.println(jsonInfo);
		
		
		return jsonInfo;

	    }
	
	@RequestMapping("/sessioncheck")
	public @ResponseBody String sessioncheck(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		String logincheckstring = (String) session.getAttribute("iogincheck");
		System.out.println("메인세션체크창-----:"+logincheckstring);
		if (logincheckstring == null) {
			return "NO";
		} else {
			return "OK";
		}
	}
	
	
	@RequestMapping("/FindID")
	public String FindID(Model model) {
		return "FindID";
	}

	@RequestMapping("/FindIDAct")
	public String FindID(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name").toString();
		String mail = request.getParameter("mail").toString();
		System.out.println("서버에 들어온 값 name:" + name + " mail:" + mail);
		// @를 기준으로 문자열을 추출할 것이다.
       
        
		if(mail==null || mail==""){
			System.out.println("이메일을 입력하세요!");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이메일을 입력하세요!'); history.go(-1);</script>");
			out.flush();
			
		}else{
        // 먼저 @ 의 인덱스를 찾는다 - 인덱스 값: 5
        int idx = mail.indexOf("@"); 
        
        // @ 앞부분을 추출
        // substring은 첫번째 지정한 인덱스는 포함하지 않는다.
        // 아래의 경우는 첫번째 문자열인 a 부터 추출된다.
        String mail1 = mail.substring(0, idx);
        
        // 뒷부분을 추출
        // 아래 substring은 @ 바로 뒷부분인 n부터 추출된다.
        String mail2 = mail.substring(idx+1);
		Map map = new HashMap();
		map.put("name", name);
		map.put("mail1", mail1);
		map.put("mail2", mail2);
		
		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MemberDto> findid = dao.findID(map);
		
		if (findid.isEmpty()) {
			System.out.println("아이디가 존재하지 않습니다");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디가 존재하지 않습니다'); history.go(-1);</script>");
			out.flush();
		} else {
			String finidactid = findid.get(0).getMember_id();
			System.out.println("찾은아이디" + finidactid);
			model.addAttribute("usermail", mail);
			model.addAttribute("username", name);
			model.addAttribute("finidactid", finidactid);
			return "FindID2";
		}
		}
		return "FindID2";
	}

	@RequestMapping("/FindID2")
	public String FindID2(Model model) {
		return "FindID2";
	}

	@RequestMapping("/FindPW")
	public String FindPW(Model model) {
		return "FindPW";
	}

	@RequestMapping("/FindPWAct")
	public String FindPWAct(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name").toString();
		String id = request.getParameter("id").toString();
		String phone = request.getParameter("phone");
		System.out.println("서버에 들어온 값 id:" + id + "name:" + name + " phone:" + phone);

		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("id", id);
		map.put("phone1", phone);

		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MemberDto> findpw = dao.findPW(map);

		if (findpw.isEmpty()) {
			System.out.println("입력하신 정보에 일치하는 계정이 없습니다.");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 정보에 일치하는 계정이 없습니다.'); history.go(-1);</script>");
			out.flush();
		} else {
			String finidactpw = findpw.get(0).getMember_password();
			System.out.println("찾은비밀번호" + finidactpw);
			model.addAttribute("userpassword", finidactpw);
			return "FindPW2";
		}
		return "FindPW2";
	}

	@RequestMapping("/Sinup")
	public String Sinup(Model model) {
		return "Sinup";
	}

	
	@RequestMapping("MemberinfoUpdata")
	public String MemberinfoUpdata(Model model, HttpSession session) {
		String logincheckstring = (String) session.getAttribute("iogincheck");
		System.out.println("세션체크창-----:"+logincheckstring);
		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MemberDto> memberinfo = dao.member_mail_info(logincheckstring);
		String mail1 = memberinfo.get(0).getMail1();
		String mail2 = memberinfo.get(0).getMail2();
		
		String mailinfo = mail1+"@"+mail2;
		model.addAttribute("mailinfo", mailinfo);
		return "MemberinfoUpdata";
	}
	
	@RequestMapping("MemberinfoUpdataAct")
	public String MemberinfoUpdataAct(Model model) {
		return "MemberinfoUpdataAct";
	}
	
}
