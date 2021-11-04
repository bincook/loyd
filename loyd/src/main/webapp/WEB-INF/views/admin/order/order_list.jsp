<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역 목록</title>
<style>
#main {
	padding-top:50px;
	padding-left:150px;
	padding-right:150px;
}


</style>


</head>
<body>
<div class="jumbotron">
    <h1> Admin </h1>
    <p> 주문목록 관리</p>
</div>
<div id="main">
	<table class="table table-striped" width="700"border="1" align="center" >
		<tr>
			<th>주문자 </th>
			<th>주문날짜</th>
			<th>주문한 시계</th>
			<th>주문 수량</th>
			<th>총 가격</th>
			<th>할인률</th>
			<th>주문 상세내역 보기</th>
			<th >1:1 메일 발송하기</th>
		</tr>
		<c:forEach items="${order }" var="order">
			<tr>			
				<td> ${order.member_id }</td>
				<td> ${order.orderday }</td>
				<td> ${order.watch_id }</td>
				<td> ${order.count }</td>
				<td> ${order.price }</td>
				<td> ${order.discount }</td>
				<td><a href="order_detail?id="+id>상세 내역</a></td>
				<td><a href="qna">메일 발송</a></td>
			</tr>
		</c:forEach>
		
		
	</table>


</div>






</body>
</html>








