package org.study.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.study.dao.Employee;
import org.study.dao.EmployeeDaoImpl;
import org.study.dao.EmployeeService;

@WebServlet("/ListEmp")
public class ListServlet extends HttpServlet{

	private EmployeeService service = new EmployeeDaoImpl();
	/**
	 * 1. 데이터 베이스에 접근 해서,
	 * 2. select * from user;
	 * 3. 추출된 값을 리스트에 담아서 클라이언트에게 답
	 * 
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		List<Employee> list = service.listEmployee();
		
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("/WEB-INF/views/listEmp.jsp").forward(request, response);
		} catch (ServletException se) {
			
		} catch (IOException ioe) {
			
		}
	}
}
