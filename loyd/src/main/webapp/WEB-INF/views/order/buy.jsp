<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                	<h3>총${dto.chong }개 ${String.format("%,d",all_price) }원</h3>
                	</div>
                </th>
                
              </tr>
              <tr>
                <td>
                    <div>
                        <div class="d-inline-block mr-4">
                            	<img src="${dto.picture }" width="100px">
                        </div>
                        <div class="d-inline-block"">
                            <h6>${dto.name }</h6>
                            <h6>
                            	<small>${String.format("%,d",dto.price) }원</small>
                            </h6>     
                            <h6>
                            	<small>${dto.brand }/${dto.category }/${dto.kind }</small>
                            </h6>        
                        </div>
                    </div>
                </td>
              </tr>
            </tbody>
          </table>
    </div>
    
    
    <!-- 주문자 정보 -->
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
                        <div class="d-inline-block"">
                            <h6>${name }</h6>
                            <h6>
                            	<small>${email }</small>
                            </h6>             
                        </div>
                    </div>
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
				<td><input type="text"></td>
              </tr>
         	  <tr>
         	  	<td>
                    <div>
                        <div class="d-inline-block">
                            	배송주소<span style="color:red;">*</span>
                        </div>
                        <div class="d-inline-block" style="margin-left:200px;">
		                                            우편번호 : <input type="text" name="zip" style="width:80px; height:26px;" />
							<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
							주소 : <input type="text" name="addr1" style="width:300px; height:30px;" readonly /><br>
							상세 : <input type="text" name="addr2" style="width:300px; height:30px;" />            
                        </div>
                    </div>
                </td>
         	  </tr>
         	  <tr>
				<td>
					연락처<span style="color:red;">*</span>
				</td>   
				<td><input type="text"></td>
              </tr>
              <tr>
				<td>
					배송메세지<span style="color:red;">*</span>
				</td>   
				<td>
				<select>
					<option>배송메시지를 선택해주세요</option>
					<option>빠른 배송 부탁드려요</option>
					<option>부재 시 문 앞에 놓아주세요</option>
					<option>파손의 위험이 있는 상품이 있습니다.주의해주세요</option>
					<option>배송전 연락주세요</option>
				</select>
				</td>
              </tr>
            </tbody>
          </table>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


</body>
</html>