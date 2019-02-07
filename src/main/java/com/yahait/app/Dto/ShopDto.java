package com.yahait.app.Dto;

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
	
	public String getGps_x() {
		return gps_x;
	}

	public void setGps_x(String gps_x) {
		this.gps_x = gps_x;
	}

	public String getGps_y() {
		return gps_y;
	}

	public void setGps_y(String gps_y) {
		this.gps_y = gps_y;
	}

	public String getShop_info() {
		return shop_info;
	}

	public void setShop_info(String shop_info) {
		this.shop_info = shop_info;
	}

	public String getShop_pic() {
		return shop_pic;
	}

	public void setShop_pic(String shop_pic) {
		this.shop_pic = shop_pic;
	}

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