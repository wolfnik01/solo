package com.itwillbs.member;

import java.sql.Timestamp;

public class MemberBean {
	// 데이터를 저장하는 객체 (한번에 회원정보를 저장가능한 객체)
	// => DB에 데이터 전달
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String gender;
	private String phone;
	private Timestamp reg_date;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email +
				", gender=" + gender + ", phone=" + phone + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
	
	
	

}
