package com.lms.dto;

public class SuupDto {

	private String id;//���������̵�
	private String classid;//���Ǿ��̵�
	private int attday;//�⼮��
	private String name;//������ �̸�
	private String ph;//��������ȭ��ȣ
	private String addr;//�������ּ�
	private String email;//�������̸���
	private int totalDay;//�� �����ϼ�
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public int getAttday() {
		return attday;
	}
	public void setAttday(int attday) {
		this.attday = attday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTotalDay() {
		return totalDay;
	}
	public void setTotalDay(int totalDay) {
		this.totalDay = totalDay;
	}
	public SuupDto(String id, String classid, int attday, String name,
			String ph) {
		super();
		this.id = id;
		this.classid = classid;
		this.attday = attday;
		this.name = name;
		this.ph = ph;
	}
	public SuupDto(String name, String ph) {
		super();
		this.name = name;
		this.ph = ph;
	}

	
}
