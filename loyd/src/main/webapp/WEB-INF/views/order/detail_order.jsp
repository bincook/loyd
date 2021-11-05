<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here2222</title>
<script>
	function check(){
		alert("회원만 이용가능합니다");
	}
	
	function check2(){
		alert("장바구니로 이동하였습니다");
	}
	
	
</script>
</head>

<body>
<script>
  function choice(opt){
	  opt;	
  }
   
  function check(){
		 
	  var checkedInput = $("input:checked")
	  if(checkedInput.val())
		  {
		  $('.secret').css('display', 'none')		   
		  }
	  else
		  {
		  $('.secret').css('display', 'initial')
		   
  		 }
 }
  
 </script>

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link <%= request.getAttribute("nav_type") != "list" ? "active" : "" %>" data-toggle="tab" href="#detail">상세정보</a>    
  </li>
  <li class="nav-item">
    <a class="nav-link <%= request.getAttribute("nav_type") == "list" ? "active" : "" %>" data-toggle="tab" href="#list">Q&A</a>     
  </li>
  
</ul>




<div class="tab-content">

  <div class="tab-pane fade  <%= request.getAttribute("nav_type") != "list" ? "show active" : "" %> " id="detail">
   <div class="container mt-5 text-center" >
        <table style="width: 1200px; height:500px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="col">상품정보</th>
                
                <c:if test="${dto.like2 ==0 }">
                <th><a href="like?id=${dto.id}" ><button id="like">♡</button></a></th>
                </c:if>
                <c:if test="${ dto.like2 >= 1}">
                <th><a href="like2?id=${dto.id}" ><button id="like">♥</button></a></th>
                </c:if>
              </tr>
              <tr>
                <td align="center">
                    <div>
                        <div class="d-inline-block mr-4">
                            	<img src="${dto.picture }" width="400px">
                        </div>
                        <div class="d-inline-block">
                            <h3>${dto.name }</h3>
                            <h4>
                            	<small>${dto.brand }</small>
                            </h4><br>
                            <h2>
                                <small>${String.format("%,d",dto.price) }원</small>
                            </h2><br>
                            <h4>
                                <small>${dto.category }/${dto.kind } </small>
                            </h4>                    
                        </div>
                    </div>
                </td>
              </tr>
              
              
              <tr>
              
              	<td align="center">
              	<c:forEach items="${dlist }" var="dto">
              		<div class="d-inline-block">
              			<img src="${dto.path }">
              		</div>
              	</c:forEach>
              	</td>
              
              </tr>
              <tr>
              	<td align="center">
              	<c:if test="${email==null }">
              		<span>
              			<button onclick="check()">CART</button>
              			<button onclick="check()">BUY</button>
              		</span>
              	</c:if>
              	<c:if test="${email!=null }">
              		<span>
              			<a href="cart_go?id=${dto.id }"><button onclick="check2()">CART</button></a>
              			<a href="buy?id=${dto.id}"><button>BUY</button></a>
              		</span>
              	</c:if>
              	</td>
              </tr>

              

            </tbody>
          </table>
    </div>
   </div>
   
  <div class="tab-pane fade <%= request.getAttribute("nav_type") == "list" ? "show active" : "" %>" id="list">  
 <div class="form-group">
	<a href="write"><input class="btn btn-primary" type="button" value="상품 문의하기"></a> 
</div> 
 <p>
  <div id="first">
	 <div id="left">
	 <form name="qna">
	 <input type="checkbox" name="secret" onclick="check()"> 비밀글 제외
	
	</div>
	<div id="right">
	 <select  onchange="choice(this.value)">
	  <option>문의유형</option>
	  <option>상품</option>
	  <option>배송</option>
	  <option>반품/취소</option>
	  <option>교환/변경</option>
	  <option>기타</option>
	 </select>
	</div>
	 </form>
 </div>
		<c:forEach items="${list}" var="list">

<!--   <자물쇠 아이콘> -->
<!-- 	체크박스가 체크되면 안보이게 -->
<div id="ctn_show" > 
	<c:if test="${list.secret == 1}">
		<div class="secret">	
		${list.qnatype}비밀글<br>
		내용 :  ${list.content} <br>
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
	 <hr>
	</c:forEach>  
	
	<!-- 현재 페이지 기준 이전 10페이지 이동 -->
   <c:if test="${pstart !=1 }"> 
    <a href="detail_order?page=${page-1}&nav_type=list&id=${dto.id}"> ◀ </a>    
   </c:if>
   <c:if test="${pstart == 1}">
    	◀
   </c:if>

<!-- 현재페이지 이전 1페이지 이동 -->
	<c:if test="${page != 1}">
	 <a href="detail_order?page=${page-1}&nav_type=list&id=${dto.id}"> < </a>
	</c:if>
	<c:if test="${page == 1}">
	 <
	</c:if>

<!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
	<c:forEach begin="${pstart}" end="${pend}" var="i">
<!-- 현재페이지 색은 다르게 => 빨강 -->	
	 <c:if test="${page != i}">
	 <a href="detail_order?page=${i}&nav_type=list&id=${dto.id}">${i}</a>
	 </c:if>
	 <c:if test="${page == i}">
	 <a href="detail_order?page=${i}&nav_type=list&id=${dto.id}" style="color:red">${i}</a>
	 </c:if>
	</c:forEach>						

 <!-- 현재페이지 기준 다음1페이지 이동 -->
  	<c:if test="${page != page_cnt}">
  	 <a href="detail_order?page=${page+1}&nav_type=list&id=${dto.id}"> > </a>
  	</c:if>
  	<c:if test="${page == page_cnt}">
  	  >
  	</c:if>
  	
  	<c:if test="${page_cnt != pend}">
  	 <a href="detail_order?page=${pend+1}&nav_type=list&id=${dto.id}"> ▶ </a>
  	</c:if>
      <c:if test="${page_cnt == pend}">
  	 ▶
  	 </c:if>
	
   </div>
   
   
  <div class="tab-pane fade" id="zxc">
   </div>
  
</div>

	
    
    
</body>
</html>