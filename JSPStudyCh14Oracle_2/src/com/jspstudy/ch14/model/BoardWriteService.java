package com.jspstudy.ch14.model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspstudy.ch14.dao.BoardBean;
import com.jspstudy.ch14.dao.BoardDao;

// 게시 글쓰기 요청을 처리하는 서비스 클래스
public class BoardWriteService implements CommandProcess {
	
	public ForwardService getRequestService(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
				
		// 게시 글쓰기 폼으로 부터 넘어온 파라미터를 읽는다.
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		/* BoardBean 인스턴스를 생성하여 
		 * 게시 글쓰기 폼으로 부터 넘어온 데이터를 저장 한다. 
		 **/		
		BoardBean board = new BoardBean();
		board.setTitle(title);
		board.setWriter(writer);		
		board.setContent(content);
		board.setEmail(email);
		
		/* BoardDao 객체를 얻어 게시 글을 DB에 추가하기
		 * BoardDao 인스턴스를 생성하고 게시 글의 내용을 저장하고 있는 BoardBean
		 * 인스턴스를 인수로 BoardDao 클래스의 insertBoard()를 호출해
		 * 사용자가 작성한 게시 글을 DB에 추가 한다.
		 **/ 
		BoardDao dao = BoardDao.getInstance();
		dao.insertBoard(board);

		/* Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 true로 설정하여 Redirect 액션을 지정
		 * 한 후 View 페이지로 게시 글 리스트 보기를 출력하는 JSP 페이지의 경로를 지정한다.
		 * 게시 글쓰기가 완료된 후 Redirect 시키지 않으면 이 페이지를 새로고침 하거나
		 * 재요청 할 때 마다 이미 추가된 게시 글을 계속하여 추가하는 문제가 발생 한다.
		 *
		 * 게시 글쓰기 폼으로 부터 넘어온 신규 게시 글을 DB에 저장한 후 게시 글 리스트
		 * 페이지로 이동시키기 위해 ForwardService 클래스를 사용해 redirect 정보를
		 * true로 설정하고 게시 글 리스트 보기 요청을 처리하는 요청 URL를 지정하여
		 * 컨트롤러로 넘긴다. 컨트롤러는 넘겨받은 ForwardService 객체를 분석해
		 * 브라우저에게 지정한 페이지를 다시 요청하라고 redirect 시키고 브라우저는
		 * 게시 글 리스트를 보여주는 페이지를 다시 요청하게 된다.
		 **/
		ForwardService forward = new ForwardService();	
		forward.setRedirect(true);
		forward.setPath("boardList.two");
		return forward;
	}
}
