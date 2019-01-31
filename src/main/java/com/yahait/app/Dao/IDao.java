package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import com.yahait.app.Dto.MemberDto;


public interface IDao {

	public ArrayList<MemberDto> loigndate();
	public ArrayList<MemberDto> logincehck(String id);
	public ArrayList<MemberDto> findID(Map map);
	public ArrayList<MemberDto> findPW(Map map);
	public void signup(Map map);
	public MemberDto id_duplication_check(String id);
} 
