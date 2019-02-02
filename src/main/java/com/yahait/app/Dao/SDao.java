package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import com.yahait.app.Dto.ItemDto;
import com.yahait.app.Dto.ShopDto;

public interface SDao {
	public ArrayList<ShopDto> Shop_info(String shop);

	public void Shop_add(Map map);
	public ShopDto Shop_admin(String member_id);
	public ArrayList<ShopDto> Shop_list(String member_id);
	public void StateUpdate(Map map);
	public ArrayList<ShopDto> Shop_show();
	
}
