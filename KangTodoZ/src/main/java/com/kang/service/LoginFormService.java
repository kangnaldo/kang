package com.kang.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kang.bean.User;
import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;


public class LoginFormService implements CommandProcess{

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		TodoDao dao = TodoDaoImpl.getInstance();
		User user = dao.login(id, password);
		
		if(user == null) {
			
		}
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/index.do");
		return forward;
	}

}
