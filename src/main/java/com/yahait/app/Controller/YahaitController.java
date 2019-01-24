package com.yahait.app.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
		String userid = request.getParameter("id").toString();
		String userpassword = request.getParameter("password").toString();
		
		System.out.println(userid+"===="+userpassword);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<MemberDto> logincehck = dao.logincehck(userid);
		
		if(logincehck.isEmpty()) {
		System.out.println("Noid");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('ID정보를 를 확인해주세요.'); history.go(-1);</script>");
        out.flush();
        
		}
		
		else{
		System.out.println("입력결과 DB에 아이디존재");
		System.out.println("입력결과 DB에 아이디존재");
        MemberDto passwordcheck = dao.logincehck(userid).get(0);
        
        System.out.println("로그인입력 패스워드:"+userpassword);
        System.out.println("DB저장된 패스워드:"+passwordcheck.getPassword().trim());

        if(passwordcheck.getPassword().trim().equals(userpassword)){
        	System.out.println("완벽한로그인");
        	return "Login";
        }else{
        	System.out.println("nopassword");
    		response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
        }
        
		}
		
		return "Login";
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
	
	@RequestMapping("/Signup")
	public String Signup(Model model){
		return "Signup";
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
