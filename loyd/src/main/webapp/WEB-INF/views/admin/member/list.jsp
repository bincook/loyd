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
   <div>
    <a href=list>회원목록 조회</a>  
   </div>
   <p>
   <div>
   	<table border="1">
   	 <tr>
   	  <td colspan="3">
   	   <form name="pkc" method="post" action="list">
   	    <select name="search_field">
   	     <option value="id">회원번호</option>
 	     <option value="name">회원이름</option>
	     <option value="email">회원이메일</option>
   	    </select>
   	    
   	     <input type="text" name="search_word">
   	     <input type="submit" value="검색">
   	   </form>
   	   
   	  </td>
   	 </tr>
   	 
   	 
   	 <tr>
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
        <a href="dash-board">관리자 홈으로</a>  
    </td>
   </tr>
   	</table>
   </div>
  
 </div>
</body>
</html>