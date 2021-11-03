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

#top {
	padding top: 200px;
}


</style>


<script>
	// 제이쿼리를 이용하여 별의값 구하기
	window.onload = function () {
//	 	<input type="radio" id="5-star" name="rate" value="5" /><label for="5-star" title="Amazing">5 stars</label>
		// 0. <input radio> 를 변수에 담는다
		var update_rate = $("input:radio")  // 배열
		
		var rate = "${update_dto.rate}"
		
			
		update_rate.each(function(index, input) {  // 인덱스
			console.log(index, '|', input.value)  // console.log == jquery 에서 프린트 해보는 문법 
			if (rate === input.value) {
	 			$(input).prop('checked', 'checked')  // property 구역, 재산, 소유물
//	 			input.checked = true
				return
			}
		});
				
		// 1. <input radio> value = rate 와 같은 경우
		// 변수에 값이 담겨있는 상태
		// value가 input box와 같으면 checked 로직 추가
		// 
		
		
		
		// 2. 해당 <input radio> 에 checked="checked" 옵션을 준다
		
	}
</script>

</head>
<body>
	

    <div class="container bg-light" style="height: 800px;" id="top">
        <form name="updateForm" method="post" action="update_ok" enctype="multipart/form-data">
        <input type="hidden" name="review_id" value="${update_dto.review_id }">
        
                 
            <table class="table table-bordered" style="padding-top:500px">
					 <tr>
						 <!-- 나중에 hidden 으로 감싸주거나 상품 아이디를 뿌려줄 때 -->
						 
			                 <td>구매한 시계</td>
			                 <!-- 나중에 value 부분만 ${watch_id} 로 바꿔주면 될 것 같아요 -->
			                 <!-- 마이페이지 주문내역목록 ( watch_id ) -> 에서 - > 구매후기 write ( watch_id ) 넘겨주기 -->
			                 <td colspan="3"><input name="watch_id" value="659">
			                 	${watchId}
			                 </td>    
                	</tr>
	                <tr>
		                    <td>작성자</td>
		                    <td colspan="3"><input name="" disabled="disabled" value="${email }" placeholder="작성자 아이디 넣기"></td>  
	                </tr>
	                <tr>
	                    <td>만족도</td>  
	                    <td colspan="3" style="color:gold; text-shadow: 0.5px 0.5px #c60;">
	                    
	                    
		                    <ul class="rate-area pl-0 mb-0">
							  <input type="radio" id="5-star" name="rate" value="5" /><label for="5-star" title="Amazing">5 stars</label>
							  <input type="radio" id="4-star" name="rate" value="4" /><label for="4-star" title="Good">4 stars</label>
							  <input type="radio" id="3-star" name="rate" value="3" /><label for="3-star" title="Average">3 stars</label>
							  <input type="radio" id="2-star" name="rate" value="2" /><label for="2-star" title="Not Good">2 stars</label>
							  <input type="radio" id="1-star" name="rate" value="1" /><label for="1-star" title="Bad">1 star</label>
							</ul>
	                    
	                    
<%-- 		                    <c:forEach begin="1" end="${update_dto.rate }"> --%>
<!-- 		                    	★ -->
<%-- 		                    </c:forEach> --%>
<%-- 		                    <c:forEach begin="1" end="${5-update_dto.rate }"> --%>
<!-- 		                    	☆ -->
<%-- 		                    </c:forEach> --%>




						</td>
	                </tr>
	                <tr>
	                    <td>이미지 첨부하기</td>
	                    <div id="imgAcd">
<!-- 	                    <td><input type="file" name="iname1"></td> -->
							<td>
								<img wdith="100" height="50"  
						        			src="<c:url value="/${review.path }/${review.name }" />"  
						        			onerror="this.src='/loyd/resources/watch_errimg.png'; this.style.width='50px';" >
					        		
								<p class="iname"><input type="file" name="name" value="imgtest"></p>
							</td>
	                        
	                        <td><input type="button" onclick="add()" value='사진추가'></td>
	                        <td><input type="button" onclick="del()" value='사진삭제'></td>               
	                    </div>
	                </tr>
	                <tr>
	                    <td>내용</td>
	                    <td colspan="3">
	                        <textarea id="textarea" cols="110" name="content" rows="5" placeholder="후기를 입력해주세요">${update_dto.content }</textarea>
	                    </td>
	                </tr>
	                
	               
            </table>
            <div align="center">
                   <a class="btn btn-primary" href="javascript:document.updateForm.submit()">
                   
                   		 수정 완료하기
                    </a>
                    <a class="btn btn-outline-primary" href="javascript:history.back()">
                    	뒤로가기
                    </a>
            </div>
        </form>
    </div>



</body>
</html>