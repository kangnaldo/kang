package com.jspstudy.ch14.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspstudy.ch14.model.CommandProcess;
import com.jspstudy.ch14.model.ForwardService;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	
	Map<String, CommandProcess> commandMap = new HashMap<String, CommandProcess>();
	
    public FrontController() { 
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String commandURI = getInitParameter("commandURI");
		
		Properties prop = new Properties();
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		try {
								
			String realPath = getServletContext().getRealPath(commandURI);
			fis = new FileInputStream(realPath);
			bis = new BufferedInputStream(fis);
			
			prop.load(bis);
		}catch(IOException e){
		}finally{
			try{
				if(bis != null) bis.close();
				if(fis != null) fis.close();
			}catch(IOException e){
				
			}
		}
		
		Iterator iter = prop.keySet().iterator();
		while(iter.hasNext()){
			String command = (String)iter.next();
			String className = prop.getProperty(command);
			
			try {
				Class<?> commandClass = Class.forName(className);
				CommandProcess service = (CommandProcess)commandClass.newInstance();
				
				commandMap.put(command, service);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				throw new ServletException("FrontController - ClassNotFound");
				
			} catch(InstantiationException e){
				e.printStackTrace();
				throw new ServletException("FrontController - Instantiation");
			} catch(IllegalAccessException e){
				e.printStackTrace();
				throw new ServletException("FrontController - IllegalAccess");
			}
		}
	}
	
	
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println(requestURI + "," + contextPath);
		
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);
		ForwardService forward = null;
		CommandProcess service = commandMap.get(command);
		if(service != null){
			forward = service.getRequestService(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		
		if(forward != null){
			if(forward.isRedirect()){//리다이렉트 처리
				response.sendRedirect(forward.getPath());
			}
			else { //포워드 처리
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
						
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
