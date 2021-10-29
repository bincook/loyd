<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
<title>Insert title here</title>
<style>
	.container2 {
		padding-left:700px;
		padding-top:100px;
	}
</style>

<script>
	function emailfind(){
		window.open("emailfind","","width=400,height=350");
	}
	
	
	function pwdfind(){
		window.open("pwdfind","","width=400,height=350")
	}
	
	
</script>
</head>
<body>
 <div class="container2">
 	<div class="col-lg-4"></div>
 	<div class="col-lg-4">
 		<div class="jumbotron" style="padding-top:20px;">
 			<form method="post" action="login_ok">
		 		<h1>로그인 페이지</h1>
		 		<div class="form-group">
		 			<input type="text" class="form-control" name="email" placeholder="이메일">
		 		</div>
		 		<div class="form-group">
		 			<input type="password" class="form-control" name="pwd" placeholder="비밀번호">
		 		</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
				 <a href="javascript:emailfind();">이메일찾기</a>
				 <a href="javascript:pwdfind();">비밀번호찾기</a><p>
				 <a href="join" style="align:center;">회원가입</a>
	 		</form>
 		</div>
 	</div>
 	<div class="col-lg-4"></div>
 </div>
 
 
</body>
</html>