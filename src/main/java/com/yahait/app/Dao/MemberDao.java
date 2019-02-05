package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.yahait.app.Dto.MemberDto;

public class MemberDao implements MDao {

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

	@Override
	public ArrayList<MemberDto> shop_show() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MemberDto> member_num_info(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MemberDto> Show_member_info(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void member_info_Update(Map map) {
		// TODO Auto-generated method stub
		
	}

	
	
	

}
