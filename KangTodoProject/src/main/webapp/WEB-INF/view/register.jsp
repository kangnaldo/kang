<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>


<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/custom.css" >
</head>
<body>
	<div id="registerFrom">
	
		<form action="RegisterForm.do" method="post">
			<table class="table">
				<tr>
					<td colspan="2"><h2 class="text-center">회원가입</h2></td>
				</tr>
				<tr>
					<td class="text-center"><label for="id" class="control-label">아이디</label></td>
					<td><input type="text" id="id" class="form-control" name="id" /></td>
				</tr>
				<tr>
					<td class="text-center"><label for="name" class="control-label">이름</label></td>
					<td><input type="text" id="name" class="form-control" name="name" /></td>
				</tr>
				<tr>
					<td class="text-center"><label for="password" class="control-label">비밀번호</label></td>
					<td><input type="text" id="password"  class="form-control" name="password" /></td>
				</tr>
				<tr>
					<td class="text-center"><label for="password2" class="control-label">비밀번호 확인</label></td>
					<td><input type="text" id="password2" class="form-control" name="password2" /></td>
				</tr>
				<tr>
					<td class="text-center"><label for="eamil" class="control-label">이메일</label></td>
					<td><input type="email" id="email" class="form-control" name="eamil" /></td>
				</tr>
				<tr>
					<td class="text-center"><label for="addr" class="control-label">주소</label></td>
					<td><input type="text" id="addr"class="form-control"  name="addr" /></td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>