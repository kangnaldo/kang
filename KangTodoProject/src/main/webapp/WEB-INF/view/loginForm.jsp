<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="/WEB-INF/module/nav.jsp" flush="false"></jsp:include>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/custom.css" >
</head>
<body>
	<div class="logposition">
	
		<form><!-- class="form-horizontal" -->
			<div class="form-group">
				<label for="inputEmail3" class="la1 col-sm-2 col-sm-offset-2 control-label text-center">아이디</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="id"
						placeholder="아이디" required>
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="la1 col-sm-2 col-sm-offset-2 control-label text-center">패스워드</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="password"
						placeholder="비밀번호" required>
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-8 col-sm-offset-4">
					<input type="submit" value="로그인" class="btn">
					<button value="로그인" class="btn">취소</button>
				</div>
			</div>
			
			
		</form>
		
	
	</div>
</body>
</html>