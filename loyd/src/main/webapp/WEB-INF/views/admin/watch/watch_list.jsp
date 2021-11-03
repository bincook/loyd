<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<<<<<<< HEAD

=======
>>>>>>> developer

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
		 padding:100px;
		 color:#6A6A6A;
		 margin:auto;
	 }
	 tr{
		 box-shadow:0px -2px 13px 0px skyblue;
	 }
	 img{
		box-shadow:0em 0px 10px 0px skyblue;
	 }
	 .fg{
		 color:#BEBEBE;
	 }

 </style>
 <script>
  $(function()
  {
	  var chkall=document.getElementsByName("rowcheck"); 
	  var rowcnt=chkall.length;
	  
  		$("input[name='allcheck']").click(function(){
  			var chk_listArr=$("input[name='rowcheck']");
  			for(var i=0; i<chk_listArr.length; i++){
  				chk_listArr[i].checked = this.checked;
  			}
  		});	
  		$("input[name='rowcheck']").click(function(){
  			if($("input[name='rowcheck']:checked").length==rowcnt){
  				document.getElementById("allcheck").checked=true;
  			}
  			else{ 
  				// ajax에선 checked가 아닌 attr로 사용해야함
  				$("input[name='allcheck']").prop("checked",false);
  			}  			
  		});
  });
  
  function deletevalue()
  {
      var chk = confirm("삭제할까요 'ㅅ'?");
            
      if (!chk) return
      
      
       $.ajax({
    	    
    	    url:'delete',
    	    type:'POST' ,
    	    data: {watchIds: watchIds},
    	    success:function(data) {
    	    	alert("삭제 했어요'ㅅ'");
    	    	location.reload()
    	    },
    	});
  }
<<<<<<< HEAD
=======

>>>>>>> developer
  function view()
  {  
	  var checkedInput = $("input:checked")
	  watchIds = []
	  
<<<<<<< HEAD
//	  console.log(checkedInput.length)	  
=======
	  console.log(checkedInput.length)	  
>>>>>>> developer
	  if(checkedInput.length < 1)
		  {
		  document.getElementById("ctn_show").style.display="none"; 
		  }
	  else
		  {
		  document.getElementById("ctn_show").style.display="table-row"; 
		  
		  // 체크된 인풋박스를 돌면서 아이디값만 배열에 넣어준다
		  $.each(checkedInput, function (index, data) {
			  if (data.value != 'on') watchIds.push( data.value) 
			  		    
		  })
	 }
  }
  
<<<<<<< HEAD
=======
  
>>>>>>> developer
 </script>
</head>
<body>

 <div id="whole">
<<<<<<< HEAD

=======
>>>>>>> developer
   <header><h1>관리자 상품 목록</h1></header>
  
	    <form name="del" method="post" action="delete">
   
   		<table width="1000" align="center">

		<tr style="display:none" id="ctn_show">
		<td><i class="bi bi-trash" onclick="deletevalue()"></i> 
		<!--     삭제 icon누르면 삭제 -->
		    <i class="bi bi-eye-slash"></i>
		</td>
		</tr> 	
	 	 <tr>
	  	</td>	
		<!--  화면에 표시되는 전체 체크박스 -->	    
		<td onclick="view()"><input id="allcheck" type="checkbox" name="allcheck"></td> 	  
	  	
	  	<!-- id번호 누르면 수정으로 이동 -->
		   <td> no. </td>  

	       <td> <i class="bi bi-image"></i> </td>
           <td> <i class="bi bi-tags"></i> /
                <i class="bi bi-smartwatch"></i>
		   </td>
		   <td> <i class="bi bi-currency-bitcoin"></i> </td>
           <td> <i class="bi bi-person-check-fill"></i>   </td>
           <td> <i class="bi bi-node-minus"></i> </td>
           <td width="60"> <i class="bi bi-stars"></i>   </td>
<<<<<<< HEAD

=======
>>>>>>> developer
		  </tr>	
	  
			<c:forEach items="${watch_list}" var="wdto">
			<tr>
			<!--  하나의 상품에 대한 체크박스 -->
			<td onclick="view()"><input name="rowcheck" type="checkbox" value="${wdto.id}"></td>  	 
<<<<<<< HEAD

			 <td> ${wdto.id}</td>	

=======
			 <td> ${wdto.id}</td>	
>>>>>>> developer
		  
		  	  
		  <!--
		  	 이미지가 resources 로 시작하는 경우
		    <img src="/loyd/${wdto.picture}" width="100" height="100">		    
		          아닌 경우
		    <img src="${wdto.picture}" width="100" height="100">
		   -->
		 
	   <c:if test="${fn:indexOf(wdto.picture,'resources') != -1 }">
   			<td><img src="/loyd/${wdto.picture}" width="90" height="70"></td>
       </c:if>
       <c:if test="${fn:indexOf(wdto.picture,'resources') == -1 }">
      		<td> <img src="${wdto.picture}" width="90" height="70"></td>
       </c:if>
			<td> ${wdto.brand} <br>
			<a href="content?id=${wdto.id}" style="color:#22741C;">${wdto.name}</a>
		   </td>		  
		   <td>
		      <fmt:formatNumber value="${wdto.price}" pattern="#,###" />
	       </td>
		   <td> ${wdto.category} </td>
		   <td> ${wdto.discount} </td>
		   <td> ${wdto.kind}</td>   
		  </tr>
	 </c:forEach>  
	 </form>	 
<<<<<<< HEAD

=======
>>>>>>> developer
	 	 <tr>
    <td colspan="10" align="center">
    
    <!-- 현재 페이지 기준 이전 10페이지 이동 -->
   <c:if test="${pstart !=1 }"> 
    <a href="watch_list?page=${page-1}"> ◀ </a>    
   </c:if>
   <c:if test="${pstart == 1}">
    	◀
   </c:if>

<!-- 현재페이지 이전 1페이지 이동 -->
	<c:if test="${page != 1}">
	 <a href="watch_list?page=${page-1}"> < </a>
	</c:if>
	<c:if test="${page == 1}">
	 <
	</c:if>

<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
	<c:forEach begin="${pstart}" end="${pend}" var="i">
<!-- 현재페이지 색은 다르게 => 빨강 -->	
	 <c:if test="${page != i}">
	 <a href="watch_list?page=${i}">${i}</a>
	 </c:if>
	 <c:if test="${page == i}">
	 <a href="watch_list?page=${i}" style="color:red">${i}</a>
	 </c:if>
	</c:forEach>						

 <!-- 현재페이지 기준 다음1페이지 이동 -->
  	<c:if test="${page != page_cnt}">
  	 <a href="watch_list?page=${page+1}"> > </a>
  	</c:if>
  	<c:if test="${page == page_cnt}">
  	  >
  	</c:if>
  	
  	<c:if test="${page_cnt != pend}">
  	 <a href="watch_list?page=${pend+1}"> ▶ </a>
  	</c:if>
      <c:if test="${page_cnt == pend}">
  	 ▶
  	 </c:if>
    </td>
   </tr>	 
	 	 
   </table>   
 </div>
</body>
</html>