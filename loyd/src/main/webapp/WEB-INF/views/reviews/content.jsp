<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#content {
	height: 200px;
	padding-top: 50px;
}
</style>


</head>
<body>
	<div id="content">
		<table width="500" height="550" align="center" border="1">

			<tr>
				<td colspan="2" align="center"><img width="200" 
					src="<c:url value="/${reviews.path}/${reviews.name }" />"
					onerror="this.src='/loyd/resources/watch_errimg.png'; 
								this.style.width='200px';">
				</td>
			</tr>
			<tr>
				<td>작성일
					<p>${reviews.writeday }
				</td>
				<td>구매한 시계
					<p>${reviews.watch_id }
				</td>

			</tr>
			<tr>
				<td rowspan="2" style="color: gold; text-shadow: 0.5px 0.5px #c60;">
					<c:forEach begin="1" end="${reviews.rate }">
					★
					</c:forEach> <c:forEach begin="1" end="${5-reviews.rate }">
					☆
					</c:forEach>
				</td>
				<td>작성자
					<p>${reviews.member_id }
				</td>
			</tr>
			<tr>
				<td>후기내용
					<p>${reviews.content }</td>
			</tr>

		</table>
		<a href="delete" align="center">삭제하기</a>
		<a href="update" align="center">수정하기</a>
	</div>
	













	<!-- bs4 -->
	<!-- <div class="card" style="width:400px"> -->
	<!--   <img class="card-img-top" src="/loyd/resources/img/22.PNG" alt="Card image"> -->
	<!--   <div class="card-body"> -->
	<!--     <h4 class="card-title">별점</h4> -->

	<!--     <p class="card-text">시계 아이디</p> -->
	<!--     <p class="card-text">내용 1</p> -->
	<!--     <p class="card-text">내용 2</p> -->
	<!--     <a href="#" class="btn btn-primary">See Profile</a> -->
	<!--   </div> -->
	<!-- </div> -->






</body>
</html>








