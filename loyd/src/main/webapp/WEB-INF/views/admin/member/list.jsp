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
  <header><h1>ȸ������</h1></header>
   <div>
    <a href=list>ȸ����� ��ȸ</a>  
   </div>
   <p>
   <div>
   	<table border="1">
   	 <tr>
   	  <td colspan="3">
   	   <form name="pkc" method="post" action="list">
   	    <select name="search_field">
   	     <option value="id">ȸ����ȣ</option>
 	     <option value="name">ȸ���̸�</option>
	     <option value="email">ȸ���̸���</option>
   	    </select>
   	    
   	     <input type="text" name="search_word">
   	     <input type="submit" value="�˻�">
   	   </form>
   	   
   	  </td>
   	 </tr>
   	 
   	 
   	 <tr>
   	 <td>ȸ����ȣ</td>
   	  <td>ȸ���̸�</td>
   	  <td>ȸ���̸���</td>
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
        <a href="dash-board">������ Ȩ����</a>  
    </td>
   </tr>
   	</table>
   </div>
  
 </div>
</body>
</html>