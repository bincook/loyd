<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 table{
 margin:auto;
 text-decoration:
 border-radius:10px;
 box-shadow:inset 1px 1px rgba(0, 0, 0, .1); 
 }
</style>
 <script>
   var size=1;
   function add()
   {		
		   if(size<3)		   
		   var pkc=document.getElementById("pkc");
		   pkc.innerHTML=pkc.innerHTML+"<p class='fname'> <input type='file' name='fname"+size+"'> </p>";
		   size++;
	   
   }
 /** 마지막에 올린 사진 삭제*/ 
   function del()
   {
	   if(size>1)
	   {
	     $(".fname").eq(size-1).remove();
	     size--;
	   }
   }
 </script>
</head>
<body>
	<table>
	  <form method="post" action="upload_ok" enctype="multipart/form-data">
		  <input type="text" name="watch" placeholder="상품명"><p>
		  <input type="text" name="price" placeholder="가격"><p>
 		<div id="pkc">
		  <input type="button" onclick="add()" value="추가">
		  <input type="button" onclick="del()" value="삭제">
		  <p class="fname"> <input type="file" name="fname1"> </p>
		</div>    
 	 	 <input type="submit" value="등록">
 	  </form>
	</table> 
</body>
</html>