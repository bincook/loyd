<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 상품 등록</title>
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
 table{
   align:center;
  margin:auto;
 }
 tr{
 border-radius:10px;
 box-shadow:0px -2px 13px 0px skyblue;
 }
 td{
 padding:10px;
 }
 </style>
</head>
<body>
  <div id="whole">
	<header><h1>관리자 상품 등록</h1></header>
	<p>
	<table align="center">
	 <tr>
	  <td>
		<form method="post" action="upload_ok" enctype="multipart/form-data">
		 <input type="text" name="name" placeholder="상품명"><p>
		 <input type="text" name="brand" placeholder=브랜드><p>
		 <input type="text" name="price" placeholder="상품가격"><p>
		 <input type="radio" name="category" value="공용">공용
		 <input type="radio" name="category" value="남성">남성
		 <input type="radio" name="category" value="여성">여성<p>		 
		 <textarea name="content" placeholder="content" cols="22" rows="4"></textarea><p>
		 <input type="number" min="0" max="1" step="0.1" name="discount" placeholder="할인가격"><p>
		 <input type="radio" name="kind" value="가죽">가죽
		 <input type="radio" name="kind" value="메탈">메탈<p>
		 <input type="file" name="picture" ><p>
		 
		 <input type="submit" value="상품등록">
		</form> 
	  </td>
	 </tr>
  </table>   
  </div>	
</body>
</html>