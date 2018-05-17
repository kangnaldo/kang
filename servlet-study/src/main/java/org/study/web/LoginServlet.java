package org.study.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.study.dao.User;
import org.study.dao.UserService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	UserService service = new UserService();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		String id = request.getParameter("id");
		String passwd = request.getParameter("password");
		System.out.println("LoginServlet: " + request.getParameter("orgPath"));
		
		User user = new User(id, passwd);
		System.out.println(user.getName());
		if (service.isValidUser(user)) {

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.setAttribute("name", user.getName());
			
			//request.getRequestDispatcher(request.getParameter("orgPath")).forward(request, response);
			response.sendRedirect(request.getParameter("orgPath"));
		} else {
			request.setAttribute("error", "당신의 아이디/비밀번호가 맞지 않습니다.");
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		}
			
	}
}
