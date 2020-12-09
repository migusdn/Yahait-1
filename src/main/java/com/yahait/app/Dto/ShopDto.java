package com.yahait.app.Dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ShopDto {
	private String shop_num;
	private String member_num;
	private String shop_name;
	private String category_name1;
	private String category_name2;
	private int state;
	private String shop_pic;
	private String shop_info;
	private String gps_x;
	private String gps_y;
	private String dist;
}