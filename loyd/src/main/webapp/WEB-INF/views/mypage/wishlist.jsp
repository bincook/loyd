<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Mypage - wishlist</title>
	
<style>
#container {
	position: relative;
	margin: auto;
	padding: 72px 60px 0;
	width: 1560px;
    overflow: hidden;
    background-color: #ffffff;
}

div {
	box-sizing: bwishlist-box;
    margin: 0;
    padding: 0;
    bwishlist: 0;
    font-family: "SpoqaHanSans";
    font-size: 100%;
    vertical-align: baseline;
}

h1 {
	font-size: 36px;
	font-family: "SpoqaHanSans";
	font-weight: 900;
	color: #000;
}

ul,
li {
	list-style: none;
}

a {
    text-decoration: none;
    color: #222;
}

#left-side_menu {
    position: absolute;
    width: 310px;
    height: 100%;
    top: 0;
    z-index: 1;
}

#left-side_menu #left-dev-menu {
	padding: 30px 35px 0 30px;
}

#left-side_menu #left-dev-menu #mypage-subtitle {
	display: inline-block;
    font-family: "Cormorant Garamond";
    font-size: 28px;
    font-weight: 600;
    line-height: normal;
    color: #000;
}

#left-side_menu #left-dev-menu #mypage-list {
	overflow-y: hidden;
	margin: 40px 0;
	padding: 0;
}

#left-side_menu #left-dev-menu .menu-title {
	margin-top: 0px;
    padding: 10px 0 10px 0;
}

#left-side_menu #left-dev-menu #mypage-list span {
	font-family: "Montserrat";
    font-size: 16px;
    font-weight: 900;
    color: #000;
}

#left-side_menu #left-dev-menu .menu-title #mypage-wishlist-list,
#left-side_menu #left-dev-menu .menu-title #mypage-history,
#left-side_menu #left-dev-menu .menu-title #mypage-caution {
	margin: 6px 0 0;
	padding: 0;
}

#left-side_menu #left-dev-menu .menu-title #mypage-wishlist-list a,
#left-side_menu #left-dev-menu .menu-title #mypage-history a,
#left-side_menu #left-dev-menu .menu-title #mypage-caution a {
	font-family: "Montserrat";
    font-size: 14px;
    font-weight: normal;
    letter-spacing: normal;
    color: #7a7a7a;
}



#right-content {
	position: relative;
    float: right;
    min-height: calc(100vh - 315px);
    width: calc(100% - 310px);
    padding-bottom: 200px;
}

#right-content #content-wishlist{
	margin-top: 100px;
}

#right-content #content-wishlist #wishlist-title{
	font-size: 24px;
    padding-bottom: 16px;
    color: #000000;
}

#right-content #content-wishlist #wishlist-itembox #wishlist-header {
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-top: 2px solid #000000;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: #000;
}

#right-content #content-wishlist #wishlist-itembox #wishlist-view-header {
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 14px;
}

#right-content #content-wishlist #wishlist-itembox #wishlist-view-item {
	text-align: start;
}

#right-content #content-wishlist #wishlist-itembox #wishlist-col-numb {width: 10%;line-height: auto;}
#right-content #content-wishlist #wishlist-itembox #wishlist-col-item {width: 50%}
#right-content #content-wishlist #wishlist-itembox #wishlist-col-pric {width: 20%;line-height: auto;}
#right-content #content-wishlist #wishlist-itembox #wishlist-col-date {width: 20%;line-height: auto;}
#right-content #content-wishlist #wishlist-itembox #wishlist-view-numb {width: 10%;line-height: auto;}
#right-content #content-wishlist #wishlist-itembox #wishlist-view-item {width: 50%}
#right-content #content-wishlist #wishlist-itembox #wishlist-view-pric {width: 20%;line-height: auto;}
#right-content #content-wishlist #wishlist-itembox #wishlist-view-date {width: 20%;line-height: auto;}

#right-content #paging {
	margin: auto;
	padding-top: 30px;
	text-align: center;
}
</style>

</head>
<body>

<c:if test="${email == null }">

	로그인을 하시오.
	<!-- 로그인 페이지로 이동하기 -->

</c:if>

<c:if test="${email != null }">
	<!-- 본체 큰 틀 -->
	<div id="container">
		<!-- 왼쪽 큰틀 -->
		<div id="left-side_menu" style="margin-left: 0px;">
			<!-- 왼쪽 자리 잡기 (padding margin) -->
			<div id="left-dev-menu">
				<!-- 이름 -->
				<div id="mypage-subtitle">
						<span> My page</span>
				</div>
				
				<!-- 메뉴 리스트 -->
				<ul id="mypage-list">
				
					<li class="menu-title"> 
						<span> 나의 쇼핑 정보</span>
						
						<!-- 주문정보 -->
						<ul id="mypage-wishlist-list">
							<li> 
								<a href="order_list?email=${email }"> 주문 조회</a>
							</li>
						</ul>
					</li>
	
					<li class="menu-title">
						<span> 내 활동 내역</span>
						
						<!-- 활동 내역 -->
						<ul id="mypage-history">
						
							<li>
								<a href="enquiry?email=${email }"> 상품문의</a>
							</li>
							
							<li>
								<a href="wishlist?email=${email }"> 내 찜</a>
							</li>
						</ul>
					</li>
					
					<li class="menu-title">
						<span> 주의사항</span>
						
						<ul id="mypage-caution">
							<li>
								<a href="watch-care"> 취급시 주의사항</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 본문 -->
		<div id="right-content">
			<div id="content-wishlist">
				<div id="wishlist">
					<div id="wishlist-title"> 
						<h1>나의 찜 목록</h1>
					</div>
					
					<div id="wishlist-itembox">
						<div id="wishlist-header">
							<div id="wishlist-col-numb"> 주문번호</div>
							<div id="wishlist-col-item"> 상품명</div>
							<div id="wishlist-col-pric"> 가격(수량)</div>
							<div id="wishlist-col-date"> 날짜</div>
						</div>
						
						<c:forEach items="${wishlist }" var="wish">
						
							<div id="wishlist-view-header">
								<div id="wishlist-view-numb"> ${wish.id }</div>
								<div id="wishlist-view-item"> 
									<img src="${wish.picture }" height="40px"> ${wish.name }</div>
								<div id="wishlist-view-pric"> 
									<fmt:formatNumber value="${wish.price }" pattern="#,###" />원 (${wish.count })
								</div>
								<div id="wishlist-view-date"> ${wish.datetime }</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

</c:if>
</body>
</html>