<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<script>

	$(document).ready(function(){
		$("#all").click(function(){
			if($("#all").prop("checked")){
				$("input[name=watch]").prop("checked",true);
			}else{
				$("input[name=watch]").prop("checked",false);
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
	
	
	function ajax(){
		var member_id = $("#member_id").val();
		
		var chkValues =[];
		
		$("input[name='watch']:checked").each(function(i){
			chkValues.push($(this).val());
		});
		
		var allData = {"member_id":member_id, "chkValues":chkValues};
		
		$ajax({
			url:"cart_list",
			type:"GET",
			data: allData,
			
			success:function(data){
	            alert("완료!");
	            window.opener.location.reload();
	            self.close();
	        },

	       //에러가 발생되면 출력되는 메시지

	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
		})
	}
	
	
	
	
	
</script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="container mt-5">
        <table class="table table-hover d-inline-block">
          <tbody>
              <tr>
                <th scope="row">
                  <input type="checkbox" id="all" onclick="selectAll()">
                </th>
                <th style="width: 500px;"  scope="col">상품정보</th>
                <th scope="col">주문금액</th>
              </tr>
              
              <c:forEach items="${list }" var="dto">
              <tr>
              
                <th scope="row">
                  <input type="hidden" name="member_id" value="${dto.member_id }">
                  <input type="checkbox" name="watch" value="${dto.watch_id }">
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
                            <a href="change?watch_id=${dto.watch_id }" onclick="window.open(this.href, '_blank', 'width=500, height=500'); return false;"><button class="btn-block">수량 변경</button></a>
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
              		<button id="deleteBtn" type="button" onclick="ajax()">선택 삭제</button>
              		<button type="button" >찜 하기</button>
              	</td>
              	
              	
              </tr>
              <tr>
              	<td colspan="4" align="center">
              		<h3>총결제금액  : ${String.format("%,d",chong) }</h3> <!--  db 에는 총결제금액이 들어가있나요 ? 위드문 써서 만들엇어요 -->
              	</td>
              </tr>
            </tbody>
          </table>
    </div>
</body>
</html>