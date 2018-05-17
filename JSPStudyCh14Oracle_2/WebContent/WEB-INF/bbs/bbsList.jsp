<%-- 
	모델2 방식의 MVC 패턴으로 게시판 구현하기(게시 글 리스트, 게시 글쓰기, 게시 글 내용보기만 구현)
	게시 글 리스트 보기 요청 View 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %> 
<%@ page import="com.jspstudy.ch14.model.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모델2 MVC 패턴 - 게시 글 리스트 보기</title>
<link type="text/css" href="css/board.css" rel="stylesheet" /> 
</head>
<body>
<table class="listTable">
	<tr>
		<td colspan="5" class="boardTitle"><h3>게시 글 리스트</h3></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="listWrite" colspan="5"><a href="boardWriteForm.two">
			글쓰기</a></td>
	</tr>
	<tr>
		<td class="listThNo">번 호</td>
		<td class="listThTitle">제 목</td>
		<td class="listThWriter">작성자</td>
		<td class="listThEmail">이메일</td>
		<td class="listThDate">작성일</td>		
	</tr>	
	
	<%-- 게시 글이 존재하지 않으면 --%>
	<c:if test="${ listCount == 0 }">
	<tr>
		<td class="listTdSpan" colspan="5">게시 글이 존재하지 않습니다.</td>
	</tr>
	</c:if>
	
	<%-- 게시 글이 존재하면 반복문을 이용해 게시 글 리스트를 화면에 출력한다. --%>
	<c:if test="${ listCount != 0 }" >	
	<c:forEach var="board" items="${ boardList }">
	<tr class="listTr">
		<td class="listTdNo">${ board.no }</td>
		
		<%-- 
		/* 게시 글 제목을 출력하며 게시 글 내용보기 페이지를 링크하고
		 * 게시 글 번호와 현재 페이지를 파라미터로 설정하고 있다.
		 **/
		--%>
		<td class="listTdTitle"><a href="BoardReadService.two?no=${ board.no }
			&pageNum=${ currentPage }">${ board.title }</a></td>
		<td class="listTdWriter">${ board.writer }</td>
		<td class="listTdEmail">${ board.email }</td>
		<%-- jstl의 포맷터 태그를 사용해 글 작성일의 출력 포맷을 지정하고 있다. --%>
		<td class="listTdDate"><fmt:formatDate value="${ board.regDate }" 
			pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	</c:forEach>
	</c:if>
	<tr>
		<td colspan="5" class="listPage">
		
		<%-- 게시 글의 수가 0보다 크면 즉 게시 글이 하나라도 존재하면 --%>
		<c:if test="${ listCount > 0 }" >
		
		<%-- 
		/* 현재 페이지 그룹의 시작 페이지가 pageGroup보다 크다는 것은 이전 페이지
		 * 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에 pageGroup를 
		 * 마이너스하여 링크를 설정하면 이전 페이지 그룹의 startPage로 이동할 수 있다.
		 **/
		--%>		
			<c:if test="${ startPage > pageGroup }">
				<a href="BoardListService.two?
					pageNum=${ startPage - pageGroup }">[이전]</a>
			</c:if>
			
		<%--
		/* 현재 페이지 그룹의 startPage 부터 endPage 만큼 반복하면서
		 * 현재 페이지와 같은 그룹에 속한 페이지를 화면에 출력하고 링크를 설정한다.
		 * 현재 페이지는 링크를 설정하지 않는다.
		 **/
		--%>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					[${ i }]
				</c:if>
				<c:if test="${ i != currentPage }">
					<a href="BoardListService.two?pageNum=${ i }">[${ i }]</a>
				</c:if>
			</c:forEach>
			
		<%--
		/* 현재 페이지 그룹의 마지막 페이지가 전체 페이지 보다 작다는 것은 다음 페이지
		 * 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에 pageGroup을
		 * 플러스하여 링크를 설정하면 다음 페이지 그룹의 startPage로 이동할 수 있다.
		 **/
		 --%>
			<c:if test="${ endPage < pageCount }">
				<a href="BoardListService.two?
					pageNum=${ startPage + pageGroup }">[다음]</a>
			</c:if>			
		</c:if>
		</td>			
	</tr>
</table>
</body>
</html>