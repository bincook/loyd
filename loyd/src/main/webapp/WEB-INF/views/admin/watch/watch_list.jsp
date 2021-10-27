<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
  				$("input[name='allcheck']").attr("checked",false);
  			}  			
  		});
  });
  
  function deletevalue()
  {
	  var url="/watch/delete";				
	  var valueArr=new Array();	 
	  var chk_list=$("input[name='rowcheck']");
	  for(var i=0; i<chk_list.length; i++)
	  {
		  if(chk_list[i].checked)
		  {	
			  valueArr.push(chk_list[i].value);
		  }	
	  }
	   if(valueArr.length==0)
	  {
		  alert("선택된 상품이 없어요 'ㅅ'");
	  }
	   else{		   
		  var chk=confirm("정말 삭제할까요?");
		  $.ajax(
			 {
			   url : url,
			   type : 'POST',
			   traditional:true,
			   data:
			   {
				  valueArr:valueArr
			   },
			   success:function(jdata)
			   {
				  if(jdata=1)
				  {
					alert("삭제되었어요");  
					location.replace("watch_list")
				  }
				  else
				  {
					  alert("삭제를 못했어요");
				  } 
		       }
	         }); // ajax
	         
	  } // else 
  }

  
  function view()
  {
	  // 1. 체크된 항목들을 배열에 담는다
	  
	  // 2-1. 체크된 배열의 길이가 0개 인 경우
	  // 	2-1-1 버튼 숨긴다
	  
	  // 2-2. 체크된 배열의 길이가 0개가 아닌 경우
	  // 	2-2-1. 버튼을 보이게 한다
	  
	  // 3. 체크가 1개라도 있는 경우 삭제버튼을 보이게 한다
	  // 3-1. (else) 체크가 0개라면 삭제버튼을 안보이게 한다 
	  
	  
	  var checkedInput = $("input:checked")
	  
	  console.log(checkedInput.length)
	  
	  if(checkedInput.length < 1)
		  {
		  document.getElementById("ctn_show").style.display="none"; 
		  }
	  else
		  {
		  document.getElementById("ctn_show").style.display="table-row"; 
		  }
	  
	  
	  
	  // 		
  }
 </script>
</head>
<body>
 <div id="whole">
  <header><h1>관리자 상품 목록</h1></header>
  
	<form method="post" action="delete">
   
   		<table width="1000" align="center">

<tr style="display:none" id="ctn_show">
<td><input type="hidden" name="cnt" value="${wdto.id}"> 
	<input type="submit" value="삭제" onclick="deletevalue()">
</td>
</tr> 	
	 	 <tr>
	  	</td>	
		<!--  화면에 표시되는 전체 체크박스 -->	    
		<td onclick="view()"><input id="allcheck" type="checkbox" name="allcheck"></td> 	  
	  	
	  	<!-- id번호 누르면 수정으로 이동 -->
<td><a href="content?id=${wdto.id}"> no. </a></td>  

		   <td > 이미지 </td>
		   <td> 브랜드 <br>
		   		상품명
		   </td>
		   <td> 가격 </td>
		   <td> 카테고리   </td>
		   <td> 할인가격 </td>
		   <td width="60"> 종류   </td>
		  </tr>	
	  
			<c:forEach items="${watch_list}" var="wdto">
			<tr>
			<!--  하나의 상품에 대한 체크박스 -->
			<td onclick="view()"><input name="rowcheck" type="checkbox" value="${wdto.id}"></td>  	 
			 <td> ${wdto.id}&nbsp;</td>	
		  
		  	  
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
      		<td> <img src="${wdto.picture}&nbsp;" width="90" height=70></td>
       </c:if>
           <td> ${wdto.brand}&nbsp; <br>
		  		${wdto.name}&nbsp; </td>		  
		   <td> ${wdto.price}&nbsp; </td>
		   <td> ${wdto.category}&nbsp; </td>
		   <td> ${wdto.discount}&nbsp; </td>
		   <td> ${wdto.kind}&nbsp; </td>   
	  </tr>
</c:forEach>  
</form>	 
	 	 <tr>
    <td colspan="10" align="center">
    
    <!-- 현재 페이지 기준 이전 10페이지 이동 -->
   <c:if test="${pstart !=1 }"> 
    <a href="wwatch_list?page=${page-1}"> ◀ </a>    
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
  	<c:if test="${pend_cnt == pend}">
  	 ▶
  	 </c:if>
    </td>
   </tr>	 
	 	 
   </table>   
 </div>
</body>
</html>