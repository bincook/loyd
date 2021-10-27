<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
.rate-area {
  float: left;
  border-style: none;
}

.rate-area:not(:checked) > input {
  position: absolute;
  top: -9999px;
  clip: rect(0,0,0,0);
}

.rate-area:not(:checked) > label {
  float: right;
  width: 1em;
  padding: 0 .1em;
  overflow: hidden;
  white-space: nowrap;
  cursor: pointer;
  font-size: 200%;
  line-height: 1.2;
  color: lightgrey;
  text-shadow: 1px 1px #bbb;
}

.rate-area:not(:checked) > label:before { content: '★ '; }

.rate-area > input:checked ~ label {
  color: gold;
  text-shadow: 1px 1px #c60;
  font-size: 200% !important;
}

.rate-area:not(:checked) > label:hover, .rate-area:not(:checked) > label:hover ~ label { color: gold; }

.rate-area > input:checked + label:hover, .rate-area > input:checked + label:hover ~ label, .rate-area > input:checked ~ label:hover, .rate-area > input:checked ~ label:hover ~ label, .rate-area > label:hover ~ input:checked ~ label {
  color: gold;
  text-shadow: 1px 1px goldenrod;
}

.rate-area > label:active {
  position: relative;
  top: 2px;
  left: 2px;
}

</style>




</head>
<body>
<%-- 	<table width="500" align="center" border="1">
			<tr>
				<td>구매한 상품</td>
				<td>내용</td>
				<td>작성일</td>
			</tr>
			
 		<c:forEach items="${reviews}" var="review">
			<tr>
				<td>watch_id</td>
				<td>${review.content}</td>
				<td>${review.writeday }</td>
			</tr>		
		</c:forEach> 
			<tr>
				<td colspan="3"><a href="write">리뷰 작성하기</a></td>	
			</tr>
	</table> --%>
	
	    <table width="500" align="center" border="1">
		<div class="container">
		  <h2 class="mb-4" align=center>후기 게시판</h2>
		  <div align=center>텍스트 리뷰 / 포토리뷰  </div>
		  <div class="mb-3" align=center>200point / 500 point </div>            
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>글번호</th>
		        <th>시계이름</th>
		        <th>이미지</th>
		        <th>만족도</th>
		        <th>내용</th>
		        <th>조회수</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody>
		    
		    <c:set var="i" value="0" />
		    <c:set var="j" value="3" />
			    <c:forEach items="${reviews }" var="review">
    			    <c:if test="${i%j==0 }">
					      <tr>
					</c:if>

					        <td>${review.review_id}</td>
					        <td>${review.watch_id}</td>
					        <td>
					        	<img src="<c:url value="/${review.path }/${review.name }" />"  onerror="this.src='/loyd/resources/watch_errimg.png'; this.style.width='50px';" >
					        </td>
					        <td style="color: gold; text-shadow: 0.5px 0.5px #c60;">
					   		       <c:forEach begin="1" end="${review.rate}"> 
								 	★
							       </c:forEach>
							       <c:forEach begin="1" end="${5-review.rate}"> 
								 	☆
							       </c:forEach>
					        </td>
					        <td><a href="readnum?review_id=${review.review_id}">${review.content}</a></td>
					        <td>${review.view}</td>
					        <td>${review.writeday}</td>

					      </tr>

	
			      </c:forEach>
		    </tbody>
		    
		    
		    <!--  여기서부터 페이징 -->
		    
		    <tr>
		    	<td colspan="7" align="center">
		    	
		    	<c:if test="${pstart !=1 }">
					
					<a class="mr-2" href="list?page=${pstart-1 }">◀◀ </a>
				
				</c:if>
				<c:if test="${pstart ==1 }">
					
					<a class="mr-2" style="color:grey">◀◀ </a>
				
				</c:if>
	
				
				<!-- 클릭시 현재 페이지 기준으로 이전 1페이지 이동 -->
				
				
				<c:if test="${page!= 1 }">
				
					<a href="list?page=${page-1 }"> ◀ </a>
				</c:if>
				<c:if test="${page == 1 }">
					<a style="color:grey">◀ </a>
				</c:if>
				
					<!-- 현재 페이지 기준으로 이동할수 있는 페이지 -->
					<c:forEach begin="${pstart }" end="${pend }" var="i">
					
					
					<!-- 현제 페이지 색은 다르게 => 빨강 -->
						<c:if test="${page !=i }">
							<a href="list?page=${i }">${i }</a>
						</c:if>
						<c:if test="${page ==i }">
							<a href="list?page=${i }" style="color:red">${i }</a>
						</c:if>
						
					
					</c:forEach>
			
					<!-- 클릭시 현재 페이지 기준 다음 1페이지 이동 -->
					
					<c:if test="${page != page_cnt }">
						<a href="list?page=${page+1 }"> ▶ </a>
					</c:if>

<%-- 					${page_cnt } (마지막 페이지 몇인지 궁금할때 실행시켜보는거)					 --%>
					
					<c:if test="${page == page_cnt }">
						<form> ▶ </form>
					</c:if>
					
					<!-- 클릭시 현재 페이지 기준 다음 10페이지 이동 -->
					<c:if test="${pend !=page_cnt }">
					
						<a class="ml-2" href="list?page=${pend+1 }">▶▶</a>
				
					</c:if>
					
					<c:if test="${pend ==page_cnt }">
						<a class="ml-2" style="color:grey">▶▶</a>
	
					</c:if>
			
		    	    
				
				</td>
				<c:if test="${i%j==j-1 }"> 
			</tr>
		    	 </c:if>
		     	<c:set var="i" value="$i+1" />
		  </table>
		  	<a href="write">리뷰 작성하기</a>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		

</body>
</html>




