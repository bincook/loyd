<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
.rate-area {
  float: left;
  border-style: none;
}

.rate-area:not(:checked) > input {
  position: absolute;
  top: -9999px;
  clip: rect(0,0,0,0);
}

.rate-area:not(:checked) > label {
  float: right;
  width: 1em;
  padding: 0 .1em;
  overflow: hidden;
  white-space: nowrap;
  cursor: pointer;
  font-size: 200%;
  line-height: 1.2;
  color: lightgrey;
  text-shadow: 1px 1px #bbb;
}

.rate-area:not(:checked) > label:before { content: '★ '; }

.rate-area > input:checked ~ label {
  color: gold;
  text-shadow: 1px 1px #c60;
  font-size: 200% !important;
}

.rate-area:not(:checked) > label:hover, .rate-area:not(:checked) > label:hover ~ label { color: gold; }

.rate-area > input:checked + label:hover, .rate-area > input:checked + label:hover ~ label, .rate-area > input:checked ~ label:hover, .rate-area > input:checked ~ label:hover ~ label, .rate-area > label:hover ~ input:checked ~ label {
  color: gold;
  text-shadow: 1px 1px goldenrod;
}

.rate-area > label:active {
  position: relative;
  top: 2px;
  left: 2px;
}

</style>
<script>
// 검색기능을 위한 field, word 값 가져오기
window.onload=function() {
	document.search.field.value="${field}";
}

// 윈도우 content로 이동하기
function open_content (review_id) {
	var window2 = window.open('readnum?review_id='+review_id, '','width=700,height=900') // 모달 다이얼로그
} 


//윈도우 창크기 변경하기(실패)
function resizeWindow(win)    {
	var wid = win.document.body.offsetWidth + 700;
	var hei = win.document.body.offsetHeight + 600;        //30 과 40은 넉넉하게 하려는 임의의 값임
	win.resizeTo(wid,hei);
}

//로그안필요 alert 알림 띄우기
 function btn(){
	alert('로그인이 필요합니다')
}	
	
	
</script>


</head>
<body onload='resizeWindow(this)'>


	<!-- 타이틀 부분 -->
	    <table width="500" align="center" border="1">
			<div class="container">
			  <h2 class="mb-4" align=center>후기 게시판</h2>
			  <div align=center>텍스트 리뷰 / 포토리뷰  </div>
			  <div class="mb-3" align=center>200point / 500 point </div>
			</div>
		</table>

    <!-- 테이블 제목과 내용 -->      
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>글번호</th>
		        <th>시계이름</th>
		        <th width="110px">이미지</th>
		        <th width="150px">만족도</th>
		        <th width="150">작성자 아이디</th>
		        <th width="800px">내용</th>
		        <th width="500">추천수</th>
		        <th width="150">조회수</th>
		        <th width="150">작성일</th>
		      </tr>
		    </thead>
		    <tbody>
			    <c:forEach items="${reviews }" var="review">
					      <tr>
						        <td>${review.review_id}</td>
						        <td>${review.watch_id}</td>

						        <td><a href="javascript:open_content(${review.review_id})">


<!-- 						        	<a href=" javascript:function resizeWindow(win) "> -->
						        
						        		<img wdith="100" height="50"  
						        			src="<c:url value="/${review.path }/${review.name }" />"  
						        			onerror="this.src='/loyd/resources/watch_errimg.png'; this.style.width='50px';" >
					        		
					        		</a>


					        		</a>
						        </td>			        
						        <td style="color: gold; text-shadow: 0.5px 0.5px #c60;">
						   		       <c:forEach begin="1" end="${review.rate}"> 
									 	★
								       </c:forEach>
								       <c:forEach begin="1" end="${5-review.rate}"> 
									 	☆
								       </c:forEach>
						        </td>
						        <td>${review.mname}</td><!-- member_id말고 mname으로 가져오기 -->
								<td><a href="javascript:open_content(${review.review_id}); resizeWindow(win)">
									${review.content}
									</a>
								</td>
								<td style="color:grey;">${review.like }명에게 도움이 되었어요</td>
						        <td>${review.view}</td>
						        <td>${review.writeday}</td>
					      </tr>
			     
			      </c:forEach>
		    </tbody>
		</table>

	
	<!-- 페이징, search, 글쓰기버튼 테이블  -->
	  <table width="800px" align="center">
	    <tr>
	    	<td colspan="3" align="center">	    	
		    	<c:if test="${pstart !=1 }">				
					<a class="mr-2" href="list?page=${pstart-1 }&field=${field}&word=${word}">◀◀ </a>
				</c:if>
				<c:if test="${pstart ==1 }">	
					<a style="color:grey " >◀◀ </a>
				</c:if>
	
				
				<!-- 클릭시 현재 페이지 기준으로 이전 1페이지 이동 -->
				<c:if test="${page!= 1 }">	
					<a href="list?page=${page-1 }&field=${field}&word=${word}"> ◀ </a>
				</c:if>
				<c:if test="${page == 1 }">
					<a style="color:grey">◀ </a>
				</c:if>
				<!-- 현재 페이지 기준으로 이동할수 있는 페이지 -->
				<c:forEach begin="${pstart }" end="${pend }" var="i">		
				<!-- 현제 페이지 색은 다르게 => 빨강 -->
					<c:if test="${page !=i }">
						<a href="list?page=${i }&field=${field}&word=${word}">${i }</a>
					</c:if>
					<c:if test="${page ==i }">
						<a href="list?page=${i }&field=${field}&word=${word}" style="color:red">${i }</a>
					</c:if>	
				</c:forEach>			
					<!-- 클릭시 현재 페이지 기준 다음 1페이지 이동 -->
					<c:if test="${page != page_cnt }">
						<a href="list?page=${page+1 }&field=${field}&word=${word}" > ▶ </a>
					</c:if>
					
<%-- 					${page_cnt } (마지막 페이지 몇인지 궁금할때 실행시켜보는거)					 --%>			

					<c:if test="${page == page_cnt }">
						<a> ▶ </a>
					</c:if>		
					<!-- 클릭시 현재 페이지 기준 다음 10페이지 이동 -->
					<c:if test="${pend !=page_cnt }">		
						<a class="ml-2" href="list?page=${pend+1 }&field=${field}&word=${word}">▶▶</a>			
					</c:if>	
					
					<c:if test="${pend == page_cnt }">
						<a style="color:grey">▶▶</a>
					</c:if>	
				</td>
			</tr>
	

	     	
	  <!-- search 기능 -->
			<tr>
				<!-- 로그인 했을때 -->
		  		<c:if test="${id != null }" >
			  		<td><a class="btn btn-primary" href="write">리뷰 작성하기</a></td>
	  				
	  				<td height="100px" style=padding-top:15px;>					
				    	<form name="search" method="post" action="list">		    	
				    		<select name="field">
				    			<!-- 나중에 마이페이지 주문내역목록 ( watch_id ) -> 받아서 
				    				시계이름에 ( watch_id ) 넘겨주기 -->
				    			<option value="watch_id">시계이름</option>
				    			<option value="content">내용</option>
				    			<option value="member_id">작성자</option>
				    		</select>
				    		<input type="text" name="word" value="${word }">
				    		<input type="submit" value="검색">
						</form>	
					</td>
				</c:if>
				<!-- 비로그인일때 -->
				<c:if test="${id == null }" >
			  		<td><a class="btn btn-primary" onclick="javascript:btn()" href="../mber/login"> 리뷰 작성하기</a></td>
	  				
	  				<td height="100px" style=padding-top:15px;>					
				    	<form name="search" method="post" action="list">		    	
				    		<select name="field">
				    			<!-- 나중에 마이페이지 주문내역목록 ( watch_id ) -> 받아서 
				    				시계이름에 ( watch_id ) 넘겨주기 -->
				    			<option value="watch_id">시계이름</option>
				    			<option value="content">내용</option>
				    			<option value="member_id">작성자</option>
				    		</select>
				    		<input type="text" name="word" value="${word }">
				    		<input type="submit" value="검색">
						</form>	
					</td>
	  			</c:if>		
					
					
			</tr>	
			
			
	</table>
	

		


</body>
</html>




