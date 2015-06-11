package it.board;

import java.util.Date;

public class BoardDto {
	private int num;		// 글번호  Primary Key
	private String writer;	// 작성자 = 로그인 Id
	private String type;	// 공개 , 비공개
	private String title;	// 글제목
	private String content;	// 글내용
	private int count;		// 조회수
	private Date regdate;	// 글등록일
	private String ip;		// 작성자 Ip Address

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
