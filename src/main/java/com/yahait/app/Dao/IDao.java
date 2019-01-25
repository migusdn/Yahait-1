package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import com.yahait.app.Dto.MemberDto;


public interface IDao {

	public ArrayList<MemberDto> loigndate();
	public ArrayList<MemberDto> logincehck(String id);
	public ArrayList<MemberDto> findID(Map map);
} 
