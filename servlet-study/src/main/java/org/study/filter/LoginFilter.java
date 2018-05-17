package org.study.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.study.dao.User;

public class LoginFilter implements Filter {
	
	FilterConfig config;
	String[] excludedUrls;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
	
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		StringBuffer path = new StringBuffer(req.getRequestURI());
		
		if(req.getQueryString() != null) {
			path.append("?").append(req.getQueryString());
		}
		
		System.out.println(path.toString());
		
		for (String url : excludedUrls) {
			if (path.toString().equals(url)) {
				chain.doFilter(request, response);
				
				return;
			}
		}
		/*
		if (path.toString().equals("/index.jsp") || path.toString().equals("/")
				|| path.toString().equals("/LoginServlet")) {
			chain.doFilter(request, response);
			
			return;
		}
		*/
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		User user = (User)session.getAttribute("user");
		
		if (user != null) {
			chain.doFilter(request, response);
		} else {
			request.setAttribute("error", "먼저 로그인을 하세요");
			request.setAttribute("orgPath", path.toString());
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		this.config = arg0;
		String s = config.getInitParameter("excluded");
		//System.out.println(s);
		excludedUrls = s.split(",");
		
		for (int i = 0; i < excludedUrls.length; i++) {
			excludedUrls[i] = excludedUrls[i].trim(); 
		}
		
		//System.out.println(Arrays.toString(urls));
	}

}
