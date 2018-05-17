package com.jspstudy.ch14.dao;

import java.sql.*;

/* 하나의 게시 글을 저장하는 클래스
 * 게시 글을 저장하고 있는 테이블의 컬럼과 Beans 클래스의 필드가 1:1로 맵핑된다.
 **/
public class BoardBean {
	
	private int no;
	private String title;
	private String writer;
	private String email;
	private String content;
	private Timestamp regDate;
	
	public BoardBean() { }
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
}
