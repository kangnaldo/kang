package com.kang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.kang.service.CommandProcess;

public class Controller extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	// properties 에 지정한 키값(컨택스트패스) 과 CommandProcess 인터페이스를 구현한 클래스 정보가 값으로 들어가는 맵 변수 생성
	Map<String, CommandProcess> commandMap = new HashMap<String, CommandProcess>();
	
	//init() 메서드는 서블릿이 시작할때 딱 1번 로드되는 메서드
	//ServletConfig = 하나의 servlet에 관련된 초기화 파라미터
	public void init(ServletConfig config) throws ServletException {
		super.init(config); //뭔지 모름 그냥해줌
		
		//web.xml 에 들어있는 init-param에 설정한 commandURI initparameter를 가져옴
		String commandURI = getInitParameter("commandURI");
		
	}
}
