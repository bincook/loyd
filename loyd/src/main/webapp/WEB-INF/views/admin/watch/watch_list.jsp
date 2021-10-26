<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 상품등록 후 목록확인</title>
 <style>
	#whole{
		 font-size:14px;
		 text-align:center;
		 color:#4D4D4D;
	 }
	 header{
		 height:70px;
		 background:#E9F4D1;
		 text-align:center;
		 color:#4D4D4D;
 	 }
	 table {
		 border-radius:10px;
		 text-align:center;
		 padding:30px;
		 color:#6A6A6A;
		 margin:auto;
	 }
	 tr{
		 box-shadow:0px -2px 13px 0px skyblue;
	 }
	 .fg{
		 color:#BEBEBE;
	 }
 </style>
</head>
<body>
 <div id="whole">
  <header><h1>관리자 상품 목록</h1></header>
   <table width="800" align="center">
	  <tr>
        <td><a href="content?id=${wdto.id}"> no. </a></td>
		   <td> 이미지 </td>
		   <td> 브랜드 <br>
		   		상품명
		   </td>
		   <td> 가격 </td>
		   <td> 카테고리   </td>
		   <td> 할인가격 </td>
		   <td> 종류   </td>
	  </tr>
	  
	  	 <c:forEach items="${watch_list}" var="wdto">
	  <tr>

		  <td> ${wdto.id}</td>		  
		  <!--
		  	 이미가 resources 로 시작하는 경우
		    <img src="/loyd/${wdto.picture}" width="100" height="100">		    
		          아닌 경우
		    <img src="${wdto.picture}" width="100" height="100">
		   -->
		 
	   <c:if test="${fn:indexOf(wdto.picture,'resources') != -1 }">
   			<td><img src="/loyd/${wdto.picture}" width="100" height="100"></td>
       </c:if>
       <c:if test="${fn:indexOf(wdto.picture,'resources') == -1 }">
      		<td> <img src="${wdto.picture}" width="100" height="100"></td>
       </c:if>
           <td> ${wdto.brand} <br>
		  		${wdto.name} </td>		  
		   <td> ${wdto.price} </td>
		   <td> ${wdto.category} </td>
		   <td> ${wdto.discount} </td>
		   <td> ${wdto.kind} </td>   
	  </tr>
	 	 </c:forEach>  
	 	 
	 	 <tr>
    <td colspan="9" align="center">
    
    <!-- 현재 페이지 기준 이전 10페이지 이동 -->
   <c:if test="${pstart !=1 }"> 
    <a href="watch_list?page=${page-1}"> ◀ </a>    
   </c:if>
   <c:if test="${pstart == 1}">
    	◀
   </c:if>

<!-- 현재페이지 이전 1페이지 이동 -->
	<c:if test="${page != 1}">
	 <a href="watch_list?page=${page-1}"> < </a>
	</c:if>
	<c:if test="${page == 1}">
	 <
	</c:if>

<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
	<c:forEach begin="${pstart}" end="${pend}" var="i">
<!-- 현재페이지 색은 다르게 => 빨강 -->	
	 <c:if test="${page != i}">
	 <a href="watch_list?page=${i}">${i}</a>
	 </c:if>
	 <c:if test="${page == i}">
	 <a href="watch_list?page=${i}" style="color:red">${i}</a>
	 </c:if>
	</c:forEach>						

 <!-- 현재페이지 기준 다음1페이지 이동 -->
  	<c:if test="${page != page_cnt}">
  	 <a href="watch_list?page=${page+1}"> > </a>
  	</c:if>
  	<c:if test="${page == page_cnt}">
  	  >
  	</c:if>
  	
  	<c:if test="${page_cnt != pend}">
  	 <a href="watch_list?page=${pend+1}"> ▶ </a>
  	</c:if>
  	<c:if test="${pend_cnt == pend}">
  	 ▶
  	 </c:if>
    </td>
   </tr>	 
	 	 
   </table>   
 </div>
</body>
</html>