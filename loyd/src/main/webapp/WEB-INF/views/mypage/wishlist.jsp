<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage - wishlist</title>
</head>
<body>

<c:if test="${email == null }">

	로그인을 하시오.
	<!-- 로그인 페이지로 이동하기 -->

</c:if>

<c:if test="${email != null }">
	
	내 찜 목록
	<table>
	
		<tr>
			
			<th> 번호</th>
			<th> 물건</th>
			<th> 갯수</th>
			
		</tr>
	
		<c:forEach items="${wishlist }" var="wish">
		
			<tr>
			
				<td> ${wish.id }</td>
				<td> ${wish.name }</td>
				<td> ${wish.count }</td>
				
			</tr>
			
		</c:forEach>
		
		<tr>
		
			<td colspan="4">
				<a href=""> 더 쇼핑하기</a>
			</td>
			<!--쇼핑 페이지로 이동하기 -->
		</tr>
	
	</table>

</c:if>
</body>
</html>