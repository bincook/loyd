<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>
        <%-- 요청한 page 의 <title></title> 에 작성했던 내용이 온다 --%>
        <decorator:title />
    </title>
         <style>
    
      ul{
      background:pink;
      width:100px;
      list-style-type:none;
      margin:0;
      padding:0;
      border-radius:10px;
      position:fixed;
      }

      li a{
      display:block;
      color:#000000;
      padding:8px;
      text-align:center;
      text-decoration:none;
      font-weight:bold;
      }
      
      li a.current{
      background:indypink;
      color:white;
      }
      li a:hover:not(.current){
      background:indypink; 
      color:white;
      }
      
     </style>
</head>
<body>

	<ul>
	  <li><a href="/loyd/admin/dash-board">대시보드</a></li>
	  <li><a href="/loyd/admin/member/list">회원관리</a></li>
	  <li><a href="/loyd/admin/watch/upload">상품등록</a></li>
	  <li><a href="/loyd/admin/watch/watch_list">상품목록</a></li>
	  <li><a href="/loyd/admin/oder-list">주문내역(x)</a></li>
	</ul>


 <!-- 부트스트랩 -->
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">

    <!-- 아이콘 사이트 https://icons.getbootstrap.com/ -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <!-- Index CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css" />">

    <!-- 부트스트랩 & 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

    <%-- 요청한 page 의 <head></head> 에 작성했던 내용이 온다 --%>
    <decorator:head />
    
    
</head>
<body>
	 <decorator:body />
</body>
</html>