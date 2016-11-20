package com.lms.dto;

public class MemDto {
	
	private String id;
	private String pw;
	private int lv;
	private String name;
	private String phone;
	private String address;
	private String mail;
	
	public MemDto() {
		// TODO Auto-generated constructor stub
	}

	public MemDto(String id, int lv, String name, String phone, String mail) {
		super();
		this.id = id;
		this.lv = lv;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
	}

	public MemDto(String id, String pw, int lv, String name, String phone,
			String address, String mail) {
		super();
		this.id = id;
		this.pw = pw;
		this.lv = lv;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.mail = mail;
	}

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

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	
	
	
	
}
