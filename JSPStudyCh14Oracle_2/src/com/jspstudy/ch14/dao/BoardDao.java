package com.jspstudy.ch14.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// DB에 게시 글쓰기, 리스트 보기, 게시 글 내용보기를 처리하는 DataBase Access Object
public class BoardDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;	
	
	// BoardDao 클래스가 메모리에 로딩될 때 인스턴스가 생성 된다.
	private static BoardDao instance = new BoardDao();
	
	// 외부에서는 getInstance() 만을 사용해 클래스의 인스턴스를 사용할 수 있다.
	public static BoardDao getInstance() {
		if(instance  == null) {
			return new BoardDao();
		}
		return instance;	
	};	
	
	/* 외부에서 new 연산자를 사용해 여러 개의 인스턴스를 생성하지 못하도록
	 * 접근 제어자를 private으로 하여 생성자를 선언 - Singleton 패턴 
	 * Singleton 패턴으로 구현하면 하나의 클래스 로더 당 하나의 인스턴스만 존재한다.
	 **/
	private BoardDao() {	}	

	
	/* 게시 글쓰기 요청시 호출되는 메소드
	 * 게시 글을 작성하고 등록하기 버튼을 클릭하면 게시 글을 DB에 추가하는 메소드 
	 **/
	public void insertBoard(BoardBean board) {
		
		String sqlInsert = 
				"INSERT INTO bbs(no, title, writer, email, content, reg_date) "
				+ "VALUES(bbs_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
		
		try {			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getContent());			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {			
			DBManager.close(conn, pstmt);
		}
	}
	
	/* 전체 게시 글 수를 계산하기 위해 호출되는 메소드 - paging 처리에 사용
	 * DB 테이블에 등록된 모든 게시 글의 수를 리턴 하는 메소드
	 **/
	public int getBoardCount() {
		
		String sqlCount = "SELECT COUNT(*) FROM bbs";
		int count = 0;
		
		try{
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch(Exception e) {
			
			e.printStackTrace();
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	
	/* 한 페이지에 보여 질 게시 글 리스트 요청시 호출되는 메소드
	 * 요청한 페이지에 해당하는 게시 글 리스트를 DB에서 읽어와 리턴 하는 메소드
	 **/
	public ArrayList<BoardBean> getBoardList(int startRow, int endRow) {
		
		/* 요청한 페이지에 해당하는 게시 글 리스트를 추출하기 위한 쿼리
		 * 테이블에서 현재 페이지에 해당하는 게시 글을 검색할 때 ROWNUM을 사용했다.
		 * ROWNUM은 쿼리의 결과로 검색되는 행들의 순서 값을 가진 의사컬럼으로
		 * 1부터 시작한다. 최신 게시 글을 먼저 보여주기 위해 ORDER BY DESC를 
		 * 지정하고 요청된 페이지에 보여줄 게시 글의 시작 행과 마지막 행을 지정한다.
		 *  
		 * 아래의 쿼리로 질의하게 되면 게시 글 전체를 글 번호에 해당하는 no를 기준으로
		 * 내림차순 정렬하여 검색하고 WHERE 절에 지정한 첫 번째 Placeholder(?)에
		 * 해당하는 시작 행 부터 두 번째 Placeholder(?)에 해당하는 마지막 행까지의
		 * 게시 글을 추출할 수 있다.
		 **/		
		String sqlBoardList = "SELECT * FROM (SELECT ROWNUM "
				+ "num, no, title, writer, email, content, reg_date FROM "
				+ "(SELECT * FROM bbs ORDER BY no DESC)) "
				+ "WHERE num >= ? AND num <= ?";
		
		ArrayList<BoardBean> boardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlBoardList);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardList = new ArrayList<BoardBean>();
				
				do {					
					BoardBean board = new BoardBean();
					board.setNo(rs.getInt(2));					
					board.setTitle(rs.getString(3));
					board.setWriter(rs.getString(4));
					board.setEmail(rs.getString(5));
					board.setContent(rs.getString(6));
					board.setRegDate(rs.getTimestamp(7));
					
					boardList.add(board);
					
				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	/* 게시 글 내용 보기 요청시 호출되는 메소드
	 * 하나의 게시 글을 DB에서 읽어와 BoardBean 객체로 리턴 하는 메소드 
	 **/
	public BoardBean getBoard(int no) {
		
		String sqlBoard = "SELECT * FROM bbs WHERE no=?";
		BoardBean board = null;
		
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlBoard);
			pstmt.setInt(1, no);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				board = new BoardBean();
				board.setNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));	
				board.setEmail(rs.getString(4));
				board.setContent(rs.getString(5));
				board.setRegDate(rs.getTimestamp(6));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return board;
	}
}
