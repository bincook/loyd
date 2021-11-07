<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Mypage - OrderDetail</title>
	
<style>

h1 {
	font-size: 36px;
	font-weight: bold;
	font-family: ;
	text-spacing: -0.1em;
}

a,
a:hover {
	color: #000;
}

#container {
	width: 1100px;
	margin: auto;
	padding: 0;
}

#container #Odetail-form {
	padding: 20px;
}

#Odetail-form #Odetail-main-title {
	
}

#Odetail-form #Odetail-order-content,
#Odetail-form #Odetail-item-content,
#Odetail-form #Odetail-receive-content {
	padding: 40px 4px; 
}

#Odetail-form #Odetail-order-content #Odetail-order-header,
#Odetail-form #Odetail-item-content #Odetail-item-header,
#Odetail-form #Odetail-receive-content #Odetail-receive-header {
	display: flex;
	flex-direction: row;
	border: 1px solid #eee;
}

#Odetail-form #Odetail-item-content #Odetail-item-header {
	border: none;
}

#Odetail-order-header #Odetail-order-name,
#Odetail-order-header #Odetail-order-email,
#Odetail-order-header #Odetail-order-phone,
#Odetail-order-header #Odetail-order-pay,
#Odetail-receive-header #Odetail-receive-name,
#Odetail-receive-header #Odetail-receive-phone,
#Odetail-receive-header #Odetail-receive-addr1,
#Odetail-receive-header #Odetail-receive-addr2{
	width: 15%;
	background: #ccc;
	padding: 12px 20px; 
	color: #000;
	font-weight: bold;
}

#Odetail-receive-header #Odetail-receive-zip,
#Odetail-receive-header #Odetail-receive-msg {
	width: 15%;
	background: #ccc;
	padding: 12px 20px; 
	color: #000;
	font-weight: bold;
}


#Odetail-order-header #Odetail-order-name-form,
#Odetail-order-header #Odetail-order-email-form,
#Odetail-order-header #Odetail-order-phone-form,
#Odetail-order-header #Odetail-order-pay-form,
#Odetail-receive-header #Odetail-receive-name-form,
#Odetail-receive-header #Odetail-receive-phone-form,
#Odetail-receive-header #Odetail-receive-addr1-form,
#Odetail-receive-header #Odetail-receive-addr2-form{
	width: 35%;
	padding: 12px 20px; 
}

#Odetail-receive-header #Odetail-receive-zip-form,
#Odetail-receive-header #Odetail-receive-msg-form {
	width: 70%;
	padding: 12px 20px;
}

#Odetail-item-header #Odetail-item-picture {
	padding: 5px 20px;
}

#Odetail-item-header #Odetail-item-name {
	padding-top: 15px;
}

</style>
</head>
<body>

<div id="container">
	<div id="Odetail-form">
		<div id="Odetail-main-title">
			<h1> 주문 상세내역</h1>
		</div>
		
		<div id="Odetail-order-content">
			<div id="Odetail-order-header">
				<div id="Odetail-order-name"> 주문자 이름</div>
				<div id="Odetail-order-name-form"> ${order_detail.order_name }</div>
			
				<div id="Odetail-order-email"> 주문자 이메일</div>
				<div id="Odetail-order-email-form"> ${order_detail.email }</div>
			</div>
			
			<div id="Odetail-order-header">
				<div id="Odetail-order-phone"> 주문자 전화번호</div>
				<div id="Odetail-order-phone-form"> ${order_detail.order_phone }</div>
			
				<div id="Odetail-order-pay"> 결제 방식</div>
				<div id="Odetail-order-pay-form"> ${order_detail.pay }</div>
			</div>
		</div>
		
		<div id="Odetail-item-content">
			<c:forEach items="${order_d }" var="order">
				<div id="Odetail-item-header">
					<div id="Odetail-item-picture"> 
						<img src="${order.picture }" height="50px">
					</div>
					
					<div id="Odetail-item-name"> 
						<a href="item_detail?id=${order.id }"> ${order.name }</a>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div id="Odetail-receive-content">
			<div id="Odetail-receive-header">
				<div id="Odetail-receive-name"> 수령인 이름</div>
				<div id="Odetail-receive-name-form"> ${order_detail.rec_name }</div>
			
				<div id="Odetail-receive-phone"> 수령인 번호</div>
				<div id="Odetail-receive-phone-form"> ${order_detail.rec_phone }</div>
			</div>
			
			<div id="Odetail-receive-header">
				<div id="Odetail-receive-zip"> 수령인 우편번호</div>
				<div id="Odetail-receive-zip-form"> ${order_detail.zip }</div>
			</div>
			
			<div id="Odetail-receive-header">
				<div id="Odetail-receive-addr1"> 수령인 주소 1</div>
				<div id="Odetail-receive-addr1-form"> ${order_detail.addr1 }</div>
			
				<div id="Odetail-receive-addr2"> 수령인 주소 2</div>
				<div id="Odetail-receive-addr2-form"> ${order_detail.addr2 }</div>
			</div>
			
			<div id="Odetail-receive-header">
				<div id="Odetail-receive-msg"> 메모</div>
				<div id="Odetail-receive-msg-form"> ${order_detail.msg }</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>