package com.jspstudy.ch14.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardIndexService implements CommandProcess {

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath("boardList.two");
		return forward;
	}

}
