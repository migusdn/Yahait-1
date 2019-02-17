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
	public ArrayList<ShopDto> Shop_show(Map map);

	public ShopDto name_duplication_check(String parameter);
	public void Shop_info_Update(Map map);
	public void Shop_delete(String shop_num);
	public ShopDto point(String shop_num);
	public ArrayList<ShopDto> Map_show(Map map);
}