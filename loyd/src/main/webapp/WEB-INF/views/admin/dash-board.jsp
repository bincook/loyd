<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>어드민 대시보드 페이지</title>    
</head>
<body>
  <div class="card" style="width:300px">
      <div class="card-header">
      
        <a href="#" class="btn btn-primary stretched-link">Profile</a>
        <span>총 회원 수 : R ?</span>
    </div>
    <div class="card-body">
   
        <table class="table">
    <thead>
  <tbody>   
<c:forEach items="${dash_listq}" var="list">
      <tr>
        <th>q 내용 = ${list.content}<br></th>
        <th>날짜 =${list.writeday}</th>   
      </tr>
    </thead>
</c:forEach>      
<hr>
	  </tbody>
	  
	   <tbody>  
<c:forEach items="${dash_listr}" var="list">
      <tr>
        <th>r 내용 = ${list.content}<br></th>
        <th>날짜 =${list.writeday}</th>   
      </tr>
    </thead>
</c:forEach>   
 		</tbody>
 
 

<c:forEach items="${dash_listr}" var="list">
      <tr>
        <th>c 내용 = ${list.content}<br></th>
        <th>날짜 =${list.writeday}</th>   
      </tr>
    </thead>
</c:forEach> 

<c:forEach items="${dash_listr}" var="list">
      <tr>
        <th>r 내용 = ${list.content}<br></th>
        <th>날짜 =${list.writeday}</th>   
      </tr>
    </thead>
</c:forEach> 


      <tr>
        <td></td>
        <td></td>
        <td></td>
      </tr>      

  
  </table>
    </div>
  </div>
  
  
</body>
</html>

