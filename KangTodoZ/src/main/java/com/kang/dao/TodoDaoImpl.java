package com.kang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kang.bean.User;

public class TodoDaoImpl implements TodoDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private TodoDaoImpl() {

	}

	// 싱글톤 패턴 임당
	private static TodoDaoImpl instance = new TodoDaoImpl();

	public static TodoDaoImpl getInstance() {
		if (instance == null) {
			return new TodoDaoImpl();
		}
		return instance;
	};

	@Override
	public boolean userInsert(User user) {

		int status = 0;

		try {
			conn = DBManager.getConnection();
			// 트랜젝션 처리임니당
			/*
			 * JSP는 기본적으로 오토커밋되어있음 그래서 오토커밋이 자동으로 작동되지 못하게 해야됨
			 */

			DBManager.setAutoCommit(conn, false);
			String sql = "insert into user(id,name,password,email,addr) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getAddr());

			status = pstmt.executeUpdate();

			if (status == 1) {
				DBManager.commit(conn);
				DBManager.setAutoCommit(conn, true);
			} else {
				DBManager.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return status == 1 ? true : false;
	}
	
	//아이디 중복 체크
	@Override
	public boolean userOverlapCk(String id) {
		int status = 0;
		try {
			conn = DBManager.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//로그인
	@Override
	public User login(String id, String password) {
		User user = null;
		try {
			String sql = "select * from user where id = ? AND password = ?";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
