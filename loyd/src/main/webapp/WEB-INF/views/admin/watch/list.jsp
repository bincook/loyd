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

  <table width="600" align="center">
  <tr>
   <td>상품명 </td>
   <td>브랜드 </td>
   <td> 가격 </td>
   <td> 카테고리(공용/남성/여성) </td>
   <td> 상세내용 </td>
   <td> 할인가격 </td>
   <td> 이미지 </td>
   <td> 종류(가죽/메탈) </td>
  </tr>
   <c:forEach items="${list}" var="wdto">
  <tr>
  <td> ${wdto.name} </td>
   <td> ${wdto.brand} </td>
   <td> ${wdto.price} </td>
   <td> ${wdto.category} </td>
   <td> ${wdto.content} </td>
   <td> ${wdto.discount} </td>
   <td> ${wdto.kind} </td>
   <td> <img src="resources/img/${wdto.picture}" width="100"> </td>
  </tr>
  </c:forEach>  
 </table>   
</body>
</html>