<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 정보 수정</title>

<style>
#container {
	width: 880px;
	margin: auto;
	padding: 0;
}

#container #edit-form {
	padding: 160px 20px 200px;
}

#edit-form #edit-main-title {
	padding: 0 0 20px 10px;
}
#edit-form #edit-main-title span {
	font-size: 36px;
	font-weight: bold;
	font-family: ;
	letter-spacing: -0.1em;
}

#edit-main-content #edit-sub-title {
	padding: 0 0 5px 10px;
}

#edit-main-content #edit-sub-title span {
	font-size: 20px;
	font-weight: bold;
	font-family: ;
	
}

#edit-main-content #edit-sub-content #edit-user-header {
	display: flex;
	flex-direction: row;
	border-bottom: 1px solid #eee;
}

#edit-main-content #edit-sub-content #edit-user-header:first-child {
	border-top: 2px solid #333;
}

#edit-sub-content #edit-user-header #edit-user-name-header,
#edit-sub-content #edit-user-header #edit-user-pwd-header,
#edit-sub-content #edit-user-header #edit-user-phone-header,
#edit-sub-content #edit-user-header #edit-user-email-header {
	width: 20%;
	background: #f3f3f3;
	padding: 12px 0 12px 20px;
	font-size: 12px;
	font-weight: bold;
	
}

#edit-sub-content #edit-user-header #edit-user-name,
#edit-sub-content #edit-user-header #edit-user-pwd,
#edit-sub-content #edit-user-header #edit-user-phone,
#edit-sub-content #edit-user-header #edit-user-email {
	padding: 8px 0 8px 20px;
}

#edit-sub-content #edit-user-header #edit-user-pwd {
	padding: 6px 0 0 20px;
}

</style>

</head>
<body>

<div id="container">
	<div id="edit-form">
		<div id="edit-main-title">
			<span> 회원정보 수정</span>
		</div>
		<div id="edit-main-content">
			<div id="edit-sub-title">
				<span> 기본 정보</span>
			</div>
			
			<div id="edit-sub-content">
				<form method="post" action="member_edit_ok">
					<div id="edit-user-header">
						<div id="edit-user-name-header"> 이름</div>
						<div id="edit-user-name"> 
							<input type="text" name="name" value="${member.name }">
						</div>
					</div>
					
					<div id="edit-user-header">
						<div id="edit-user-pwd-header"> 비밀번호</div>
						<div id="edit-user-pwd"> 
							<button type="button"> 비밀번호 변경</button>
						</div>
					</div>
					
					<div id="edit-user-header">
						<div id="edit-user-phone-header"> 전화번호</div>
						<div id="edit-user-phone"> 
							<input type="text" name="phone" value="${member.phone }">
						</div>
					</div>
					
					<div id="edit-user-header">
						<div id="edit-user-email-header"> 이메일</div>
						<div id="edit-user-email">
							<input type="text" name="email" value="${member.email }">
						</div>
					</div>
					
					<div id="edit-button">
						<button type="submit"> 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>