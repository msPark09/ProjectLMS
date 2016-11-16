package com.lms.dto;

import java.util.Date;

public class ProlistDto {
	
	private String proid;
	private String stuid;
	private String lectid;
	private String lect;
	private String proname;
	private String procont;
	private Date proday;
	private String name;
	private String id;
	private int grade;
	
	public ProlistDto() {
		// TODO Auto-generated constructor stub
	}
	
	public ProlistDto(String cname, int grade, String classid, String stuid, String statu) {
		super();
		this.name = cname;
		this.grade = grade;
		this.stuid = stuid;
		this.lectid = classid;
	}

	public ProlistDto(String proid, String stuid, String lectid, String lect,
			String proname, String procont, Date proday, String name, String id) {
		super();
		this.proid = proid;
		this.stuid = stuid;
		this.lectid = lectid;
		this.lect = lect;
		this.proname = proname;
		this.procont = procont;
		this.proday = proday;
		this.name = name;
		this.id = id;
	}

	public String getProid() {return proid;}
	public void setProid(String proid) {this.proid = proid;}
	public String getStuid() {return stuid;}
	public void setStuid(String stuid) {this.stuid = stuid;}
	public String getLectid() {return lectid;}
	public void setLectid(String lectid) {this.lectid = lectid;}
	public String getLect() {return lect;}
	public void setLect(String lect) {this.lect = lect;}
	public String getProname() {return proname;}
	public void setProname(String proname) {this.proname = proname;}
	public String getProcont() {return procont;}
	public void setProcont(String procont) {this.procont = procont;}
	public Date getProday() {return proday;}
	public void setProday(Date proday) {this.proday = proday;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public ProlistDto(String proid, String proname, Date proday) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.proday = proday;
	}
	
		

}
