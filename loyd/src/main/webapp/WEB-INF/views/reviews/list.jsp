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
	<table width="500" align="center" border="1">
			<tr>
				<td>구매한 상품</td>
				<td>내용</td>
				<td>작성일</td>
			</tr>
			
 		<c:forEach items="${reviews}" var="review">
			<tr>
				<td>watch_id</td>
				<td>${review.content}</td>
				<td>${review.writeday }</td>
			</tr>		
		</c:forEach> 
			<tr>
				<td colspan="3"><a href="write">리뷰 작성하기</a></td>	
			</tr>
	
	
	
	</table>

</body>
</html>