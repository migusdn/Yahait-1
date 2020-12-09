package com.yahait.app.Dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MemberDto {
	private String member_num; 
    private String member_id;
	private String member_password;
    private String member_name;
    private String gender;
    private String mail1;
    private String mail2;
    private String phone1;
    private String birth_y;
    private String birth_m;
    private String birth_d;
}
