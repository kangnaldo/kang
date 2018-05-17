<%-- 
	모델2 방식의 MVC 패턴으로 게시판 구현하기(게시 글 리스트, 게시 글쓰기, 게시 글 내용보기만 구현)
	게시 글쓰기 폼 요청 View 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모델2 MVC 패턴 - 게시 글쓰기 폼</title>
<link type="text/css" href="css/board.css" rel="stylesheet" /> 
<script type="text/javascript" src="js/formcheck.js"></script>
</head>
<body>	
<form name="writeForm" action="boardWrite.two" 
	method="post" onsubmit="return formCheck();">
<table class="readTable">
	<tr>
		<td colspan="2" class="boardTitle"><h3>글 쓰 기</h3></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="readTh">글쓴이</td>
		<td class="readTd">
			<input type="text" name="writer" size="20" maxlength="10"/></td>
	</tr>		
	<tr>
		<td class="readTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		<td class="readTd">
			<input type="text" name="title" size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="readTh">이메일</td>
		<td class="readTd">
			<input type="text" name="email" size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="readTh">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		<td class="readTd">
			<pre><textarea name="content" rows="15" cols="45"/></textarea></pre>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="tdSpan"><input type="reset" value="다시쓰기"/>
			&nbsp;&nbsp;<input type="submit" value="등록하기" />
			&nbsp;&nbsp;<input type="button" value="목록보기" 
				onclick="javascript:window.location.href=
					'boardList.two'"/></td>
	</tr>
</table>
</form>
</body>
</html>