package com.lms.dto;

public class JoblistDto {
	private String id;
	private String adminid;
	private String jobname;
	private String jobcont;
	private String jobweb;
	private String jobfile;
	
	public JoblistDto(){
		
	}
	public JoblistDto(String id, String adminid, String jobname) {
		super();
		this.id = id;
		this.adminid = adminid;
		this.jobname = jobname;
	}	
	public JoblistDto(String id, String adminid, String jobname,
			String jobcont, String jobweb, String jobfile) {
		super();
		this.id = id;
		this.adminid = adminid;
		this.jobname = jobname;
		this.jobcont = jobcont;
		this.jobweb = jobweb;
		this.jobfile = jobfile;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getJobcont() {
		return jobcont;
	}
	public void setJobcont(String jobcont) {
		this.jobcont = jobcont;
	}
	public String getJobweb() {
		return jobweb;
	}
	public void setJobweb(String jobweb) {
		this.jobweb = jobweb;
	}
	public String getJobfile() {
		return jobfile;
	}
	public void setJobfile(String jobfile) {
		this.jobfile = jobfile;
	}

}
