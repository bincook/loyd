<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	

	function chk(){
		var a = document.pkc;
		if(a.email.value.indexOf('@')==-1){
			alert("이메일 형식에 맞게 입력하세요");
			
		}else if(a.name.value.length >10 || a.name.value.length <2 ){
			alert("이름을 2~10자로 입력하세요");
		}else if(a.phone.value==""){
			alert("핸드폰번호를 입력하세요");
		}else if(a.pwd.value==""){
			alert("비밀번호를 입력하세요")
		}else if(a.pwd.value!=a.pwd2.value){
			alert("비밀번호가 같지 않습니다.")
		}else{
			document.pkc.submit();
		}
	}
	
	function pwdchk(){
		
		var pwd = document.pkc.pwd.value;
		var pwd2 = document.pkc.pwd2.value;
		
		if(pwd==pwd2){
			document.getElementById("pwdchk").innerHTML="<br><b>사용 가능한 비밀번호입니다.</b>";
		}else{
			document.getElementById("pwdchk").innerHTML="<b style='color:red;'>비밀번호가 다릅니다.</b>";
		}
		
	}
	
	function check(){
		var chk = new XMLHttpRequest();
		var email = document.pkc.email.value;
		if(email.length!=0){
		chk.open("get","check?email="+email);
		chk.send();
		chk.onreadystatechange=function(){
			if(chk.readyState==4){
				if(chk.responseText==0){
					document.getElementById("email_chk").innerHTML="사용 가능한 아이디입니다.";
					document.pkc.email_check.value=0;
				}else{

					document.getElementById("email_chk").innerHTML="<b style='color:red;'>중복된 아이디입니다.</b>";
					document.pkc.email_check.value=1;
				}
			}
		  }
		}
	}

	
	
	
</script>
</head>
<body>
	<form name="pkc" method="post" action="join_ok" >
	<c:if test="{chk==1}">
		<span style="color:red;">중복되는 이메일이 입력되었습니다</span>
	</c:if><p>
		<input type="hidden" name="email_check" value="1">
		이메일<input type="text" name="email" placeholder="이메일을 작성하세요" onblur="check()">
		<input type="button" value="이메일 조회" onclick="check()">
		<div id="email_chk"></div>
		<p>
		이름<input type="text" name="name" placeholder="이름을 작성하세요"><p>
		핸드폰번호<input type="text" name="phone" placeholder="핸드폰번호를 작성하세요"><p>
		비밀번호      <input type="password" name="pwd" placeholder="비밀번호를 작성하세요"><p>
		비밀번호     <input type="password"  name="pwd2" placeholder="비밀번호 재확인" onkeyup="pwdchk()"><div id="pwdchk"></div>
		<p>
		<input type="button" value="가입하기" onclick="chk()">
	</form>


</body>
</html>