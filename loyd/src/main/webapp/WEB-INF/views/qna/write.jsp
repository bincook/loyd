<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
<style>
 #first #left ,#first #sub, #first #right{
 display:inline-block;
 width:200px;
 }
 #first #left{
 align:left;
 }
 #first #sub{
 align:center;
 font-weight:900;
 }
 #first #right{
 align:right;
 }
 
 tr{
 height:100px;
 }
  td{
  width:100px;

  }
 </style>
 <script>
  function secret_qna(){
	  document.getElementById("secret_pwd").style.visibility="visible";	  

  } 
	  
	  
  function answer(){
	  document.getElementById("answer_email").style.visibility="visible";
  }
  
  	  
 function check(){
	 
	  var checkedInput = $("input:checked")
	  if(checkedInput.length < 1)
		  {
		  document.getElementById("ctn_show").style.visibility="hidden"; 
		  }
	  else
		  {
		  document.getElementById("ctn_show").style.visibility="visible"; 
          $('#chkBox:checked').each(function() { 
              alert($(this).val());
          });
  }
 }

  
 </script>
</head>
<body>
 <div>
 <form method="post" action="insert_ok">
  <input type="text" name="watch_id" value="665"> <!--  나중에 변환 -->
  <div id="first">
 <div id="left">
 	<input class="btn btn-outline-secondary" type="reset" value="수정취소">
</div>
 <div id="sub">문의내용 작성</div>
<div id="right" class="form-group">
		 	<input class="btn btn-primary" type="submit" value="작성완료">
			<a href="insert_ok"></a>
</div>
 </div>
  <table border="1"><tr>
문의유형 선택
<td > 상품<input type="radio" name="qnatype" value="상품"> </td>
<td> 배송<input type="radio" name="qnatype" value=" 배송"></td>
 <td>반품/취소<input type="radio" name="qnatype" value="반품/취소"></td>
 <td>교환/변경<input type="radio" name="qnatype" value="교환/변경"></td>
<td> 기타<input type="radio" name="qnatype" value="기타"></td>
  </table></tr>
 <p>  
  <input type="text" name="title" placeholder="제목"><p>
   <textarea name="content" cols="40" rows="5" placeholder="문의유형을 선택 후 궁금하신 내용을 적어주세요"></textarea><p>
       
   
   <tr height="50">
	<div onclick="check()" >
      <input type="checkbox" name="secret" value="1" onclick="secret_qna()">비밀글로 문의하기   <p>
	   <div id="secret_pwd" style="visibility:hidden">
	<div id="ctn_show">
	      <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" size="30"><br>      
	      <input type="button" value="확인"><br>
	      나중에 답변 확인 시 방금 입력한 비밀번호와 일치해야 답변내용을 볼 수 있어요^^!
	</div> 	      
	    </div><p>  
   </div>  
   </tr>
   
	<div onclick="check()" >    
	    답변완료시 알림받으시겠어요?<p>
	    <input type="checkbox" name="emailChk" onclick="answer()">email로 알림받기
	 <div id="answer_email" style="visibility:hidden">
	<div id="ctn_show">	 
	    <input type="text" name="email" placeholder="답변받을  email주소를 입력해주세요" size="30">    
	</div>     
 		</div>      
 	</div>  
 
 </form>
 </div>
</body>
</html>