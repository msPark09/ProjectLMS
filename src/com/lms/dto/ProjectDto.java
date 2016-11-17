package com.lms.dto;

public class ProjectDto {
	private String proid;
	private String lectid;
	private String proname;
	private String subname;
	private String proexp;
	private String proorin;
	private String proren;
	private String id;
	private String name;
	private String testid;
	private int grade;
	
	public ProjectDto() {
		// TODO Auto-generated constructor stub
	}

	public ProjectDto(String proid, String lectid, String proname,
			String subname, String proexp, String proorin, String proren,
			String id) {
		this.proid = proid;
		this.lectid = lectid;
		this.proname = proname;
		this.subname = subname;
		this.proexp = proexp;
		this.proorin = proorin;
		this.proren = proren;
		this.id = id;
	}

	public ProjectDto(String proid, String subname, String proexp,
			String proorin, String id, String name, String testid, int grade, String proname) {
		super();
		this.proid = proid;
		this.subname = subname;
		this.proexp = proexp;
		this.proorin = proorin;
		this.id = id;
		this.name = name;
		this.testid = testid;
		this.grade = grade;
		this.proname = proname;
	}

	public ProjectDto(String proid, String subname, String id, String name,
			String testid, int grade) {
		this.proid = proid;
		this.subname = subname;
		this.id = id;
		this.name = name;
		this.testid = testid;
		this.grade = grade;
	}

	public String getProid() {return proid;}
	public void setProid(String proid) {this.proid = proid;}
	public String getLectid() {return lectid;}
	public void setLectid(String lectid) {this.lectid = lectid;}
	public String getProname() {return proname;}
	public void setProname(String proname) {this.proname = proname;}
	public String getSubname() {return subname;}
	public void setSubname(String subname) {this.subname = subname;}
	public String getProexp() {return proexp;}
	public void setProexp(String proexp) {this.proexp = proexp;}
	public String getProorin() {return proorin;}
	public void setProorin(String proorin) {this.proorin = proorin;}
	public String getProren() {return proren;}
	public void setProren(String proren) {this.proren = proren;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTestid() {
		return testid;
	}

	public void setTestid(String testid) {
		this.testid = testid;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
