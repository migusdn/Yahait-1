package com.yahait.app.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class OrderDto {
	private int ordered_num;
	private int member_num;
	private int shop_num;
	private int item_num;
	private String item_name;
	private int item_price;
	private int item_count;
	private String ordered_time;
	private String ordered_state;
}
