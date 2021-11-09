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
#container {
	margin: auto;
	width: 880px;
}

#container #table-margin {
	padding: 100px 0 ;
}

#gallery {
	position: relative;
	text-align: center;
	padding-bottom: 50px;
	border: 1px solid #eee;
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

#product-info #product-header {
	display: flex;
	flex-direction: row;
	border: 1px solid #eee;
}

#product-info #product-header #product-header2 {
	display: flex;
	flex-direction: row;
}

#product-header #product-name,
#product-header #product-content {
	width: 180px;
	background: #ccc;
	padding: 12px 20px; 
	color: #000;
	font-weight: bold;
}

#product-header2 #product-price,
#product-header2 #product-discount,
#product-header2 #product-brand,
#product-header2 #product-kind {
	width: 180px;
	background: #ccc;
	padding: 12px 20px; 
	color: #000;
	font-weight: bold;
}

#product-header #product-name-form,
#product-header #product-content-form {
	padding: 12px 20px;
}

#product-header2 #product-price-form,
#product-header2 #product-discount-form,
#product-header2 #product-brand-form,
#product-header2 #product-kind-form {
	width: 260px;
	padding: 12px 20px;
}

.btn-primary {
	border: transparent;
	background: #133c2b;
}

#histort-back {
	padding-top: 20px;
	text-align: center;
}
</style>
<script>

function history() {
	
	window.history.back()
}
</script>
</head>
<body>

<div id="container">
	<div id="table-margin">
		<div id="gallery">
			<div id="product_discount">
				<span> - ${list.discount *100} %</span>
			</div>
			<img src="${list.picture }" height="300px">
		</div>
		
		<div id="product-info">
			<div id="product-header">
				<div id="product-name"> 상품명</div>
				<div id="product-name-form"> ${list.name }</div>
			</div>
			
			<div id="product-header">
				<div id="product-header2">
					<div id="product-price"> 가격</div>
					<div id="product-price-form"> ${list.price }</div>
					
					<div id="product-discount"> 할인률</div>
					<div id="product-discount-form"> ${list.discount }</div>
				</div>
			</div>
			
			<div id="product-header">
				<div id="product-header2">
					<div id="product-brand"> 브랜드</div>
					<div id="product-brand-form"> ${list.brand }</div>
				
					<div id="product-kind"> 종류</div>
					<div id="product-kind-form"> ${list.kind }</div>
				</div>
			</div>
			
			<div id="product-header">
				<div id="product-content"> 상세설명 </div>
				<div id="product-content-form"> ${list.content }</div>
			</div>
		</div>
		
		<div id="historyback">
			<a class="btn btn-primary" href="javascript:window.history.back()"> 뒤로가기</a>
			<a class="btn btn-primary" href="../reviews/list"> 리뷰보러가기</a>
			<a class="btn btn-primary" href="../reviews/write?watch_id=${list.id }&watch_name=${list.name}">리뷰 작성하기</a>
		</div>	

	</div>
</div>

</body>
</html>