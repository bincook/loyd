<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div class="container mt-5 text-center" >
        <table style="width: 1200px; height:500px;" class="table table-hover" align="center">
          <tbody>
              <tr>
                <th scope="col">상품정보</th>
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
              	<c:forEach items="${list }" var="dto">
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
</body>
</html>