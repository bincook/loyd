<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  body{
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
 margin:auto;
 border-radius:10px;
 box-shadow:inset 1px 1px rgba(0, 0, 0, .1); 
 }
</style> 
</head>
<body>
  <div>
	<table border="1">
	 <header>상품등록</header>
	  <form method="post" action="upload_ok" enctype="multipart/form-data">
	  	<input type="text" name="name" placeholder="상품명"><p>
	  	<input type="text" name="brand" placeholder="브랜드"><p>
		<input type="text" name="price" placeholder="가격"><p>
	    <input type="text" name="category" placeholder="공용,여성,남성"><p> 
	    <textarea name="content" cols="30" rows="5" placeholder="상품정보"></textarea><p>
    	<input type="number"  min="0" max="1" step="0.1" name="discount" placeholder="할인가격"><p>
     	<input type="text" name="kind" placeholder="가죽"><p>
		<input type="file" name="picture"> </p>
		
 	 	<input type="submit" value="등록">
 	  </form>
	</table> 
  </div>	
</body>
</html>