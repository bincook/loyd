<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
	#whole {
		font-size: 14px;
		text-align: center;
		color: #4D4D4D;
	}
	
	header {
		height: 70px;
		background: #E9F4D1;
		text-align: center;
		color: #4D4D4D;
	}
	
	table {
		align: center;
		margin: auto;
		width: 1000px;
		color: #6A6A6A;
		padding: 100px;
	}
	
	tr {
		border-radius: 10px;
		box-shadow: 0px -2px 13px 0px skyblue;
	}
	
	td {
		padding: 10px;
	}
</style>

 <script>
 
 window.onload = function() {
	 var errorMessage = "<%=request.getParameter("error") %>"
	 
	 if (errorMessage != "null") alert(errorMessage)
	 
	 var category = "${wdto.category}"
	 var kind = "${wdto.kind}"
 
 	 $('input[value=' + category + ']').prop('checked', 'checked')
 	 $('input[value=' + kind+ ']').prop('checked', 'checked')
 	
 }
	/**  https://taeny.dev/javascript/file-object/  */
 function changeImg(input) {
	
	 	var url = URL.createObjectURL(input.files[0])
		$('#imgArea img').attr('src', url)  
	 }
 </script>
 
</head>
<body>
<div id="whole">
  <header><h1>관리자 상품 상세</h1></header>
   <table>
   
    <tr>
	  <td class="p-4">
		<form method="post" action="update_ok" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${wdto.id}" /> 
		 <td>
			<div id="imgArea" class="form-group">			
			 	<c:if test="${fn:indexOf(wdto.picture,'resources') != -1 }">
	   				<img src="/loyd/${wdto.picture}" width="300" height="300">
		       </c:if>
		       <c:if test="${fn:indexOf(wdto.picture,'resources') == -1 }">       
	      			<img src="${wdto.picture}" width="300" height="300">
	      		</c:if>       
	       	</div>
	      </td>
	      <td width="500">	
			<div class="form-group">
			 	<input class="form-control" type="text" name="name" value="${wdto.name} ">
			</div>
			
			 <div clsas="form-group">
				<input class="form-control" type="text" name="brand" value="${wdto.brand}"><p>		 
			 </div>
			 
			 <div class="form-group">
			 	<input class="form-control" type="text" name="price" value="${wdto.price}"><p>
			 </div>
			 
			 <div class="form-group">
				 <input type="radio" name="category" value="공용">공용
		 		 <input type="radio" name="category" value="남성">남성
		 		 <input type="radio" name="category" value="여성">여성		
			 </div>
			 
			 <div class="form-group">
			 	<textarea class="form-control" name="content"  cols="22" rows="4">
			 	${wdto.content}
			 	</textarea>
			 </div>
			 
			 <div class="form-group">
				<input class="form-control" type="number" min="0" max="1" step="0.1" name="discount" value="${wdto.discount}">
			 </div>
			 
			 <div class="form-group">
			 	<input type="radio" name="kind" value="가죽">가죽
			 	<input type="radio" name="kind" value="메탈">메탈
			 </div>
			 
			 <p>
			 <div class="form-group">
				 <label class="btn btn-outline-info btn-file" >
	   		 첨부파일<input onchange="changeImg(this)" type="file" name="picture" style="display:none;">
	 			 </label>
			 </div>
			 </p>			 
			 
		<div class="form-group">
			<input class="btn" style="background-color:#FCFF71;" type="submit" value="수정완료">
		</div>
			</td>  
		 </form>
	   </td> 
	 </tr>
   </table>   
 </div>
</body>
</html>