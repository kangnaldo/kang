package org.study.spring;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataSourceTest {
	@Autowired
	private DataSource ds;
	@Autowired
	SqlSessionFactory factory;
	@Test
	public void testConnection() throws Exception{
		try(Connection conn = ds.getConnection()){
			System.out.println(conn);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testSqlSessionFactoryBean() throws Exception {
		System.out.println(factory);
		
		try(SqlSession session = factory.openSession()){
			System.out.println(session);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
