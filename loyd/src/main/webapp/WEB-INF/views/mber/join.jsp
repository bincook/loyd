<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	.container2 {
		padding-left:700px;
		padding-top:90px;
	}
</style>

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

 <div class="container2">
 	<div class="col-lg-4"></div>
 	<div class="col-lg-4">
 		<div class="jumbotron" style="padding-top:20px;">
 			<form name="pkc" method="post" action="join_ok">
		 		<h1>회원가입</h1>
		 		<c:if test="{chk==1}">
					<span style="color:red;">중복되는 이메일이 입력되었습니다</span>
				</c:if><p>
		 		<div class="form-group">
		 			<input type="text" class="form-control" name="email" placeholder="이메일" onkeyup="check()">
		 		</div>
		 		<div id="email_chk"></div>
		 		
		 		<div class="form-group">
		 			<input type="text" class="form-control" name="name" placeholder="이름">
		 		</div>
		 		<div class="form-group">
		 			<input type="text" class="form-control" name="phone" placeholder="핸드폰번호">
		 		</div>

		 		<div class="form-group">
		 			<input type="password" class="form-control" name="pwd" placeholder="비밀번호">
		 		</div>
		 		
		 		<div class="form-group">
		 			<input type="password" class="form-control" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwdchk()">
		 		</div>
		 		<div id="pwdchk"></div>
		 		
		 		
				<input type="button" class="btn btn-primary form-control" value="가입하기" onclick="chk()">

	 		</form>
 		</div>
 	</div>
 	<div class="col-lg-4"></div>
 </div>
 

</body>
</html>