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

@WebServlet("/DeleteEmp")
public class DeleteEmpServlet extends HttpServlet{

	
	private EmployeeService service = new EmployeeDaoImpl();
	/**
	 * 1. 데이터 베이스에 접근 해서,
	 * 2. select * from user;
	 * 3. 추출된 값을 리스트에 담아서 클라이언트에게 답
	 * 
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		List<Employee> list = service.listEmployee();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		if (!service.deleteEmployee(id)) {
			//request.setAttribute("error", "Delete 실패");
			// 에러 페이지로 dispatch
		}
		
		response.sendRedirect("/ListPageEmp?page=1");
	}
}
