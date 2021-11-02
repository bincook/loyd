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
function search(){
	
	var word = document.pkc.field.value == 'empty'
	if(word) {
		alert('검색할 필드를 선택해주세요')
	}
}


</script>



<style>
table {
	border: 1px solid;
}

th {
	text-align: center;
}

td {
	text-overflow: ellipsis;
}

form {
	align: center;
}
</style>
</head>
<body>
	
	<!-- 아직 회원만 볼 수 있는 조건을 달지 않음 -->
	<%-- 
	<c:if test="로그인정보가 없는 경우">
		로그인페이지로 이동하기
		(java) response.sendRedirect(로그인 주소);
		javascript:function(로그인 주소);
		
	</c:if>
	
	session 정보로 입력이 된 경우
	로그인 정보를 읽어내서 로그인 했음을 알리는 경우
	
	--%>
	<c:if test="${email == null }">
		로그인하세요.
	</c:if>
	
	<c:if test="${email != null }">
	
	
	<!-- 회원 본인만 볼 수 있도록하는 페이지 -->
	
		 <form name="pkc" method="post" action="order_list" onsubmit="search()">
		 	<input type="hidden" value="${email }">
			<select name="field">
				<option value="empty"> 선택</option>
				<option value="wt.name"> 상품명</option>
				<option value="ol.id"> 주문번호 </option>
				<option value="ol.orderday"> 주문날짜 </option>
			</select>
			
			<input type="text" name="word" value="${word }">
			
			<button type="submit"> 검색</button>
		
		</form>
	 
	<table width="1100px" align="center">
	
		<tr>
			<th width="10%"> 주문번호</th>
			<th> 상품명</th>
			<th width="15%"> 총 가격 (수량)</th>
			<th width="15%"> 날짜</th>
			<th> &nbsp;</th>
		</tr>
		
		<!-- 상품명 클릭할 경우 상품정보 조회 가능 토록 만들기 -->
		<c:forEach items="${list }" var="mydto">

		<tr>
			<td align="center"> ${mydto.id }</td>	
			<!-- 상품명이 길 경우 ... 으로 변경해주기 -->
			<td height="50px"> <img height="50px" src="${mydto.picture }"><a href="order_detail?id=${mydto.watch_id }">${mydto.name }</a></td>
			<!-- 소수점 정수로 변환 해주기 -->
			<!-- 계산식 변경 있을 경우 바꿔주기 -->
			<td align="center">
				<fmt:formatNumber value="${mydto.price *mydto.count *(1 -mydto.discount) }" pattern="#,###" />원
				(${mydto.count })
			</td>
			<td align="center"> ${mydto.orderday }</td>
			<!-- 마이페이지-문의 내역 페이지로 이동하기 (email, watch_id 필요) -->
			<td align="center">
				<a href=""> 문의내역</a>
				<!-- enquiry?email=${email }&watch_id=${mydto.watch_id } -->
			</td>
		</tr>
		
		</c:forEach>
		
		<tr align="center">
			<td colspan="5">
			
				<c:if test="${pstart != 1}">
					<a href="mypage/order_list?page=${pstart-1}"> << </a>
				</c:if>
				<c:if test="${pstart == 1}"> 
					<<
				</c:if>
				
				<!-- 현재페이지 이전 1페이지 이동 -->
				<c:if test="${page != 1}"> 
					<a href="mypage/order_list?page=${page-1}"> < </a>
				</c:if>
				<c:if test="${page == 1}"> 
					<
				</c:if>
				
				<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
				<c:forEach begin="${pstart}" end="${pend}" var="i">
				
				<!-- 현재페이지 색은 다르게 => 빨강 -->
					<c:if test="${page != i}"> 
						<a href="mypage/order_list?page=${i}"> ${i} </a>
					</c:if>
					<c:if test="${page == i}"> 
						<a href="mypage/order_list?page=${i}" style="color:red"> ${i} </a>
					</c:if>
					
				</c:forEach>

				<!-- 현재페이지 기준 다음1페이지 이동 -->
				<c:if test="${page != page_cnt}"> 
					<a href="mypage/order_list?page=${page+1}"> > </a>
				</c:if>
				<c:if test="${page == page_cnt}"> 
					>
				</c:if>
				
				<c:if test="${page_cnt != pend}"> 
					<a href="mypage/order_list?page=${pend+1}"> >> </a>
				</c:if>
				<c:if test="${page_cnt == pend}"> 
					>>
				</c:if>
				
			</td>
		</tr>
		
	</table>


	</c:if>
</body>
</html>