package org.study.spring;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySqlConnectionTest {
	
	private static final String DIRVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://192.168.0.253:3306/book_ex?useSSL=no&characterEncoding=utf8";
	private static final String USER = "book_tester";
	private static final String PASSWORD = "Password!1";
	@Test
	public void testConnection() throws Exception {
		Class.forName(DIRVER);
		try (Connection conn = DriverManager.getConnection(URL,USER,PASSWORD)){
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
