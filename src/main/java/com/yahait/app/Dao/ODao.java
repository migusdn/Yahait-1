package com.yahait.app.Dao;

import java.util.ArrayList;
import java.util.Map;
import com.yahait.app.Dto.OrderDto;


public interface ODao {
	public void ordered_add(OrderDto dto);
	public void ordered_detail_add(OrderDto dto);
	public ArrayList<OrderDto> ordered_show(String member_num);

	public ArrayList<OrderDto> ordered_detail_show(String ordered_num);
} 