<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>어드민 대시보드 페이지</title>    
<style>

</style>
</head>
<body>

<div class="card" style="width:300px">
     <div class="card-header">
      
        <a href="/loyd/admin/member/list" class="stretched-link">QnA </a>
        <span> 최근 문의글 </span>
    </div>
    <div class="card-body">   
        <table class="table">
<thead>            
      <c:forEach items="${dash_listq}" var="list">
      <tr>
        <th>${list.content}</th>
        <th>${list.writeday}</th>
     </tr>
      </c:forEach>      
</thead>

  </table>  
    </div>
  </div>

  
    <div class="card" style="width:300px">
     <div class="card-header">
      
        <a href="/loyd/admin/member/list" class="stretched-link">review </a>
        <span> 최근  </span>
    </div>
    <div class="card-body">   
        <table class="table">
<thead>            
     <c:forEach items="${dash_listr}" var="list">
      <tr>
        <th>${list.content}</th>
        <th>${list.writeday}</th>
     </tr>
      </c:forEach>  
</thead>      
	</table>       
    </div>
  </div>
  
    
  <div class="card" style="width:300px">
     <div class="card-header">
      
        <a href="/loyd/admin/member/list" class="stretched-link">cart </a>
        <span> 최근  </span>
    </div>
    <div class="card-body">   
        <table class="table">
    <thead>            
      <c:forEach items="${dash_listc}" var="list">
      <tr>
        <th>${list.created_at}</th>
        <th>${list.email}</th>
     </tr>
      </c:forEach>  
</thead>         
	</table>    
    </div>
  </div>
  

</body>
</html>

