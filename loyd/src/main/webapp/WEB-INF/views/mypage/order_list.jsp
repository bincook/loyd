<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage-Orderlist</title>
<script>

</script>

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
	box-sizing: border-box;
    margin: 0;
    padding: 0;
    border: 0;
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

a:hover {
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

#left-side_menu #left-dev-menu .menu-title #mypage-order-list,
#left-side_menu #left-dev-menu .menu-title #mypage-history,
#left-side_menu #left-dev-menu .menu-title #mypage-caution {
	margin: 6px 0 0;
	padding: 0;
}

#left-side_menu #left-dev-menu .menu-title #mypage-order-list a,
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

#right-content #content-order-list{
	margin-top: 100px;
}

#right-content #content-order-list #order-list-title{
	font-size: 24px;
    padding-bottom: 16px;
    color: #000000;
}

#right-content #content-order-list #order-list-itembox #order-list-header {
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

#right-content #content-order-list #order-list-itembox #order-view-header {
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 14px;
}

#right-content #content-order-list #order-list-itembox #order-view-item {
	text-align: start;
}

#right-content #content-order-list #order-list-itembox #order-col-numb {width: 8%;}
#right-content #content-order-list #order-list-itembox #order-col-item {width: 50%}
#right-content #content-order-list #order-list-itembox #order-col-pric {width: 20%;}
#right-content #content-order-list #order-list-itembox #order-col-date {width: 20%;}
#right-content #content-order-list #order-list-itembox #order-col-enquiry {width: 12%;}
#right-content #content-order-list #order-list-itembox #order-view-numb {width: 8%;padding-top: 13px;}
#right-content #content-order-list #order-list-itembox #order-view-item {width: 50%}
#right-content #content-order-list #order-list-itembox #order-view-pric {width: 20%;padding-top: 13px;}
#right-content #content-order-list #order-list-itembox #order-view-date {width: 20%;padding-top: 13px;}
#right-content #content-order-list #order-list-itembox #order-view-enquiry {width: 12%;padding-top: 13px;}

#right-content #paging {
	margin: auto;
	padding-top: 30px;
	text-align: center;
}
</style>
</head>
<body>
<c:if test="${email == null }">

	로그인하시오
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
						<span> <a href="info"> My page</a></span>
				</div>
				
				<!-- 메뉴 리스트 -->
				<ul id="mypage-list">
				
					<li class="	menu-title"> 
						<span> 나의 쇼핑 정보</span>
						
						<!-- 주문정보 -->
						<ul id="mypage-order-list">
							<li> 
								<a href="order_list?email=${email }"> 주문 조회</a>
							</li>
							
							<li> 
								<a href="../cart/list?id=${id }"> 장바구니</a>
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

			<!-- 회원 정보 (이름 등) -->	
				
			<div id="content-order-search">
			
				<div id="content-order-search-title">
					<h1> 주문 내역 조회</h1>
				</div>
				
				<div id="content-order-search-col">
				 <!-- 색인란  -->
					<form name="pkc" method="post" action="order_list" onsubmit="search()">					
					 	<input type="hidden" name="email" value="${email }">
						<select name="field">
							<option value="wt.name"> 상품명</option>
							<option value="ol.id"> 주문번호 </option>
						</select>
						
						<input type="text" name="word" value="${word }">
						
						<button type="submit"> 검색</button>
				
					</form>
				</div>
			</div>
			
		
			<div id="content-order-list">
				<div id="order-list">
					<div id="order-list-title"> 주문 상세내역</div>
					<div id="order-list-itembox">
						<div id="order-list-header">
							<div id="order-col-numb"> 주문번호</div>
							<div id="order-col-item"> 상품명</div>
							<div id="order-col-pric"> 총 가격(수량)</div>
							<div id="order-col-date"> 날짜</div>
							<div id="order-col-enquiry"> &nbsp;</div>
						</div>
						
						<c:forEach items="${list }" var="mydto">
						
							<div id="order-view-header">
								<div id="order-view-numb"> ${mydto.id }</div>
								<div id="order-view-item"> <img height="50px" src="${mydto.picture }"><a href="order_detail?id=${mydto.watch_id }">${mydto.name }</a></div>
								<div id="order-view-pric"> 
									<fmt:formatNumber value="${mydto.price *mydto.count *(1 -mydto.discount) }" pattern="#,###" />원 (${mydto.count })
								</div>
								<div id="order-view-date"> ${mydto.orderday }</div>
								<div id="order-view-enquiry"> 
									<a href=""> 문의내역</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<div id="paging">

				<c:if test="${pstart != 1}">
					<a href="order_list?email=${email }&page=${pstart-1}"> << </a>
				</c:if>
				<c:if test="${pstart == 1}"> 
					<<
				</c:if>
				
				<!-- 현재페이지 이전 1페이지 이동 -->
				<c:if test="${page != 1}"> 
					<a href="order_list?email=${email }&page=${page-1}"> < </a>
				</c:if>
				<c:if test="${page == 1}"> 
					<
				</c:if>
				
				<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
				<c:forEach begin="${pstart}" end="${pend}" var="i">
				
				<!-- 현재페이지 색은 다르게 => 빨강 -->
					<c:if test="${page != i}"> 
						<a href="order_list?email=${email }&page=${i}"> ${i} </a>
					</c:if>
					<c:if test="${page == i}"> 
						<a href="order_list?email=${email }&page=${i}" style="color:red"> ${i} </a>
					</c:if>
					
				</c:forEach>

				<!-- 현재페이지 기준 다음1페이지 이동 -->
				<c:if test="${page != page_cnt}"> 
					<a href="order_list?email=${email }&page=${page+1}"> > </a>
				</c:if>
				<c:if test="${page == page_cnt}"> 
					>
				</c:if>
				
				<c:if test="${page_cnt != pend}"> 
					<a href="order_list?email=${email }&page=${pend+1}"> >> </a>
				</c:if>
				<c:if test="${page_cnt == pend}"> 
					>>
				</c:if>
			</div>
		</div>
	</div>
</c:if>
</body>
</html>