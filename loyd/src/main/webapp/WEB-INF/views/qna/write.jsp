<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
<style>
	#holder {
		font-size: 14px;
		width: 800px;
		margin: auto;
		padding: 10px;
		text-align: center;
		border-radius: 10px;
		box-shadow: 0px -2px 13px 0px green;
	}
	
	#first #left, #first #sub, #first #right {
		display: inline-block;
		width: 200px;
	}
	
	#first #left {
		margin: left;
	}
	
	#first #sub {
		align: center;
		font-weight: 900;
		font-size: 24px;
	}
	
	#first #right {
		align: right;
	}
	
	tr {
		height: 100px;
	}
	
	td {
		width: 100px;
		border: 3px dotted #FFD9EC;
	}
	
	.gray3 {
		color: #949494
	}
	
	.dot {
		border: 3px dotted #FFD9EC;
	}
	.word{
	word-spacing:10px;
	}

</style>
<script>
	function secret_qna(target) {
		
		if (target.value == 0) {
			target.value = 1
			document.getElementById("secret_pwd").style.visibility = "visible";
		} else {
			target.value = 0
			document.getElementById("secret_pwd").style.visibility = "hidden";
		}
	
	}
	function answer() {
		document.getElementById("answer_email").style.visibility = "visible";
	}
	function check() {
		console.log('실행중')
		var checkedInput = $("input:checked")
		if (checkedInput.length < 1) {
			document.getElementById("ctn_show").style.visibility = "hidden";
		} else {
			document.getElementById("ctn_show").style.visibility = "visible";
			$('#chkBox:checked').each(function() {
				alert($(this).val());
			});
		}
	}
	function check2() {
		var checkedInput = $("input:checked")
		if (checkedInput.length < 1) {
			document.getElementById("ctn_show2").style.visibility = "hidden";
		} else {
			document.getElementById("ctn_show2").style.visibility = "visible";
			$('#chkBox:checked').each(function() {
				alert($(this).val());
			});
		}
	}
	function check3() {
		var checkedInput = $("input:checked")
		if (checkedInput.length < 1) {
			document.getElementById("ctn_show3").style.visibility = "hidden";
		} else {
			document.getElementById("ctn_show3").style.visibility = "visible";
			document.getElementById("ctn_show4").style.visibility = "hidden"; 
			$('#chkBox:checked').each(function() {
				alert($(this).val());
			});
		}
	}
/* 	pwd 안내문구 */
	function text(){
		document.getElementById("text_view").style.visibility = "visible"; 		
	}
	
/* 유효성검사하고싶은.. 	 
		 
		 function check_email(){ 
			 var chk=new XMLHttpRequest();
			 var radio=document.qna.user_id.value; // email
		 	chk.open("get","/mber/check?email="+email); //mbercontroller에서 email check!
		 	chk.send();	
			chk.onreadystatechange= function()
			{
			if(chk.readyState==4)
				{
				alert(chk.responseText);
				if(chk.responseText==1)
					{
					alert(" 유")
					document.getElementById("text_view").InnerText="";
					}
				else
					{
					alert("없어요")					
					}
				}
			}
		}
}
*/
/* 	회원인 경우 라디오 체크 시 메일주소 세팅 */
 $(function(){
	  $('input[type="radio"]').click(function(){
	    if ($(this).is(':checked'))
	    {   	
			document.getElementById("yes").style.display = "table-row";
			document.getElementById("no").style.display = "none";
	    }
	  });
	});

/* form 유효성 검사 */
function chk6(){

	var form  = document.qna;
	
	// 기본 이메일 
	var email = form.email.value
	
	// 다른 이메일로 받기 체크
	if ("${email}" && form.user_email.checked) {
		email  = form.user_email2.value
	}
	
	if (!$('input:radio:checked').length) {
		alert('문의유형을 선택해주세요')
	} else if(!form.title.value){
		alert("제목을 써주세요.");
	}else if(!form.content.value){
		alert("내용을 써주세요");
	} else if (email.indexOf('@')==-1){
		alert('이메일 작성하지 않았거나 올바르지 않습니다')		
	}else{
		form.submit();
	}
}


</script>
</head>
<body>

	<div id=holder>
		<form name="qna" method="post" action="insert_ok">

			<input type="hidden" name="watch_id" value="<%= request.getParameter("id") %>"/>	

			<!--상품 상세의 id값  -->
			<div id="first">
				<div id="left">
					<input class="btn btn-outline-secondary" type="reset" value="작성취소">
				</div>
				<div id="sub">문의내용 작성</div>
				<div id="right" class="form-group">
					<input class="btn btn-primary" type="button"  id ="abcd" onclick = "chk6()" value="작성완료">

				</div>
			</div>
			<table border="1" align="center" class="dot">
				<tr align="center">
					<sapn class="gray3">문의유형 선택!?</sapn>
					<td><i class="bi bi-smartwatch"></i><br> 상품<input
						type="radio" name="qnatype" value="상품"></td>
					<td><i class="bi bi-truck"></i><br> 배송<input type="radio"
						name="qnatype" value=" 배송"></td>
					<td><i class="bi bi-calendar-x-fill"></i><br>반품/취소<input
						type="radio" name="qnatype" value="반품/취소"></td>
					<td><i class="bi bi-arrow-repeat"></i><br>교환/변경<input
						type="radio" name="qnatype" value="교환/변경"></td>
					<td><i class="bi bi-three-dots"></i><br> 기타<input
						type="radio" name="qnatype" value="기타"></td>
			</table>
			</tr>
			<br>
			<p>
			<div class="form-group">
				<input class="form-control" type="text" name="title"
					placeholder="제목">
				<p>
			</div>

			<div class="form-group">
				<textarea class="form-control" name="content"
					placeholder="문의유형을 선택 후 궁금하신 내용을 적어주세요" cols="40" rows="5"></textarea>
			</div>

			<tr height="50">
				<div>
					<input type="checkbox" name="secret" value="0"
						onclick="secret_qna(this)">비밀글 문의
					<p>
					<div id="secret_pwd" style="visibility: hidden">

						<div id="ctn_show" class="gray3">
							<div class="form-group">
								<input class="form-control" type="password" name="pwd"
									placeholder="비밀번호를 입력해주세요" size="30"><br>
							</div>

							<input class="btn btn-outline-info" type="button" value="입력확인" onclick="text()"><br>
			
						<div id="text_view" style="visibility: hidden">나중에 답변 확인 시 방금 입력한 비밀번호와 일치해야 답변내용을 볼 수 있어요^^</div>	
						</div>
					</div>
					<p>
				</div>
			</tr>

<div >

<c:if test="${email!=null}">			
				<div class="form-group" >
			<input class="form-control" type="text" name="email" value="${email}" id="ctn_show4" placeholder="답변받을 email주소를 입력해주세요" size="30"> <br>
					<span class="mail_check"></span>	
				</div>	
					<input type="checkbox" name="user_email" id="user_email" onclick="check3()">다른 이메일로 답변받기<p>	
					<input class="form-control" type="text" name="user_email2" id="ctn_show3" placeholder="답변받을 email주소를 입력해주세요" size="30" style="visibility: hidden"> <br>
</c:if>		
 <%-- 	
 <c:if test="${email!=null}">			
				<div class="form-group" ><a href="check"></a>
			<input class="form-control" type="text" name="email" id="no" placeholder="답변받을 email주소를 입력해주세요" size="30"> <br>
					<span class="mail_check"></span>	
				</div>	
					<input type="radio" name="user_email" value="0" id="radio_mail">등록된 이메일로 받기<p>	
					<input class="form-control" type="text" name="user_email2" id="yes" placeholder="${email}" size="30" style="display:none"> <br>
</c:if>	
--%>	
<c:if test="${email==null}">		
			<div class="form-group" ><a href="check"></a>
			<input class="form-control" type="text" name="email" placeholder="답변받을 email주소를 입력해주세요"  id ="ctn_show10" size="30" ><br>
					<span class="mail_check"></span>	 
				</div>	
</c:if>	

</div>
			
			<div onclick="check2()">
					<input type="checkbox" name="emailChk" onclick="answer()">답변완료시 카톡으로 알림받기
				<div id="answer_email" style="visibility: hidden">
					<div id="ctn_show2">
						<div class="form-group">
							<input class="form-control" type="text" name="email2"
								placeholder="알림받을  카톡id 또는 전화번호를 입력해주세요" size="30">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>