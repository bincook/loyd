<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage - Enquiry</title>
</head>
<body>


<c:if test="${email == null }">

	로그인을 하시오.
	<!-- 로그인 페이지로 이동하기 -->

</c:if>

<c:if test="${email != null }">
	
	내 문의내역
	<table>
	
		<tr>
			
			<th> 번호</th>
			<th> 제목</th>
			<th> 내용</th>
			<th> 용건</th>
			
		</tr>
	
		<c:forEach items="${enquiry }" var="list">
		
			<tr>
				<td> ${list.id }</td>
				<td> ${list.title }</td>
				<td> ${list.content }</td>
				<td> ${list.qnatype }</td>
			</tr>
			
		</c:forEach>
		
		<tr>
		
			<td colspan="4">
				<a href=""> 문의글 작성하러가기</a>
			</td>
			<!-- qna로 가는 페이지로 작성하기 -->
		</tr>
	
	</table>
	
</c:if>



</body>
</html>