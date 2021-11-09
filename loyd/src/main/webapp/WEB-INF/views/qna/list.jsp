<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA list</title>
<style>
body {
	font-size: 10px;
}

#first #left, #first #right {
	display: inline-block;
}

#first #right {
	align: right;
}

.dote {
	width: 150px;
	border-bottom: 2px dotted pink;
}

</style>
<script>
	function choice(opt) {
		opt;
	}

	function check() {

		var checkedInput = $("input:checked")
		if (checkedInput.val()) {
			$('.secret').css('display', 'none')
		} else {
			$('.secret').css('display', 'initial')
		}
	}

	function secret_view(target) {
		target.children[0].style.display = "initial";
	}
	
	function list_check(target, pwd) {
		var password = target.value;
	
		if (password == pwd) {
			target.parentElement.nextElementSibling.style.display = "initial";
			alert(password);
		}
	}

</script>

</head>
<body>
	<ul class="nav nav-tabs">
		<li class="nav-item"><a
			class="nav-link <%=request.getAttribute("nav_type") != "list" ? "active" : ""%>"
			data-toggle="tab" href="#detail">상세정보</a></li>
		<li class="nav-item"><a
			class="nav-link <%=request.getAttribute("nav_type") == "list" ? "active" : ""%>"
			data-toggle="tab" href="#list">Q&A</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#zxc">채팅상담</a></li>
	</ul>
	<div class="tab-content">

		<div
			class="tab-pane fade  <%=request.getAttribute("nav_type") != "list" ? "show active" : ""%> "
			id="detail">
			<!-- include  상세 이미지   소스넣기 -->
		</div>

		<div
			class="tab-pane fade <%=request.getAttribute("nav_type") == "list" ? "show active" : ""%>"
			id="list">
			<div class="form-group">
				<a href="write"><input class="btn btn-primary" type="button"
					value="상품 문의하기"></a>
			</div>
			<p>
			<div id="first">
				<div id="left">
					<form name="qna" >
						<input type="checkbox" name="secret" onclick="check()">
						비밀글 제외
				</div>
				<div id="right">
					<select onchange="choice(this.value)">
						<option>문의유형</option>
						<option>상품</option>
						<option>배송</option>
						<option>반품/취소</option>
						<option>교환/변경</option>
						<option>기타</option>
					</select>
				</div>

			</div>
			<c:forEach items="${list}" var="list">
			
				<!--   <자물쇠 아이콘> -->
				<!-- 	체크박스가 체크되면 안보이게 -->
				<div id="ctn_show" class="dote">
					<c:if test="${list.secret == 1}">
						<div class="secret"  onclick="secret_view(this)" >
							<div id="secret_pwd" style="display: none" class="dote_box">
								<!-- qna id값 -->														
								<input type="password" name="password"
									placeholder="문의당시 입력한 비밀번호에요^^" onkeyup="list_check(this, '${list.pwd}')" size="22">  </br>
								<!--사용자가 방금 입력한 pwd를 함수로  -->
								</form>
							</div>
							<div id="show_text" style="display: none">
							${list.qnatype}비밀글<br> 내용 : ${list.content} <br></div>
							${list.email.substring(0,list.email.indexOf("@")-2)}****/${list.writeday}
						
						</div>
					</c:if>
				</div>
				<!-- 	체크박스 해제하면 모두 보이게 : 기본뷰 -->
				<!--  <돋보기 아이콘> -->
				<c:if test="${list.secret == 0}">
	  	${list.qnatype}	  일반글  <br>
	  	내용 :  ${list.content} <br>
	  	${list.email.substring(0,list.email.indexOf("@")-2)}****/${list.writeday}
	</c:if>
			</c:forEach>

			<!-- 현재 페이지 기준 이전 10페이지 이동 -->
			<c:if test="${pstart !=1 }">
				<a href="list?page=${page-1}&nav_type=list"> ◀ </a>
			</c:if>
			<c:if test="${pstart == 1}">
    	◀
   </c:if>

			<!-- 현재페이지 이전 1페이지 이동 -->
			<c:if test="${page != 1}">
				<a href="list?page=${page-1}&nav_type=list"> < </a>
			</c:if>
			<c:if test="${page == 1}">
	 <
	</c:if>

			<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<!-- 현재페이지 색은 다르게 => 빨강 -->
				<c:if test="${page != i}">
					<a href="list?page=${i}&nav_type=list">${i}</a>
				</c:if>
				<c:if test="${page == i}">
					<a href="list?page=${i}&nav_type=list" style="color: red">${i}</a>
				</c:if>
			</c:forEach>

			<!-- 현재페이지 기준 다음1페이지 이동 -->
			<c:if test="${page != page_cnt}">
				<a href="list?page=${page+1}&nav_type=list"> > </a>
			</c:if>
			<c:if test="${page == page_cnt}">
  	  >
  	</c:if>

			<c:if test="${page_cnt != pend}">
				<a href="list?page=${pend+1}&nav_type=list"> ▶ </a>
			</c:if>
			<c:if test="${page_cnt == pend}">
  	 ▶
  	 </c:if>

		</div>
	</div>
</body>
</html>