<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 <h1>로그인 페이지</h1>
 <form method="post" action="login_ok">
		이메일<input type="text" name="email"><p>
		비밀번호<input type="password" name="pwd"><p>
		<input type="submit" value="로그인">
 </form>
 <a href="join">회원가입</a>
 <a href="javascript:emailfind();">이메일찾기</a>
 <a href="javascript:pwdfind();">비밀번호찾기</a>
</body>
</html>