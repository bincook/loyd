<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
		   <td> no </td>
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
		  <td> <img src="resources/img/${wdto.picture}" width="100" height="100"></td>
		  System.out.println(${wdto.picture});
		  <td>  ${wdto.brand} <br>
		  		${wdto.name} </td>		  
		   <td> ${wdto.price} </td>
		   <td> ${wdto.category} </td>
		   <td> ${wdto.discount} </td>
		   <td> ${wdto.kind} </td>   
	  </tr>
	 	 </c:forEach>  
   </table>   
 </div>
</body>
</html>