package com.jspstudy.ch14.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspstudy.ch14.model.BoardListService;
import com.jspstudy.ch14.model.BoardReadService;
import com.jspstudy.ch14.model.BoardWriteService;
import com.jspstudy.ch14.model.ForwardService;

// 모델2 방식으로 게시판 구현하기(게시 글 리스트, 게시 글쓰기, 게시 글 내용보기만 구현)
// 게시판과 관련된 요청을 처리하는 Controller
public class BoardController extends HttpServlet {
	
	// get 방식의 요청을 처리하는 메소드
	protected void doGet(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {		
		doProcess(request, response);
	}
	
	// post 방식의 요청을 처리하는 메소드
	protected void doPost(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {		
		doProcess(request, response);
	}
	
	/* doGet(), doPost()에서 호출하는 메소드
	 * 즉 get방식과 post방식 요청을 모두 처리하는 메소드
	 * 컨트롤러는 이 메소드 안에서 브라우저의 요청에 대한 처리를 요청 URL을 분석해
	 * 해당 서비스 객체에게 위임하고 처리한 결과를 넘겨 받아 브라우저에게 응답한다.
	 **/
	protected void doProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		/* 컨트롤러에 어떤 요청이 들어 왔는지 파악하기 위해 Request 객체로 부터
		 * 웹 어플리케이션의 컨텍스트 루트를 포함한 요청 페이지의 URI 정보와
		 * ContextPath를 얻어와 String 클래스의 substring()을 이용해 
		 * 웹 어플리케이션 루트부터 요청한 페이지의 정보를 추출 한다. 
		 **/
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println(requestURI + ", " + contextPath);
		String command = requestURI.substring(contextPath.length());
		ForwardService forward = null;
		
		if(command.equals("/BoardWrite.two") 
				|| command.equals("/*.two")) {
			
			/* 게시 글쓰기 폼을 요청한 경우의 처리
			 * Redirect와 View 페이지 정보를 저장하는 ForwardService
			 * 클래스의 인스턴스를 생성하고 Redirect 정보를 false로 설정하여
			 * Forward 액션을 지정한 후 View 페이지로 게시 글쓰기 폼을 출력하는
			 * JSP 페이지의 경로를 지정 한다.
			 **/			
			forward = new ForwardService();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/bbs/bbsWriteForm.jsp");	
			
		} else if(command.equals("/BoardWriteService.two")) {
			
			/* 게시 글쓰기 폼에서 등록하기 버튼이 클릭된 경우의 처리 
			 * 사용자가 작성한 게시 글을 DB에 저장하는 BoardWriteService
			 * 클래스의 인스턴스를 생성한 후 Request와 Response 객체를
			 * 매개변수로 getRequestService()를 호출하여 새로운 게시 글을
			 * DB에 저장 한다.
			 */
			BoardWriteService write = new BoardWriteService();
			forward = write.getRequestService(request, response);
			
		} else if(command.equals("/BoardListService.two")) {
			
			/* 게시 글 리스트 보기가 요청된 경우의 처리
			 * 한 페이지에 출력 할 게시 글 리스트를 DB로 부터 읽어오는 
			 * BoardListService 클래스의 인스턴스를 생성한 후 Request와
			 * Response 객체를 매개변수로 getRequestService()를
			 * 호출하여 게시 글 리스트 보기에 대한 요청을 처리 한다.
			 **/
			BoardListService list = new BoardListService();
			forward = list.getRequestService(request, response);
			
		} else if(command.equals("/BoardReadService.two")) {
			
			/* 게시 글 내용보기가 요청된 경우의 처리
			 * 게시 글 하나의 내용을 DB로 부터 읽어오는 BoardReadService
			 * 클래스의 인스턴스를 생성한 후 Request와 Response 객체를
			 * 매개변수로 getRequestService()를 호출하여 게시 글 내용보기에
			 * 대한 요청을 처리 한다.
			 **/
			BoardReadService read = new BoardReadService();
			forward = read.getRequestService(request, response);
		}
		
		/* Redirect 정보와 View 페이지의 경로 정보를 저장하는 ForwardService
		 * 객체가 null이 아니고 Redirect 정보가 true 이면 Response 객체의 
		 * sendRedirect()를 호출하여 브라우저로에게  게시 글 리스트 보기를 요청하라고
		 * 응답하고 Redirect 정보가 false 이면 RequestDispatcher 클래스의
		 * 인스턴스를 생성하여 View 페이지로 포워딩 시킨다.
		 **/ 
		if(forward != null) {
			
			if(forward.isRedirect()) {				
				response.sendRedirect(forward.getPath());
				
			} else {				
				RequestDispatcher rd = 
						request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
			
		} else {
		
			/* 이 컨트롤러는 forward가 null 이면 아무처리도 하지 않도록 되어 있다.
			 * 정상적인 접근이 아니거나 잘못된 요청인지를 판단하여 여기에 해당하면
			 * 서비스 클래스에서 브라우저가 표시할 내용을 HTML 포맷에 맞게 직접
			 * 작성하고 null을 리턴 하면 브라우저에서 그 내용을 볼 수 있다.
			 * 
			 * 아래는 자바스크립트를 이용해 이전 페이지로 돌려보내는 코드를 작성했다.
			 **/
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("	<head>");
			out.println("	<script>");
			out.println("		alert('정상적인 접근이 아닙니다.');");
			out.println("		history.back(-1);");
			out.println("	</script>");
			out.println("	</head>");
			out.println("	<body>");
			out.println("	</body>");
			out.println("</html>");
		}
	}
}
