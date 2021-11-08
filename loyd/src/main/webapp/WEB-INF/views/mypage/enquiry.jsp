<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Mypage - Enquiry</title>

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

#left-side_menu #left-dev-menu .menu-title #mypage-enquiry,
#left-side_menu #left-dev-menu .menu-title #mypage-history,
#left-side_menu #left-dev-menu .menu-title #mypage-caution {
	margin: 6px 0 0;
	padding: 0;
}

#left-side_menu #left-dev-menu .menu-title #mypage-enquiry a,
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

#right-content #content-enquiry{
	margin-top: 100px;
}

#right-content #content-enquiry #enquiry-title{
	font-size: 24px;
    padding-bottom: 16px;
    color: #000000;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-header {
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

#right-content #content-enquiry #enquiry-itembox #enquiry-view-header {
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 14px;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-view-titl,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-cont {
	text-align: start;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-col-numb,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-numb {width: 10%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-type,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-type {width: 15%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-titl,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-titl {width: 50%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-date,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-date {width: 15%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-resu,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-resu {width: 10%;}

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
				
					<li class="menu-title"> 
						<span> 나의 쇼핑 정보</span>
						
						<!-- 주문정보 -->
						<ul id="mypage-enquiry">
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
		<div id="right-content">
			<div id="content-enquiry">
				<div id="enquiry">
					<div id="enquiry-title"> 
						<h1> 나의 문의</h1>
					</div>
					<div id="enquiry-itembox">
						<div id="enquiry-header">
							<div id="enquiry-col-numb"> No.</div>
							<div id="enquiry-col-type"> 유형</div>
							<div id="enquiry-col-titl"> 제목</div>
							<div id="enquiry-col-date"> 등록일</div>
							<div id="enquiry-col-resu"> 처리결과</div>
						</div>
						
						<c:forEach items="${enquiry }" var="enquiry">
						
							<div id="enquiry-view-header">
								<div id="enquiry-view-numb"> ${enquiry.id }</div>
								<div id="enquiry-view-type"> ${enquiry.qnatype }</div>
								<div id="enquiry-view-titl"> 
									<a href="enquiry_detail?qna_id=${enquiry.id }">${enquiry.title }</a>
								</div>
								<div id="enquiry-view-date"> ${enquiry.writeday }
									<%-- <fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${enquiry.writeday }"/>  --%>
								</div>
								<div id="enquiry-view-resu"> </div>
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