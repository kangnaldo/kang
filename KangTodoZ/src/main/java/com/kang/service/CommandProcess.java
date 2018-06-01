package com.kang.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {
	public ForwardService getRequestService(
			HttpServletRequest request, HttpServletResponse response)
				throws ServletException , IOException;
}
