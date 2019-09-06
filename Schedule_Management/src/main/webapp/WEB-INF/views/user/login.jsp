<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="/user/loginPost" method="post">
		<div>
		<label>아이디</label>
		<input type="text" name="userid">
		</div>
		<div>
		<label>패스워드</label>
		<input type="password" name="password">
		</div>
		<div>
			<label>
				<input type="checkbox" name="useCookie"> Remember Me
			</label>
		</div>
		<input type="submit" value="로그인">
	</form>
</body>
</html>