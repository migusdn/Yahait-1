package com.yahait.app.Dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ItemDto {
	private String shop_num;
	private String item_num;
	private String item_name;
	private String item_contents;
	private String item_price;
	private String item_pic;
	private int item_state;
}