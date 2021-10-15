<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		메인페이지
		
		<c:if test="${email==null }">
			<a href="login"> 로그인 </a>  
		</c:if>
		
		<c:if test="${email != null }">
			${name }님 환영합니다.
			<p><a href="logout">로그아웃</a>
		</c:if>
</body>
</html>