package com.yahait.app.Dto;

public class ShopDto {
	private String shop_num;
	private String member_num;
	private String shop_name;
	private String category_name1;
	private String category_name2;
	private int state;
	
	public ShopDto() {
		
	}
	
	public ShopDto(String member_num){
		this.member_num=member_num;
	}
	public String getShop_num() {
		return shop_num;
	}
	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}
	public String getMember_num() {
		return member_num;
	}
	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getCategory_name1() {
		return category_name1;
	}
	public void setCategory_name1(String category_name1) {
		this.category_name1 = category_name1;
	}
	public String getCategory_name2() {
		return category_name2;
	}
	public void setCategory_name2(String category_name2) {
		this.category_name2 = category_name2;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
