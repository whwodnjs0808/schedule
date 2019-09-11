<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="register" method="post">
			<input type="hidden" name="userid" value="${login.userid}">
			<div>
				<label>제목</label>
				<input type="text" name="title">
			</div>
			<div>
				<label>내용</label>
				<input type="text" name="contents">
			</div>
			<input type="submit" value="등록">
		</form>
	</div>
</body>
</html>