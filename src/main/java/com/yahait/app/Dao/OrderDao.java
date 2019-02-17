package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.yahait.app.Dto.OrderDto;


public class OrderDao implements ODao {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public void ordered_add(OrderDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void ordered_detail_add(OrderDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<OrderDto> ordered_show(String member_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<OrderDto> ordered_detail_show(String ordered_num) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	
	

}