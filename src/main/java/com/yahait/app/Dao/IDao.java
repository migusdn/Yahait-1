package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import com.yahait.app.Dto.ItemDto;
import com.yahait.app.Dto.MemberDto;


public interface IDao {

	public ArrayList<ItemDto> Item_list(String shop_num);

	public void StateUpdate(Map map);
	
	public void Item_add(Map map);
	
	public ItemDto item_duplication_check(Map map);
} 
