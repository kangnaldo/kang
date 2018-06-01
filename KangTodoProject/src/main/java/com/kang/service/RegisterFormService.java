package com.kang.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kang.bean.User;
import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class RegisterFormService implements CommandProcess{

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		
		String email = email1 +"@" + email2;
		String addr = addr1+addr2+addr3;
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(password);
		user.setEmail(email);
		user.setAddr(addr);
		System.out.println("테스트 addr " + addr);
		TodoDao dao = TodoDaoImpl.getInstance();
		boolean a = dao.userInsert(user);
		System.out.println("테스트 불리언 " + a);
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/index.jsp");
		return forward;
	}

}
