<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
table {
	
}

tr:nth-child(3), 
tr:nth-child(3) td, 
tr:nth-child(4), 
tr:nth-child(4) td {
	border: 1px solid; 
}

#gallery {
	position: relative;
}

#gallery #product_discount {
	position: absolute;
	text-align: center;
	color: yellow;
	font-size: 40px;
	line-height: 100px;
	top: 10px;
	right: 10px;
	width: 200px;
	height: 100px;
	background: red;
}

#gallery #product_discount:after {
	content: "";
	position: absolute;
	right: 0;
	bottom: 0;
	width: 0;
	height: 0;
	border-bottom : 13px solid #eeeeee;
	border-left : 95px solid transparent;
	border-right : 95px solid transparent;
}
</style>

</head>
<body>

	<table align="center">
	
		<tr>
			<td colspan="4">
				<div id="gallery">
					<div id="product_discount">
						<span> - ${list.discount *100} %</span>
					</div>
					<img src="${list.picture }">
				</div>
			</td>
		</tr>
		
		<tr>
			<td> <strong> 상품명</strong></td>
			<td colspan="3">${list.name }</td>
		</tr>
		
		<tr>
			<td width="15%"> <strong> 가격</strong></td>
			
			<td width="35%"> 
				<fmt:formatNumber value="${list.price }" pattern="#,###" />원
			</td>
			<td width="15%"> <strong> 할인률</strong></td>
			<td width="35%"> ${list.discount *100} %</td>
		</tr>
		
		<tr>
			<td width="15%"> <strong> 브랜드</strong></td>
			<td width="35%"> ${list.brand }</td>
			<td width="15%"> <strong> 종류</strong></td>
			<td width="35%"> ${list.kind }</td>
		</tr>
		
		<tr>
			<td colspan="4"> <strong> 상세설명</strong></td>
		</tr>
		
		<tr>
			<td colspan="4"> ${list.content } </td>
		</tr>
	
	</table>

</body>
</html>