<%-- 
	모델2 방식의 MVC 패턴으로 게시판 구현하기(게시 글 리스트, 게시 글쓰기, 게시 글 내용보기만 구현)
	게시 글 내용보기 View 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jspstudy.ch14.model.*" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모델2 MVC 패턴 - 게시 글 내용보기</title>
<link type="text/css" href="css/board.css" rel="stylesheet" /> 
</head>
<body>
<table class="contentTable">
	<tr>
		<td colspan="4" class="boardTitle"><h3>글 내용 보기</h3></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
	
		<%-- 
		/* EL식을 이용해 BoardListService 클래스에서 Request 영역의 속성에 
		 * 저장한 게시 글의 내용을 속성 이름으로 접근하여 화면에 출력 한다.
		 **/
		 --%>
		<td class="contentTh">글쓴이</td>
		<td class="contentTd1">${ board.writer }</td>
		<td class="contentTh">이메일</td>		
		<%-- jstl의 포맷터 태그를 사용해 글 작성일의 출력 포맷을 지정하고 있다. --%>
		<td class="contentTd1">${ board.email }</td>
	</tr>
	<tr>
		<td class="contentTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		<td class="contentTitle">${ board.title }</td>
		<td class="contentTh">작성일</td>		
		<%-- jstl의 포맷터 태그를 사용해 글 작성일의 출력 포맷을 지정하고 있다. --%>
		<td class="contentTd1"><fmt:formatDate value="${ board.regDate }" 
			pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr>
		<td class="contentTh">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		<td class="readContent" colspan="3">${ board.content }</td>
	</tr>
	<tr>
		<td colspan="4" class="tdSpan"><input type="reset" value="수정하기"/>
			&nbsp;&nbsp;<input type="submit" value="삭제하기" />
			&nbsp;&nbsp;<input type="submit" value="답글쓰기" />
			
		<%-- 
		/* EL식을 이용해  BoardListService 클래스에서 Request 영역의 속성에 
		 * 저장한 현재 페이지 번호를 게시 글 리스트 보기의 링크에 파라미터로 지정 한다.
		 **/
		 --%>
			&nbsp;&nbsp;<input type="button" value="목록보기" 
				onclick="javascript:window.location.href=
					'BoardListService.two?pageNum=${ pageNum }'"/></td>			
	</tr>
</table>
</body>
</html>