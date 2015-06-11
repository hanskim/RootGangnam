package it.member;

import java.util.Date;

// Data Transfer Object : ������ ������ �������� ������ ��ü
// ORM �� �ǰ��� �ۼ��� ����. Object Related Mapping 
// Data Table �� ������ ������ ��Ȯ�ϰ� ��ü�� �ٲܼ� �ְ�, �Ȱ��� ����� �Ҹ���.
	// �ʵ�������, ���̺� ���̸��̶� ��ġ��Ű�°� ����. 
public class MemberDto {
	private String id;
	private String pass;
	private String name;
	private String gender;
	private int birth;
	private String address;
	private Date regdate;
	
	// setter getter ����  : source > generate getters and setters
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	

	
}
