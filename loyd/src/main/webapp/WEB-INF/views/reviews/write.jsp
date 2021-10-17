<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매후기</title>
</head>
<body>

    <div class="jumbotron">
        <h1> {watch} 구매후기 </h1>
        <p> {watch}에서 구매하신 상품에 대한 고객님의 따뜻한 후기를 남겨주세요.</p>
      </div>
    <div class="container bg-light" style="height: 500px;">
        <form name="writeForm" method="post" action="write_ok">
                 
            <table class="table table-bordered">
	                <tr>
	                    <td >제목</td>
	                    <td colspan="3"><input type="text" name="title" size="100" placeholder="제목을 작성해주세요"></td>
	                </tr>
                
	                <tr>
	                    <td>작성자</td>
	                    <td><input name="memberId" value="1" placeholder="작성자 아이디 넣기"></td>  
	                    <td>작성일</td>
	                    <td><input type placeholder="오늘날짜 넣기"></td>
	                </tr>
	            
	                <tr>
	                    <td>만족도</td>  
	                    <td colspan="3"><input placeholder="별 1~5개"></td>
	                </tr>
	                <tr>
	                    <td>이미지 첨부하기</td>
	                    <div id="imgEdit">
	                        <td><input type="file" name="iname"></td>
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
	                <input type="text" name="watchId" value="659">
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