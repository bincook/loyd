<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#vv {
		visibility:hidden;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=addr1]').val(data.address);
			$('[name=addr2]').val(data.buildingName);
		}
	}).open();
}

function chk(){
	var a = document.pkc;
	
	if(a.order_name.value==""){
		alert("이름을 입력하세요");
	}else if(a.order_phone.value==""){
		alert("핸드폰번호를 입력하세요");
	}else if(a.email.value.indexOf('@')==""){
		alert("이메일 형식에 맞게 입력하세요");
	}else if(a.rec_name.value =="" ){
		alert("받는사람을 입력하세요");
	}else if(a.zip.value==""){
		alert("우편번호를 입력하세요");
	}else if(a.addr2.value==""){
		alert("상세주소를 입력하세요")
	}else if(a.rec_phone.value==""){
		alert("핸드폰번호를 입력하세요")
	}else{
		document.pkc.submit();
	}
}
	
</script>
</head>
<body>

	<div class="container mt-5 text-center" >
        <table style="width: 1000px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="col">
                	<div>
                	<h3>주문하실 상품</h3>
                	<h3>총${item_chong }개 ${String.format("%,d",chong)}원</h3>
                	</div>
                </th>
                
              </tr>
              <tr>
                <td>
                <c:forEach items="${list }" var="dto">
                    <div>
                        <div class="d-inline-block mr-4">
                            	<img src="${dto.picture }" width="100px">
                        </div>
                        <div class="d-inline-block"">
                            <h6>${dto.name }</h6>
                            <h6>${dto.item_count }개</h6>
                            <h6>
                            	<small>${String.format("%,d",dto.price) }원</small>
                            </h6>     
                            <h6>
                            	<small>${dto.brand }/${dto.category }/${dto.kind }</small>
                            </h6>        
                        </div>
                    </div>
                </c:forEach>
                </td>
              </tr>
            </tbody>
          </table>
    </div>
    
    
    <!-- 주문자 정보 -->
    <form name="pkc" method="post" action="pay">
    <div class="container mt-5 text-center" >
        <table style="width: 1000px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="col">
                	<div>
                	<h3>주문자 정보</h3>
                	</div>
                </th>
                
              </tr>
              <tr>
                <td>
                    <div>
                        <div class="d-inline-block">
                            
                            이름<input type="text" name="order_name" value="${name }"><p>
                            핸드폰번호<input type="text" name ="order_phone"> <p>
                            이메일<input type="text" name ="email" value="${email }">            
                        </div>
                    </div>
                </td>
              </tr>
            </tbody>
          </table>
    </div>
    
    
    <!-- 결제 방법 -->
    <div class="container mt-5 text-center" >
        <table style="width: 1000px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="col">
                	<div>
                	<h3>결제 방법</h3>
                	</div>
                </th>
                
              </tr>
              <tr>
                <td>
                    <select name="pay">
                    	<option value="카드">카드</option>
                    	<option value="실시간 계좌이체">실시간 계좌이체</option>
                    	<option value="무통장입금(가상계좌)">무통장입금(가상계좌)</option>
                    	<option value="카카오페이">카카오페이</option>
                    </select>
                </td>
              </tr>
            </tbody>
          </table>
    </div>
    
    
    
    <!-- 배송지 정보 -->
    <div class="container mt-5 text-center" >
        <table style="width: 1000px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="col">
                	<div>
                	<h3>배송지 정보</h3>
                	</div>
                </th>
                
              </tr>
              <tr>
				<td>
					받는사람<span style="color:red;">*</span>
				</td>   
				<td><input  name="rec_name" type="text"></td>
              </tr>
         	  <tr>
         	  	<td>
                 	배송주소<span style="color:red;">*</span>
         	  	</td>
         	  	<td >
                    <div>
                    
                        <div class="d-inline-block">
		                                            우편번호 : <input name="zip"type="text" name="zip" style="width:80px; height:26px;" />
							<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
							주소 : <input name="addr1" type="text" name="addr1" style="width:300px; height:30px;" readonly /><br>
							상세 : <input name="addr2" type="text" name="addr2" style="width:300px; height:30px;" />            
                        </div>
                    </div>
                </td>
         	  </tr>
         	  <tr>
				<td>
					연락처<span style="color:red;">*</span>
				</td>   
				<td><input name ="rec_phone" type="text"></td>
              </tr>
              <tr>
				<td>
					배송메세지<span style="color:red;">*</span>
				</td>   
				<td>
				<select name="msg">
					<option value="배송메시지를 선택해주세요">배송메시지를 선택해주세요</option>
					<option value="빠른 배송 부탁드려요">빠른 배송 부탁드려요</option>
					<option value="부재 시 문 앞에 놓아주세요">부재 시 문 앞에 놓아주세요</option>
					<option value="파손의 위험이 있는 상품이 있습니다.주의해주세요">파손의 위험이 있는 상품이 있습니다.주의해주세요</option>
					<option value="배송전 연락주세요">배송전 연락주세요</option>
				</select>
				</td>
              </tr>
            </tbody>
          </table>
          
          <table align="center">
          	<tr>
              	<td>
              		
              		<input type="button" value="${String.format("%,d",chong) }원 결제하기(${item_chong })" onclick="chk()">
              		
              	</td>
              </tr>
          </table>
    </div>
    </form>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


</body>
</html>