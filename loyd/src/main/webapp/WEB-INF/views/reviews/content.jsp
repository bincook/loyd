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

// 창킬때 조회수 증가
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




</script>


</head>
<body onload='resizeWindow(this)'>

	<div id="content">
		<table width="400" height="400" align="center" border="1">

			<tr>
				<td colspan="3" align="center">
					<img width="200" height="200"
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
					<p>${reviews.member_id }
				</td>
			</tr>
			<tr>
				<td colspan="2">후기내용
					<p>${reviews.content }</td>
			</tr>
			<tr>	
				<td>
					<a id="close" href="javascript:del_content()">삭제하기</a>
				</td>
				<td>
					<a href="update?review_id=${reviews.review_id }">수정하기 </a>				
				</td>
				<td>
					<a href="javascript:cnt_readnum()">창닫기</a>
				</td>
			</tr>
		</table>		
	</div>
	

	<!-- bs4 -->
	<!-- <div class="card" style="width:400px"> -->
	<!--   <img class="card-img-top" src="/loyd/resources/img/22.PNG" alt="Card image"> -->
	<!--   <div class="card-body"> -->
	<!--     <h4 class="card-title">별점</h4> -->

	<!--     <p class="card-text">시계 아이디</p> -->
	<!--     <p class="card-text">내용 1</p> -->
	<!--     <p class="card-text">내용 2</p> -->
	<!--     <a href="#" class="btn btn-primary">See Profile</a> -->
	<!--   </div> -->
	<!-- </div> -->


	<!-- 댓글 -->	
	<div >
	<table width="300" border="1"> <!-- align="bottom" -->
		<!-- 회원만 작성가능, 본인만 삭제 수정 가능함 -->
		<tr>
			<th>작성자</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>댓글내용</th>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
		</tr>
	
	
	</table>
	</div>
	
	
	
	
<!-- 	<div style="width:200px; height:150px; border:1px solid red; float:left;"> -->
<!-- 		첫번째 영역: -->
<!-- 		왼쪽에 위치시킴 =>  float:left -->
<!-- 		여기에 그림이나 글자 또는 광고 등을 넣음 -->
<!-- 	</div> -->
<!-- 	<div style="width:200px; height:150px; border:1px solid green; float:left;"> -->
<!-- 		두번째 영역: -->
<!-- 		첫번째 영역 옆에 나란히 붙임 => float:left -->
<!-- 		여기에 그림이나 글자 또는 광고 등을 넣음 -->
<!-- 	</div> -->
	
	
	
	
	
	
	
	
	
	

</body>
</html>


