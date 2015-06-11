package it.member;

import java.util.Date;

// Data Transfer Object : 데이터 전달을 목적으로 설계한 객체
// ORM 에 의거한 작성이 좋다. Object Related Mapping 
// Data Table 에 한줄의 내용을 정확하게 객체로 바꿀수 있게, 똑같이 만들란 소리다.
	// 필드명까지도, 테이블 열이름이랑 일치시키는게 좋다. 
public class MemberDto {
	private String id;
	private String pass;
	private String name;
	private String gender;
	private int birth;
	private String address;
	private Date regdate;
	
	// setter getter 구현  : source > generate getters and setters
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
