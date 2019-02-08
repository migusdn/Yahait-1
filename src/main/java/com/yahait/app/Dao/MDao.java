package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import com.yahait.app.Dto.MemberDto;


public interface MDao {

	public ArrayList<MemberDto> loigndate();
	public ArrayList<MemberDto> logincehck(String member_id);
	public ArrayList<MemberDto> findID(Map map);
	public ArrayList<MemberDto> findPW(Map map);
	public void signup(Map map);
	public MemberDto id_duplication_check(String member_id);
	public ArrayList<MemberDto> shop_show();
	public ArrayList<MemberDto> member_num_info(String member_id);
	public ArrayList<MemberDto> Show_member_info(String member_id);
	public void member_info_Update(Map map);
	public String Sns_Login(Map map); 
} 