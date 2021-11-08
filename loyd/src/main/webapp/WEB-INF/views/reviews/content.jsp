<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#content {
	height: 200px;
	padding-top: 50px;
}
#like {
	padding-top: 570px;
/* 	height: 700px; */
	text-align: center;	

}

</style>

<script >

function del_content() {
	// 창을 닫을때 삭제여부 묻고 '예 ' 클릭하면 삭제되고 창 자동 새로고침.	 
	window.opener.location.reload();

	if (confirm("정말 삭제하시겠습니까?")) {	
		$.post('delete?review_id=${reviews.review_id}', function( data ) {
			window.opener.location.reload() // opener 부모 새로고침
			window.close()  // 자기창을 닫아라	
		}
	)};
}

//버튼 누르면 부모 새로고치고 자기창 닫기
function cnt_readnum() {
	window.opener.location.reload() // opener 부모 새로고침
	window.close()  // 자기창을 닫아라	
};

// // 창킬때 조회수 증가
// 	opener.document.location.reload();

// 창끌때 조회수 증가
onbeforeunload = function() {  // beforeunload 이벤트	
	opener.document.location.reload();
}


// 윈도우 창크기 변경하기(실패)
function resizeWindow(win)    {
	var wid = win.document.body.offsetWidth + 700;
	var hei = win.document.body.offsetHeight + 600;        //30 과 40은 넉넉하게 하려는 임의의 값임
	win.resizeTo(wid,hei);
}

function moveTologin(){
	alert('추천을 하시려면 로그인이 필요합니다')
}


</script>


</head>
<body onload='resizeWindow(this)'>

	<div align="center" id="content"><!-- style="display: inline-block"  -->
		<table width="600" height="550" align="center" border="1" >

			<tr>
				<td colspan="3" align="center">
					<img width="300" 
					src="<c:url value="/${reviews.path}/${reviews.name }" />"
					onerror="this.src='/loyd/resources/watch_errimg.png'; 
								this.style.width='200px';">
				</td>
			</tr>
			<tr>
				<td>작성일
					<p>${reviews.writeday }
				</td>
				<td colspan="2">구매한 시계
					<p>${reviews.watch_id }
				</td>
			</tr>
			<tr>
				<td rowspan="2" style="color: gold; text-shadow: 0.5px 0.5px #c60;">
					<c:forEach begin="1" end="${reviews.rate }">
					★
					</c:forEach> <c:forEach begin="1" end="${5-reviews.rate }">
					☆
					</c:forEach>
				</td>
				<td colspan="2">작성자
					<p>${reviews.name }
				</td>
			</tr>
			<tr>
				<td colspan="2">후기내용
					<p>${reviews.content }</td>
			</tr>
			
			<!-- 로그인값과 일치할 경우에만 수정, 삭제 버튼이 보이기 -->
			<tr>
<%-- 				<c:if test="${memberId != null }" > --%>
				<c:if test="${memberId == reviews.member_id}" >  <!-- 세션에 저장된 값 == 리뷰를 쓴 사람의 member_id -->
					<td align="center">
						<a class="btn" style="background-color:#FCFF71;" id="close" href="javascript:del_content()">삭제하기</a>
					</td>
					<td align="center">
						<a class="btn" style="background-color:#FCFF71;" href="update?review_id=${reviews.review_id }">수정하기 </a>				
					</td>
				</c:if>
					<td colspan="3" align="right">
						<a class="btn btn-primary" href="javascript:cnt_readnum()">창닫기</a>
					</td>
			</tr>
			
			<!-- 좋아요 기능 -->
			<tr>
				<td colspan=2 align="center">
					<!-- 비회원인 경우 -->
					<c:if test="${isliked == false && email == null }">
						<a onclick = "javascript:moveTologin()" style="color:red">
							♡♡♡&nbsp;&nbsp;&nbsp;&nbsp;
						</a>
					</c:if>
					<!-- 회원이지만 좋아요를 하지 않은 경우 -->
					<c:if test="${isliked == false && email != null}">
						<span>
							<a href="like?reviewId=${reviews.review_id }" style="color:red">
								♡♡♡&nbsp;&nbsp;&nbsp;&nbsp;
							</a>
						</span>
					</c:if>
					<!-- 회원이면서 좋아요를 한 경우 -->
					<c:if test="${isliked == true }">
						<span>
							<a href="like?reviewId=${reviews.review_id }" style="color:red">
								♥♥♥&nbsp;&nbsp;&nbsp;&nbsp;
							</a>
						</span>	
					</c:if>
					<span>총 좋아요 개수 ${likeCount }개 </span>
				
				</td>
			</tr>

			
		</table>		
	</div>
	

</body>
</html>


