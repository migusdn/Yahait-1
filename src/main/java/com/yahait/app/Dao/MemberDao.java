package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.yahait.app.Dto.MemberDto;

public class MemberDao implements IDao {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public ArrayList<MemberDto> loigndate() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<MemberDto> logincehck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MemberDto> findID(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MemberDto> findPW(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signup(Map map) {
		// TODO Auto-generated method stub
		return;
	}

	@Override
	public MemberDto id_duplication_check(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	
	

}
