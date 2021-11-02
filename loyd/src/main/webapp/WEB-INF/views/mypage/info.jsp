<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>마이 페이지</title>
    
<style>


#left-side_menu {
	border: 1px solid;
	position: relative;
	top: 0;
	left: 10px;
	width: 250px;
	float: left;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

ul:nth-child(3),
ul:nth-child(4),
ul:nth-child(5) {
	margin: 10px;
	padding-left: 40px;
}

#mypage-menu li {
	width: 250px;
	height: 130px;
	text-align: center;
	line-height: 130px;
	background: green;
	color: white;
	font-size: 26px;r
}

#mypage-userinfo li {
	width: 250px;
	height: 80px;
	text-align: center;
	background: blue;
	color: white;
	font-size: 20px;
}

#mypage-info {
	margin: auto;
	border: 1px solid;
	width: 880px;
	float: none;
}

.menu-title {
	font-weight: bold;
	font-size: 18px;
}
</style>
</head>
<body>
<h1> 마이 페이지 </h1>

<c:if test="${email == null }">

	로그인하시오
	<!-- 로그인 페이지로 이동하기 -->
	
</c:if>

<c:if test="${email != null }">
	
		<div id="left-side_menu">
		
			<ul id="mypage-menu">
				
				<li> 나의 쇼핑내역(다른 페이지에서 mypage/info로 이동하기)</li>
			
			</ul>
			
			<ul id="mypage-userinfo">
				
				<li> ${email } <br>
				 회원정보 수정(작성 만함)</li>
				
			</ul>
			
			<ul id="mypage-shopping">
				
				<li class="menu-title"> 나의 쇼핑 내역</li>
				<li>
					<a href="order_list?email=${email }"> 주문내역</a><br>
				</li>
				
			</ul>
			
			<ul id="mypage-history">
			
				<li class="menu-title"> 내 활동 내역</li>
				<li>
					<a href="enquiry?email=${email }"> 상품문의</a>
				</li>
				<li>
					<a href="wishlist?email=${email }"> 내 찜</a>
				</li>
			
			</ul>
			
			<ul id="mypage-caution">
				
				<li class="menu-title"> 주의사항</li>
				<li>
					<a href="watch-care"> 취급시 주의사항</a>
				</li>
				
			</ul>
			
		</div>
		
		<div id="mypage-info">
			
			활동 남기기
		
		</div>
	
</c:if>

</body>
</html>

