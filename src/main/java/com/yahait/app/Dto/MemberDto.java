package com.yahait.app.Dto;

public class MemberDto {
	
    private String id;
	private String password;
    private String name;
    private String gender;
    private String mail;
    private String phone;
 
    public MemberDto(){
    
    }
    
	public MemberDto(String id, String password) {
        this.id = id;
		this.password = password;
	    
	}
	
	public MemberDto(String id, String password, String name) {
        this.id = id;
		this.password = password;
		this.name = name;
	    
	}
	
	
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
