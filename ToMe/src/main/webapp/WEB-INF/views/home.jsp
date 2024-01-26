<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To me home</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty siteUserInfo }">
			<h4>아이디:${siteUserInfo.email }</h4>
			<h4>이름:${siteUserInfo.name }</h4>
			<button onclick="location.href='logout';">로그아웃</button>
		</c:when> 
		<c:otherwise>
			<a href="/login">로그인</a>
			<a href="/signUp">회원가입</a>
		</c:otherwise>
	</c:choose>
</body>
</html> 