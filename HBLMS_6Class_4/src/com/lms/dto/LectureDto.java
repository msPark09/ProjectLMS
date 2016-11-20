package com.lms.dto;

import java.util.Date;

public class LectureDto {
	private String classid;//클래스아이디
	private Date startday;
	private String teacid;//강사아이디
	private String teacname;//강사이름

	private String cobj;//강의목표
	private String cinfo;//강의설명
	private String cname;//강의명
	private String division;//구분
	private int statu;//상태
	private int lectday;//총강의일(기간)

	private String cfname;//강의 파일
	private int priority;//우선순위
	
	private int cnt;//수강생 수

	public LectureDto(String cname, int priority, String classid, String cinfo) {
		super();
		this.cname = cname;
		this.priority = priority;
		this.classid = classid;
		this.cinfo = cinfo;
	}

	
	public LectureDto() {
		// TODO Auto-generated constructor stub
	}



	public Date getStartday() {
		return startday;
	}


	public void setStartday(Date startday) {
		this.startday = startday;
	}


	public String getTeacid() {
		return teacid;
	}


	public void setTeacid(String teacid) {
		this.teacid = teacid;
	}


	public String getTeacname() {
		return teacname;
	}


	public void setTeacname(String teacname) {
		this.teacname = teacname;
	}


	public String getCobj() {
		return cobj;
	}


	public void setCobj(String cobj) {
		this.cobj = cobj;
	}


	public String getDivision() {
		return division;
	}


	public void setDivision(String division) {
		this.division = division;
	}


	public int getStatu() {
		return statu;
	}


	public void setStatu(int statu) {
		this.statu = statu;
	}


	public int getLectday() {
		return lectday;
	}


	public void setLectday(int lectday) {
		this.lectday = lectday;
	}


	public String getCfname() {
		return cfname;
	}


	public void setCfname(String cfname) {
		this.cfname = cfname;
	}


	public String getCname() {
		return cname;
	}

	public int getPriority() {
		return priority;
	}

	public String getClassid() {
		return classid;
	}

	public String getCinfo() {
		return cinfo;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}


	public LectureDto(String classid, String cname, String division) {
		super();
		this.classid = classid;
		this.cname = cname;
		this.division = division;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
