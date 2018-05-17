package com.jspstudy.ch14.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspstudy.ch14.dao.BoardBean;
import com.jspstudy.ch14.dao.BoardDao;

// 게시 글 내용보기 요청을 처리하는 서비스 클래스
public class BoardReadService implements CommandProcess {
	
	public ForwardService getRequestService(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		// 요청 파라미터로 넘어 온 현재 페이지와 글 번호를 읽어온다.
		String pageNum = request.getParameter("pageNum");
		String no = request.getParameter("no");
		
		/* 게시 글 하나의 정보를 저장하는 BoardBean 인스턴스를 생성하고
		 * BoardDao 인스턴스를 생성한 후 요청한 게시 글 하나를 가져와
		 * BoardBean 객체에 저장 한다.
		 **/
		BoardBean board = new BoardBean();
		BoardDao dao = BoardDao.getInstance();				
		board = dao.getBoard(Integer.valueOf(no));
		
		/* View 페이지에서 필요한 데이터를 Request 영역의 속성에 저장한다.
		 * 게시 글 하나의 내용, 현재 페이지 번호를 속성에 저장 했다. 
		 **/
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		
		/* Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 false로 설정하여 Forward 액션을 지정
		 * 한 후 View 페이지로 게시 글 내용보기를 출력하는 JSP 페이지의 경로를 지정한다.
		 * 
		 * 게시 글 리스트 요청에 대한 결과(모델)를 request 영역의 속성에 저장하고
		 * ForwardService 클래스를 사용해 요청에 대한 결과(모델)를 출력할
		 * View 페이지와 View 페이지를 호출하는 방식을 지정하여 컨트롤러로 넘긴다.
		 **/
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/bbs/bbsContent.jsp");
		return forward;
	}
}
