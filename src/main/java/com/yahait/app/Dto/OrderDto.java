package com.yahait.app.Dto;

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
	
	
	public String getOrdered_time() {
		return ordered_time;
	}
	public void setOrdered_time(String ordered_time) {
		this.ordered_time = ordered_time;
	}
	public String getOrdered_state() {
		return ordered_state;
	}
	public void setOrdered_state(String ordered_state) {
		this.ordered_state = ordered_state;
	}
	public OrderDto(){
		
	}
	public OrderDto(int shop_num, int item_price, String item_name, int item_count,int item_num){
		this.shop_num = shop_num;
		this.item_price = item_price;
		this.item_name=item_name;		
		this.item_count = item_count;
		this.item_num = item_num;
	}
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getShop_num() {
		return shop_num;
	}
	public void setShop_num(int shop_num) {
		this.shop_num = shop_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public int getOrdered_num() {
		return ordered_num;
	}
	public void setOrdered_num(int ordered_num) {
		this.ordered_num = ordered_num;
	}
}
