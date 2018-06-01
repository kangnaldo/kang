package com.kang.controller;

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

import com.kang.service.CommandProcess;
import com.kang.service.ForwardService;

public class Controller extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// properties 에 지정한 키값(컨택스트패스) 과 CommandProcess 인터페이스를 구현한 클래스 정보가 값으로 들어가는 맵 변수
	// 생성
	Map<String, CommandProcess> commandMap = new HashMap<String, CommandProcess>();

	// init() 메서드는 서블릿이 시작할때 딱 1번 로드되는 메서드
	// ServletConfig = 하나의 servlet에 관련된 초기화 파라미터
	public void init(ServletConfig config) throws ServletException {
		super.init(config); // 뭔지 모름 그냥해줌

		// web.xml 에 들어있는 init-param에 설정한 commandURI initparameter를 가져옴
		String commandURI = getInitParameter("commandURI");

		Properties prop = new Properties();

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		try {
			//realPath = commandURI.properties 파일이 들어있는 실제 디렉토리
			//C:\workspace\java_web\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPStudyCh14Oracle_2\WEB-INF\commandURI.properties
			String realPath = getServletContext().getRealPath(commandURI);
			fis = new FileInputStream(realPath);
			bis = new BufferedInputStream(fis);
			
			prop.load(bis);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bis != null)
					bis.close();
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Iterator iter = prop.keySet().iterator();
		
		//while 문을 돌면서 properties 에 저장된 키/값을 얻어옴
		while(iter.hasNext()) {
			String command = (String) iter.next(); // 키값
			String className = prop.getProperty(command); //키에 대응한 값 = 클래스
			
			try {
				// 동적으로 클래스를 생성합니다. 
				Class<?> commandClass = Class.forName(className);
				//CommandProcess 인터페이스를 구현한 클래스인스턴스 생성.
				CommandProcess service = (CommandProcess) commandClass.newInstance();
				
				commandMap.put(command, service);
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
				throw new ServletException("FrontController - ClassNotFound");
			}catch(InstantiationException e) {
				e.printStackTrace();
				throw new ServletException("FrontController - Instantiation");
			}catch(IllegalAccessException e) {
				e.printStackTrace();
				throw new ServletException("FrontController - IllegalAccess");
			}
		}

	}
	//.do로 끝나는건 모조리 일루 들어옴
	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		///URI는 이런식으로 들어옴 JSPStudyCh14Oracle_2/*.two
		String requestURI = request.getRequestURI();
		// /JSPStudyCh14Oracle_2 컨택스트패스
		String contextPath = request.getContextPath();
		// /*.two = command
		String command = requestURI.substring(contextPath.length());
		
		ForwardService forward = null;
		CommandProcess service = commandMap.get(command);
		
		if (service != null) {
			forward = service.getRequestService(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		/*
		 * 
		 * 
		 *  새션처리 여기서 할거임 command.equals("");
		 * 
		 */
		if (forward != null) {
			if (forward.isRedirect()) {// 리다이렉트 처리
				response.sendRedirect(forward.getPath());
			} else { // 포워드 처리
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);

			}
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
}
