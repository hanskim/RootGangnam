package it.board;

import java.util.Date;

public class BoardDto {
	private int num;		// �۹�ȣ  Primary Key
	private String writer;	// �ۼ��� = �α��� Id
	private String type;	// ���� , �����
	private String title;	// ������
	private String content;	// �۳���
	private int count;		// ��ȸ��
	private Date regdate;	// �۵����
	private String ip;		// �ۼ��� Ip Address

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
