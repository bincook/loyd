<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 <style>
  header{
  height:70px;
  background:#E9F4D1;
  text-align:center;
  color:#4D4D4D;
  }
  
  #whole{
  font-size:14px;
  text-align:center;
  color:#4D4D4D;
  }
  
  link{
  text-decoration:none;
  }
  
  table{
  margin-top:50px;
  width:500px;
  align:center;
  margin:auto;
  }
 </style>
 
 <script>
 window.onload=function()
 {
	 document.pkc.search_field.value="${search_field}";
 }
</script>
</head>
<body>
 <div id=whole>
  <header><h1>회원관리</h1></header>
   <p>
   <div>
   	<table>
   	 <tr>
   	  <td colspan="3">
   	   <form name="pkc" method="post" action="list">
   	    <select name="search_field" placeholder="33">
   	     <option value="id">회원번호</option>
 	     <option value="name">회원이름</option>
	     <option value="email">회원이메일</option>
   	    </select>
   	    
   	     <input type="text" name="search_word" placeholder="상세 조회">
   	     <input type="submit"  value="검색" size="50">
   	   </form>   	   
   	  </td>
   	 </tr>   	 
   </table>
   
   <table border="1">	 
   	 <tr colspan="3">
	   	 <td>회원번호</td>
		 <td>회원이름</td>
	 	 <td>회원이메일</td>
   	 </tr>
   	 
   <c:forEach items="${list}" var="mdto">
    <tr>
	     <td>${mdto.id}</td>
	     <td>${mdto.name}</td>
	     <td>${mdto.email}</td>
    </tr>	 
   </c:forEach>
   
    <tr>
    <td colspan="3" align="center">
    
    <!-- 현재 페이지 기준 이전 10페이지 이동 -->
   <c:if test="${pstart !=1 }"> 
    <a href="list?page=${page-1}"> ◀ </a>    
   </c:if>
   <c:if test="${pstart == 1}">
    	◀
   </c:if>

<!-- 현재페이지 이전 1페이지 이동 -->
	<c:if test="${page != 1}">
	 <a href="list?page=${page-1}"> < </a>
	</c:if>
	<c:if test="${page == 1}">
	 <
	</c:if>

<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
	<c:forEach begin="${pstart}" end="${pend}" var="i">
<!-- 현재페이지 색은 다르게 => 빨강 -->	
	 <c:if test="${page != i}">
	 <a href="list?page=${i}">${i}</a>
	 </c:if>
	 <c:if test="${page == i}">
	 <a href="list?page=${i}" style="color:red">${i}</a>
	 </c:if>
	</c:forEach>						

 <!-- 현재페이지 기준 다음1페이지 이동 -->
  	<c:if test="${page != page_cnt}">
  	 <a href="list?page=${page+1}"> > </a>
  	</c:if>
  	<c:if test="${page == page_cnt}">
  	  >
  	</c:if>
  	
  	<c:if test="${page_cnt != pend}">
  	 <a href="list?page=${pend+1}"> ▶ </a>
  	</c:if>
  	<c:if test="${pend_cnt == pend}">
  	 ▶
  	 </c:if>
    </td>
   </tr>
   </table>

   <table>
   <tr>
    <td colspan="3" align="center">
        <a href="dash-board">관리자 홈으로</a>  
    </td>
   </tr>
   	</table>
   </div>
  
 </div>
</body>
</html>