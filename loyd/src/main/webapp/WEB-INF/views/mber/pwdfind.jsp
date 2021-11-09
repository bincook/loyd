<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="<c:url value="/resources/favicon.png" />" type="image/x-icon">
</head>
<body>
	<h1>비밀번호 찾기</h1>
  <form method="post" action="pwdfind_ok">
  <table>
  	<tr>
  		<td>이메일</td>
  		<td><input type="text" name="email"></td>
  	</tr>
  	<tr>
  		<td>이름</td>
  		<td><input type="text" name="name"></td>
  	</tr>
  	<tr>
  		<td colspan="2" align="center"><input type="submit" value="찾기"></td>
  	</tr>
  </table>
  </form>
  
</body>
</html>