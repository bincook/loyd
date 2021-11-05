<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		border: 2px dotted #FFD9EC;
	}
	
	.gray3 {
		color: #949494
	}
	
	.dot {
		border: 1px dotted #FFD9EC;
	}
</style>
<script>
	function secret_qna() {
		document.getElementById("secret_pwd").style.visibility = "visible";
	}
	function answer() {
		document.getElementById("answer_email").style.visibility = "visible";
	}
	function check() {
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
</script>
</head>
<body>
	<div id=holder>
		<form method="post" action="insert_ok">
			<input type="hidden" name="watch_id" value="${watch_id}">
			<!--상품 상세의 id값  -->
			<div id="first">
				<div id="left">
					<input class="btn btn-outline-secondary" type="reset" value="수정취소">
				</div>
				<div id="sub">문의내용 작성</div>
				<div id="right" class="form-group">
					<input class="btn btn-primary" type="submit" value="작성완료">

				</div>
			</div>
			<table border="1" align="center" class="dot">
				<tr align="center">
					<sapn class="gray3">문의유형 선택!</sapn>
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
				<div onclick="check()">
					<input type="checkbox" name="secret" value="1"
						onclick="secret_qna()">비밀글로 문의하기
					<p>
					<div id="secret_pwd" style="visibility: hidden">

						<div id="ctn_show" class="gray3">
							<div class="form-group">
								<input class="form-control" type="password" name="pwd"
									placeholder="비밀번호를 입력해주세요" size="30"><br>
							</div>
							<input class="btn btn-outline-info" type="button" value="입력확인"><br>
							나중에 답변 확인 시 방금 입력한 비밀번호와 일치해야 답변내용을 볼 수 있어요^^!
						</div>
					</div>
					<p>
				</div>

			</tr>
			<div onclick="check2()">
				답변완료시 알림받으시겠어요?
				<p>
					<input type="checkbox" name="emailChk" onclick="answer()">email로
					알림받기
				<div id="answer_email" style="visibility: hidden">
					<div id="ctn_show2">
						<div class="form-group">
							<input class="form-control" type="text" name="email"
								placeholder="답변받을  email주소를 입력해주세요" size="30">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>