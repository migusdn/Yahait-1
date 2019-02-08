package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.yahait.app.Dto.ItemDto;
import com.yahait.app.Dto.ShopDto;

public class ShopDao implements SDao {



	JdbcTemplate template;

	@Override
	public ArrayList<ShopDto> Shop_info(String shop) {

		return null;
	}

	@Override
	public ArrayList<ShopDto> Shop_show() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void Shop_add(Map map) {
		// TODO Auto-generated method stub
		return;
	}

	@Override
	public ShopDto Shop_admin(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ShopDto> Shop_list(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void StateUpdate(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ShopDto name_duplication_check(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void Shop_info_Update(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Shop_delete(String shop_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ShopDto point(String shop_num) {
		// TODO Auto-generated method stub
		return null;
	}

}