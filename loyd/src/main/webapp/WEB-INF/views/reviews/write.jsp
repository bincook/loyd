<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매후기</title>


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


<!-- <script> src = "http://code.jquery.com/jquery.js"></script>
<script>
	var size=1;
	function add() {
		size ++;
		var imgAcd = document.getElementById("imgAcd");
		imgAcd.innerHTML = imgAcd.innerHTML + "<p class='iname'><input type='file' name='iname"+size+"'></p>";
	}
	function del() {
		if(size>1) {
			${".iname"}.eq(size-1).remove();
			size--;
		}
	}

</script> -->





</head>
<body>

    <div class="jumbotron">
        <h1> {watch} 구매후기 </h1>
        <p> {watch}에서 구매하신 상품에 대한 고객님의 따뜻한 후기를 남겨주세요.</p>
      </div>
    <div class="container bg-light" style="height: 800px;">
        <form name="writeForm" method="post" action="write_ok" enctype="multipart/form-data">
                 
            <table class="table table-bordered">
	                <tr>
	                    <td >제목</td>
	                    <td colspan="3"><input type="text" name="title" size="100" placeholder="제목을 작성해주세요"></td>
	                </tr>
                
	                <tr>
	                    <td>작성자</td>
	                    <td colspan="3"><input name="memberId" value="1" placeholder="작성자 아이디 넣기"></td>  
	                    
	                </tr>
	            
	                <tr>
	                    <td>만족도</td>  
	                    <td colspan="3">
	                    <ul class="rate-area pl-0 mb-0">
						  <input type="radio" id="5-star" name="rate" value="5" /><label for="5-star" title="Amazing">5 stars</label>
						  <input type="radio" id="4-star" name="rate" value="4" /><label for="4-star" title="Good">4 stars</label>
						  <input type="radio" id="3-star" name="rate" value="3" /><label for="3-star" title="Average">3 stars</label>
						  <input type="radio" id="2-star" name="rate" value="2" /><label for="2-star" title="Not Good">2 stars</label>
						  <input type="radio" id="1-star" name="rate" value="1" /><label for="1-star" title="Bad">1 star</label>
						</ul></td>
	                </tr>
	                <tr>
	                    <td>이미지 첨부하기</td>
	                    <div id="imgAcd">
<!-- 	                    <td><input type="file" name="iname1"></td> -->
							<td>
							<p class="iname"><input type="file" name="file"></p>
							</td>
	                        
	                        <td><input type="button" onclick="add()" value='사진추가'></td>
	                        <td><input type="button" onclick="del()" value='사진삭제'></td>               
	                    </div>
	                </tr>
	                <tr>
	                    <td>내용</td>
	                    <td colspan="3">
	                        <textarea id="textarea" cols="110" name="content" rows="5" placeholder="후기를 입력해주세요"></textarea>
	                    </td>
	                </tr>
	                
	                <!-- 나중에 hidden 으로 감싸주거나 상품 아이디를 뿌려줄 때 -->
	                <input type="text" name="watch_id" value="659">
            </table>
            <div align="center">
                    <a class="btn btn-primary" href="javascript:document.writeForm.submit()">
                   		 작성완료
                    </a>
                    <a class="btn btn-outline-primary" href="javascript:history.back()">
                    	뒤로가기
                    </a>
            </div>
        </form>
    </div>



</body>
</html>