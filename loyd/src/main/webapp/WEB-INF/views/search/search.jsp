<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function view2(){
		
	}
	
	function check(){
		var a = document.pkc;
		if(a.search.value==""){
			document.getElementById("zero").style.display="block";
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
				<input type="text" name="search" placeholder="검색어를 입력하세요" onkeypress="if(event.keyCode==13){check();}">
				<input type="button" value="검색" onclick="check()">
			</td>
		</tr>
	</table>
	</form>
	</div>
	
	
	
	
	
	<div id ="zero" style="display:none;">
	<c:if test="${chk==0 }">
		<h1 style="text-align:center;">검색 결과가 없습니다 </h1>
		<h1 style="text-align:center;">검색어를 변경해 보세요 </h1>
	</c:if>
	</div>
	
	<div class="container">
	
	<!-- 1줄 (12칸) 차지-->
	  <div class="row" style="min-width: 600px; margin-top:30px;">
	    	<!-- 4칸 차지 -->
	    	<c:forEach items="${list }" var="dto">
		    <div class="col-3">
			      <!-- 카드 박스 -->
			      <a href="detail_order?id=${dto.id }">
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