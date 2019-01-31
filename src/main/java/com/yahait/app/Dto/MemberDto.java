package com.yahait.app.Dto;

public class MemberDto {
	
    private String member_id;
	private String member_password;
    private String name;
    private String gender;
    private String mail;
    private String phone1;
 
    public MemberDto(){
    
    }
    
	public MemberDto(String member_id, String member_password) {
        this.member_id = member_id;
		this.member_password = member_password;
	    
	}
	
	public MemberDto(String member_id, String member_password, String member_name) {
        this.member_id = member_id;
		this.member_password = member_password;
		this.name = member_name;
	    
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
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

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	
	
    

}
