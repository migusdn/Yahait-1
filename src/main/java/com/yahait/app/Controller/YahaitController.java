package com.yahait.app.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yahait.app.Dao.IDao;
import com.yahait.app.Dao.MemberDao;
import com.yahait.app.Dto.MemberDto;


@Controller
public class YahaitController {

	MemberDao memberdao;
	
	@Autowired
	private SqlSession sqlSession;


	// app/Login 으로 접속시 처리할 로직
	@RequestMapping("/Login")
	public String Login(Model model){
		
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<MemberDto> loigndate = dao.loigndate();
		//dao 인터페이스에 정의된 logindate SQL문을 불러와 리스트에 결과값을 담음
		System.out.println(loigndate.get(0));
		String Name = loigndate.get(0).getName();
		String password = loigndate.get(0).getPassword();
		String id = loigndate.get(0).getId();
		
		System.out.println("데이터베이스 회원정보 데이터값 이름:"+Name+" 패스워드:"+password+" ID:"+id);
		
		// Login.jsp을 불러옴
		return "Login";
		
	}
	
	@RequestMapping("/LoginAct")
	public String LoginAct(HttpServletRequest request , HttpServletResponse response) throws IOException {
	
		//request.getParameter 파라미터로 직접값을 받아오는 형태
		String userid = request.getParameter("id").toString();
		String userpassword = request.getParameter("password").toString();
		
		System.out.println("view에서받아온ID"+userid+"===="+"view에서받아온PW"+userpassword);
		
		//SQL문 불러오기
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<MemberDto> logincehck = dao.logincehck(userid);
		
		//경고창 response 객체를 이용하여 PrintWriter 하여 쏴주기
		if(logincehck.isEmpty()) {
		System.out.println("아이디가 없습니다");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('ID정보를 를 확인해주세요.'); history.go(-1);</script>");
        out.flush();
        
		}
		
		else{
		
		System.out.println("입력결과 DB에 아이디존재");
		System.out.println("입력결과 DB에 아이디존재");
		//DB에 아이디가 존재하면 로그인 SQL문 실행(userid값을 넣어서 아이디값 확인)
        MemberDto passwordcheck = dao.logincehck(userid).get(0);
        
        System.out.println("로그인입력 패스워드:"+userpassword);
        System.out.println("DB저장된 패스워드:"+passwordcheck.getPassword().trim());
        //클라이언트 입력값과 데이터베이스에 입력값 일치확인
        if(passwordcheck.getPassword().trim().equals(userpassword)){
        	System.out.println("완벽한로그인");
        	return "Login";
        }else{
        	System.out.println("패스워드가 맞지 않습니다.");
    		response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
        }
        
		}
		//아직 메인창이 완료안되어 그대로 두기
		return "Login";
	}
	
	//회원가입창 이동
	@RequestMapping("/Signup")
	public String Signup(Model model){
		return "Signup";
	}
	
	@RequestMapping("/SignupCheck")
	public String SignupCheck(Model model,HttpSession session, @RequestBody String paramData) throws IOException, ParseException{
		
		System.out.println("회원가입 컨트롤러 접속");
		//클라이언트측에서 날라온 데이터확인
	    System.out.println("클라이언트전송데이터(JSON):"+paramData);
	    //JSON객체를 생성하여 키&벨류 값으로 쪼개기
	    JSONParser parser = new JSONParser(); //–JSON Parser 생성
	    JSONObject jsonObj = (JSONObject)parser.parse(paramData); //– 넘어온 문자열을 JSON 객체로 변환
		//JSON데이값을 스트링 객체로 저장
		String Signupid = jsonObj.get("id").toString();
		String Signuppassword = jsonObj.get("pass").toString();
		String Signupphone = jsonObj.get("cellPhone").toString();
		String Signupname = jsonObj.get("name").toString();
		String Signupmail = jsonObj.get("mail").toString();
		String Signupgender = jsonObj.get("gender").toString();
		//클라이언트측에서 날라온 JSON데이터를 서버측에서 받은 데이터 확인
		System.out.println("서버측 받은 데이터 ");
		System.out.println("ID:"+Signupid+"PW:"+Signuppassword+"NAME:"+Signupname+"MAIL:"+Signupmail+
				"PHONE:"+Signupphone+"GENDER:"+Signupgender);
		
		return "EX";
	}
	
	@RequestMapping("/Main")
	public String Main(Model model){
		return "Main";
	}

	@RequestMapping("/FindID")
	public String FindID(Model model){
		return "FindID";
	}
	
	@RequestMapping("/FindID2")
	public String FindID2(Model model){
		return "FindID2";
	}
	
	@RequestMapping("/Order")
	public String Order(Model model){
		return "Order";
	}
	
	@RequestMapping("/Sell")
	public String Sell(Model model){
		return "Sell";
	}
	
	@RequestMapping("/Shop")
	public String Shop(Model model){
		return "Shop";
	}

	
	@RequestMapping("/FindPW")
	public String FindPW(Model model){
		return "FindPW";
	}
	
	@RequestMapping("/Sinup")
	public String Sinup(Model model){
		return "Sinup";
	}
	
	@RequestMapping("/SellAct")
	public String SellAct(Model model){
		return "SellAct";
	}
	
}
