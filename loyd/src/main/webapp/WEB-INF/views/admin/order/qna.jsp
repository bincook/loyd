<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#main {
	padding-top:50px;
	padding-left:150px;
	padding-right:150px;
	margin-bottom:150px;
}


</style>

</head>
<body>


<div class="jumbotron">
	<h1> 1:1 메일 발송하기 </h1>
	<p> 고객이 등록한 메일로 발송됩니다.</p>
</div>
<div id="main">
	<form name="submit" method="post" action="">
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
			<tr>
	
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
			
			<tr>
				<td>전송할 내용</td>
				<td colspan="10"><textarea name="" rows="10" cols="100" placeholder="내용을 작성하여 주세요"></textarea></td>
	
			
			
		</table>
		
	    <div align="center">
	          <a class="btn btn-primary" href="javascript:document.writeForm.submit()">
	 			전송하기
	          </a>
	          <a class="btn btn-outline-primary" href="javascript:history.back()">
	           	뒤로가기
	          </a>
	   </div>
	</form>
</div>
</body>
</html>










