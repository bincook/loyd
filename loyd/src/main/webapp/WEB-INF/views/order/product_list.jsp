<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#a img {
 	 transition: all 0.2s linear;
	}
	#a:hover img {
	  transform: scale(1.1);
	}
</style>
</head>
<body>

<div class="container">
	<h1 style="text-align:center;">WATCH LIST</h1>	
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

<table align="center">
	<tr>
		<td colspan="3" align="center"> 
       
       <!-- 현재 페이지 기준 이전 10페이지 이동 -->
      <c:if test="${pstart != 1}">
       <a href="product_list?page=${pstart-1}"> << </a>
      </c:if>
      <c:if test="${pstart == 1}"> 
       <<
      </c:if>
       <!-- 현재페이지 이전 1페이지 이동 -->
      <c:if test="${page != 1}"> 
       <a href="product_list?page=${page-1}"> < </a>
      </c:if>
      <c:if test="${page == 1}"> 
       <
      </c:if>
       <!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
        <c:forEach begin="${pstart}" end="${pend}" var="i">
          <!-- 현재페이지 색은 다르게 => 빨강 -->
         <c:if test="${page != i}"> 
          <a href="product_list?page=${i}"> ${i} </a>
         </c:if>
         <c:if test="${page == i}"> 
          <a href="product_list?page=${i}" style="color:red"> ${i} </a>
         </c:if>
        </c:forEach>
        
        <!-- 현재페이지 기준 다음1페이지 이동 -->
       <c:if test="${page != page_cnt}"> 
        <a href="product_list?page=${page+1}"> > </a>
       </c:if>
     
       <c:if test="${page == page_cnt}"> 
        >
       </c:if>
      <c:if test="${page_cnt != pend}"> 
       <a href="product_list?page=${pend+1}"> >> </a>
      </c:if>
      <c:if test="${page_cnt == pend}"> 
       >>
      </c:if> 
      </td>
	</tr>
</table>





</body>
</html>