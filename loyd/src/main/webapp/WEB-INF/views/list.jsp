<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table border="1" align="center" width="500">
  <tr>
  <td>이메일</td>
 <c:forEach items="${list}" var="ldto"> 
  <td>${ldto.email}</td>
 </c:forEach> 
  </tr>
 </table>
</body>
</html>