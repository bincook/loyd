<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#main {
	padding-left:150px;
	padding-right:150px;
}


</style>


</head>
<body>
<div class="jumbotron">
	<h1> Admin </h1>
	<p> 주문 상세내역 관리</p>
</div>
<div id="main">
	<table class="table table-striped"  width="1000"border="1" align="center" >
		<tr>
			<th >주문자 이름 </th>
		        
			<th >이메일 주소</th>
			<th >주문자<p> 전화번호</th>
			<th >받는사람 이름</th>
			<th >받는사람<p> 전화번호</th>
			<th >우편번호</th>
			<th >주소</th>
			<th >상세주소</th>
			<th >지불방법</th>
			<th >요청사항</th>
			<th >주문일</th>
			
		</tr>
		<c:forEach items="${order_detail }" var="order">
			<tr>			
				<td> ${order.order_name }</td>
				<td> ${order.email }</td>
				<td> ${order.order_phone }</td>
				<td> ${order.rec_name }</td>
				<td> ${order.rec_phone }</td>
				<td> ${order.zip }</td>
				<td> ${order.addr1 }</td>
				<td> ${order.addr2 }</td>
				<td> ${order.pay }</td>
				<td> ${order.msg }</td>
				<td> ${order.order_date }</td>
				
			</tr>
		</c:forEach>
		
		
	</table>


</div>






</body>
</html>









