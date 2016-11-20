package com.lms.dto;

public class AgreedDto {
	private int id;
	private String lectid;
	private String stuid;
	private String stuname;
	private int agreed;	//½ÂÀÎ : 1 ¹Ì½ÂÀÎ : 0 default : 0
	private String lectname;
	private String lectstatu;

	public AgreedDto(){
		
	}
	
	public AgreedDto(String lectid, String stuid, String stuname, int agreed) {
		super();
		this.lectid = lectid;
		this.stuid = stuid;
		this.stuname = stuname;
		this.agreed = agreed;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLectid() {
		return lectid;
	}
	public void setLectid(String lectid) {
		this.lectid = lectid;
	}
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public int getAgreed() {
		return agreed;
	}
	public void setAgreed(int agreed) {
		this.agreed = agreed;
	}

	public String getLectname() {
		return lectname;
	}

	public void setLectname(String lectname) {
		this.lectname = lectname;
	}

	public String getLectstatu() {
		return lectstatu;
	}

	public void setLectstatu(String lectstatu) {
		this.lectstatu = lectstatu;
	}
	
	
}
