<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<table>
	
		<tr>
			<td colspan="4">
				<img src="${list.picture }">
			</td>
		</tr>
		
		<tr>
			<td> 상품명</td>
			<td colspan="3">${list.name }</td>
		</tr>
		
		<tr>
			<td> 가격</td>
			<td> ${list.price }</td>
			<td> 할인률</td>
			<td> ${list.discount }</td>
		</tr>
		
		<tr>
			<td> 브랜드</td>
			<td> ${list.brand }</td>
			<td> 종류</td>
			<td> ${list.kind }</td>
		</tr>
		
		<tr>
			<td colspan="4"> 상세설명</td>
		</tr>
		
		<tr>
			<td colspan="4"> ${list.content } </td>
		</tr>
	
	</table>

</body>
</html>