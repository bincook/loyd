<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--  다 지워도 돼요 사이트 메시 header 에 있어요 -->
<script>

	$(document).ready(function(){
		$("#all").click(function(){
			if($("#all").prop("checked")){
				$("input[name=watch_id]").prop("checked",true);
			}else{
				$("input[name=watch_id]").prop("checked",false);
			} 
		})
		
		// 체크박스가 선택된 tr 을 select 하여 삭제하기
		$("#deleteBtn").click(function() {
			// 체크박스기 선택된 tr
 			var checkedTrs = $("tr > th > input:checked")
 			// input checked 를 for 문 돌면서 해당 input 의 부모태그(th)-> 부모태그(th) 에 올라와서 remove 로 삭제
 			// jquery 로 바로 선택하는 걸 까먹어서 javascript 순수문법이랑 jquery 문법이랑 섞여있어요
			$.each(checkedTrs, function(idx, item) {
			    item.parentNode.parentNode.remove()
			});
		})
	})
	
	
</script>
</head>
<body>
	<div class="container mt-5 text-center" >
        <table style=" width: 1000px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="row">
                  <input type="checkbox" id="all">
                </th>
                <th scope="col">상품정보</th>
                <th scope="col">주문금액</th>
              </tr>
              
              <c:forEach items="${list }" var="dto">
              <tr>
              
                <th scope="row">
                  <input type="hidden" name="member_id" id ="member_id" value="${dto.member_id }">
                  <input type="checkbox" name="watch_id" value="${dto.watch_id }">
                </th>
                <td>
                    <div>
                        <div class="d-inline-block mr-4">
                            <img src="${dto.picture }" width="100px">
                        </div>
                        <div class="d-inline-block">
                            <h6>
                                <small>${dto.name }</small>
                            </h6>
                            <h6>
                                <small>${String.format("%,d",dto.price) }</small>
                            </h6>
                            <h6>
                                <small>옵션 :${dto.kind }/${dto.item_count}개</small>
                            </h6>
                            <a href="change?watch_id=${dto.watch_id }&email=${dto.email}" onclick="window.open(this.href, '_blank', 'width=500, height=500'); return false;"><button class="btn-block">수량 변경</button></a>
                        </div>
                    </div>
                </td>
                <td>
                <div>${String.format("%,d",dto.hap) }원</div>
                </td>
              </tr>
              </c:forEach>
              
              
              <tr>
              	<td colspan="4" align="center">
              		<button id="deleteBtn" type="button" onclick="ajx()">선택 삭제</button>
              	</td>
              	
              	<script>
              	function ajx(){

            		//var member_id = $("#member_id").val(); // <input id="member_id" /> 애만 가져오는거예요 네 아.name이네요
            		
            		var watch_id =[];
            		
            		$("input[name='watch_id']:checked").each(function(i){
            			watch_id.push($(this).val());
            		});
            		
            		//var allData = {"member_id":member_id, "watch_id":watch_id};
            		var allData = {"watch_id":watch_id};
            		
            		console.log(allData)

            		
            		$.ajax({
            			url:"cart_delete",
            			type:"GET",
            			data: allData,
            			contentType: "charset=UTF-8 application/x-www-form-urlencoded;",
            			dataType: "text",
            			success:function(data){
            				console.log('스프링에서 넘어온 문자값 :=>', data)
           	           
            	            // location.reload(); // 새로고침
            	            
            	        },

            	       //에러가 발생되면 출력되는 메시지

            	        error:function(jqXHR, textStatus, errorThrown){
            	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            	            self.close();
            	        }
            		})
            	}
              	</script>
              	
              	
              </tr>
              <tr>
              	<td colspan="4" align="center">
              		<h3>총결제금액  : ${String.format("%,d",chong) }</h3> <!--  db 에는 총결제금액이 들어가있나요 ? 위드문 써서 만들엇어요 -->
              		
              	</td>
              </tr>
              <tr>
              	<td colspan="4" align="center">
              		<a href="cart_buy"><button>결제하기</button></a>
              	</td>	
              </tr>
            </tbody>
          </table>
    </div>
</body>
</html>