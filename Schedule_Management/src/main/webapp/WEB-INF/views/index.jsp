<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<li>
				<c:choose>
					<c:when test="${sessionScope.user eq null}">
						<a href="/user/login">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="/user/login">로그아웃</a>
					</c:otherwise>
				</c:choose>
				<a href="/calendar/fullcalendar">일정관리</a>
			</li>
		</ul>
	</div>
</body>
</html>