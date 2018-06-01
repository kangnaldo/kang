package com.kang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {//DB Connection 을 관리하는 클래스입니당.
	private static DataSource DS; // 커넥션풀하는 객체
	private static Connection CONN;
	
	private DBManager() {}
	
	static { //static 초기화 블럭으로 메모리에 로딩
		try {
			//자바 네이밍 서비스
			//자바 네이밍 서비스를 사용하기 위해 InitialContext 객체를 생성한다.
			Context initContext = new InitialContext();
			//java:/comp/env -> 리소스를 찾을때 접두사라고 보면됨. JNDI에서 사용하는 기본적인 네임스페이스임
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			
			//"jdbc/bbsDBPool" 이라는 이름을 가진 DBCP에서 DataSource 객체를 얻음
			//context.xml 파일에서 지정한 수의 커넥션을 생성해 커넥션 풀에 저장함.
			System.out.println(DS);
			DS = (DataSource) envContext.lookup("jdbc/todoDBPool");
			System.out.println("커넥션확인"+DS.getConnection());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//DBMS의 접속하고 활성화된 Connection 객체를 리턴 하는 메소드임니당 싱글톤패턴
	public static Connection getConnection() {
		try {
			// DataSource 객체를 이용해 커넥션을 대여함.
			CONN = DS.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return CONN;
	}
	
	//DB 작업에 사용된 자원을 해제하는 메소드
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Transaction
	/*
	 * ) JDBC에서의 Transaction
	- 초기 Connection 객체생성 후 “executeUpdate(String sql)”는 일반적으로 auto commit을 수행합니다.
  		그래서 순차적으로 DML SQL(select 제외)를 수행했을 때, 오류가 발생하기 전 Query문은 모두
  		commit된 상태로 rollback을 할 수 없습니다.
	- auto commit방지를 위해 Connection 객체에 “setAutoCommit(false)”를 호출하여 수동적으로
  		commit, rollback을 수행할 수 있습니다.
	 */
	public static void setAutoCommit(Connection conn, boolean isTransaction) {
		try {
			if(conn != null) conn.setAutoCommit(isTransaction);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//Transaction 종료
	public static void commit(Connection conn) {
		try {
			if(conn != null) conn.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Transaction 롤백
	public static void rollback(Connection conn) {
		try {
			if(conn != null)conn.rollback();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
}
