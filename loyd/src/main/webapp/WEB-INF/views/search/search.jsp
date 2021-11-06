<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	
	window.onload = function() {
		$("form").bind("keypress", function (e) {
		    if (e.keyCode == 13) {
		    	var a = document.pkc;
		    	if(a.search.value==""){
					return false
				}else{
					document.pkc.submit();
				}
		    }
		});		
	}
	
	function check() {
		var a = document.pkc;
    	if(a.search.value==""){
			return false
		}else{
			document.pkc.submit();
		}
	}
	

	
</script>
</head>
<body>
	<h1 style="text-align:center;">Search</h1>
	
	<div>
	<form name="pkc" method="post" action="search">
	<table align="center">
		<tr>
			<td >
				<input type="hidden" name="chk" value='true' />
				<input type="text" name="search" placeholder="검색어를 입력하세요">
				<input type="button" value="검색" onclick="check()">
			</td>
		</tr>
	</table>
	</form>
	</div>
	
	
	
	
	<c:if test="${list.isEmpty() && chk}">
		<div id ="zero" style="display:block;">
			<h1 style="text-align:center;">검색 결과가 없습니다 </h1>
			<h1 style="text-align:center;">검색어를 변경해 보세요 </h1>
		</div>
	</c:if>
	<c:if test="${list.isEmpty()}">
	<div id ="zero" style="display:none;">
		<h1 style="text-align:center;">검색 결과가 없습니다 </h1>
		<h1 style="text-align:center;">검색어를 변경해 보세요 </h1>
		</div>
	</c:if>
	
	<div class="container">
	
	<!-- 1줄 (12칸) 차지-->
	  <div class="row" style="min-width: 600px; margin-top:30px;">
	    	<!-- 4칸 차지 -->
	    	<c:forEach items="${list }" var="dto">
		    <div class="col-3">
			      <!-- 카드 박스 -->
			      <a href="/loyd/order/detail_order?id=${dto.id }">
			      <div class="card mb-3" id="a">
			        <!-- 카드 이미지-->
				        <img src="${dto.picture }" class="card-img-top" alt="...">
				        <!-- 카드의 작성될 내용 적는 곳-->
				        <div class="card-body">
				          <!-- 카드 제목 -->
				          <h5 class="card-title">${dto.content }</h5>
				          <!-- 카드 가격-->
				          <p class="card-text">${String.format("%,d",dto.price) }원</p>
				        </div>
			      </div>
			      </a>
			      
		    </div>
		    </c:forEach>
	  </div>
</div>



</body>
</html>