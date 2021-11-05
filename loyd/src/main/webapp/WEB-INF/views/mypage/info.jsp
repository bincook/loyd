<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>마이 페이지</title>
    
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
	margin: 40px 0 0 0;
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

#right-content #member-info {
	padding-bottom: 20px;
}

#right-content #member-info #member-info-modify {
	margin-bottom: 8px;
}

#right-content #content-summary-order #order-list-title {
	font-size: 24px;
    padding-bottom: 16px;
    color: #000;
}

#right-content #content-summary-order #order-list-header {
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

#right-content #content-summary-order #order-view-header{
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 14px;
}

#right-content #content-summary-order #order-list-header #order-col-date{width: 16.6%;}
#right-content #content-summary-order #order-list-header #order-col-numb{width: 16.6%;}
#right-content #content-summary-order #order-list-header #order-col-orde{width: 16.6%;}
#right-content #content-summary-order #order-list-header #order-col-reci{width: 16.6%;}
#right-content #content-summary-order #order-list-header #order-col-pay{width: 16.6%;}
#right-content #content-summary-order #order-list-header #order-col-empty{width: 16.6%;}
#right-content #content-summary-order #order-view-header #order-view-date{width: 16.6%;}
#right-content #content-summary-order #order-view-header #order-view-numb{width: 16.6%;}
#right-content #content-summary-order #order-view-header #order-view-orde{width: 16.6%;}
#right-content #content-summary-order #order-view-header #order-view-reci{width: 16.6%;}
#right-content #content-summary-order #order-view-header #order-view-pay{width: 16.6%;}
#right-content #content-summary-order #order-view-header #order-view-more{width: 16.6%;}


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
						<span> My page</span>
				</div>
				
				<!-- 메뉴 리스트 -->
				<ul id="mypage-list">
				
					<li class="menu-title"> 
						<span> 나의 쇼핑 정보</span>
						
						<!-- 주문정보 -->
						<ul id="mypage-order-list">
							<li> 
								<a href="order_list"> 주문 조회</a>
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
								<a href="enquiry"> 상품문의</a>
							</li>
							
							<li>
								<a href="wishlist"> 내 찜</a>
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
				
			<div id="member-info">
				<div id="member-info-modify">
					<a href="member_edit?email=${email }"> 내 정보 관리 ></a>
				</div>
				<%-- <div id="member-join-date"> 가입일 ${order_pay } </div> --%>
				<div id="member-id">
					<h1> ${name } 회원님</h1>
				</div>
			</div>
			
			<div id="content-summary-order">
				<div id="order-list">
					<div id="order-list-title"> 주문 조회</div>
					<div id="order-list-itembox">
						<div id="order-list-header">
							<div id="order-col-date"> 주문일자</div>
							<div id="order-col-numb"> 주문번호</div>
							<div id="order-col-orde"> 주문자</div>
							<div id="order-col-reci"> 수령인</div>
							<div id="order-col-pay"> 결제방식</div>
							<div id="order-col-empty"> &nbsp;</div>
							
						</div>
						<!-- 물건 보이기(반복 -->
						<c:forEach items="${order_pay }" var="order">
							<div id="order-view-header">
								<div id="order-view-date"> ${order.order_date }</div>
								<div id="order-view-numb"> ${order.order_no }</div>
								<div id="order-view-orde"> ${order.order_name }</div>
								<div id="order-view-reci"> ${order.rec_name }</div>
								<div id="order-view-pay"> ${order.pay }</div>
								<div id="order-view-more"> 
									<a href="order_detail?order_no=${order.order_no }"">자세히</a>
								</div>
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

