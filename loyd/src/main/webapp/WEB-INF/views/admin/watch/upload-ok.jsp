<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table width="600" align="center">
  <tr>
   <td> 이름 </td>
   <td> 제목 </td>
   <td> 그림 </td>
   <td> 작성일 </td>
  </tr>
  <c:forEach items="${list}" var="udto">
  <tr>
   <td> ${udto.name} </td>
   <td> ${udto.title} </td>
   <td> 
      <c:forEach items="${udto.picture}" var="new_watch">
        <img src="resources/img/${new_watch}" width="20">
      </c:forEach>
   </td>
   <td> ${udto.name} </td>
  </tr>
  </c:forEach> 
 </table>  
</body>
</html>