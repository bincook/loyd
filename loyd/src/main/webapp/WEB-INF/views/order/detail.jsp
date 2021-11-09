<%@ page pageEncoding="utf-8" %>

<div class="container mt-5 text-center">
  <table style="width: 1200px; height: 500px;" class="table table-hover" align="center">
    <tbody>
      <tr>
        <th scope="col">상품정보</th>
		<th style="width: 200px">
		<a style="margin: 8px" href="javascript:history.go(-2)"><button type="button">BACK</button></a>
        <c:if test="${dto.like2 ==0 && email == null }">
          <a href="javascript:alert('로그인이 필요합니다')"><button id="like">♡</button></a>
        </c:if>
        <c:if test="${dto.like2 ==0 && email != null }">
          <a href="like?id=${dto.id}"><button id="like">♡</button></a>
        </c:if>
        <c:if test="${ dto.like2 >= 1}">
          <a href="like2?id=${dto.id}"><button id="like">♥</button></a>
        </c:if>
        
        </th>
      </tr>
      <tr >
        <td colspan="2" align="center">
          <div>
            <div class="d-inline-block mr-4">
              <img src="${dto.picture }" width="400px">
            </div>
            <div class="d-inline-block">
              <h3>${dto.name }</h3>
              <h4>
                <small>${dto.brand }</small>
              </h4>
              <br>
              <h2>
                <small>${String.format("%,d",dto.price) }원</small>
              </h2>
              <br>
              <h4>
                <small>${dto.category }/${dto.kind } </small>
              </h4>
            </div>
          </div>
        </td>
      </tr>


      <tr>

        <td colspan="2"  align="center">
          <c:forEach items="${dlist }" var="dto">
            <div class="d-inline-block">
              <img src="${dto.path }">
            </div>
          </c:forEach>
        </td>

      </tr>
      <tr>
        <td colspan="2"  align="center">
          <c:if test="${email==null }">
            <div style="position:relative;">
              <button onclick="check()">CART</button>
              <button onclick="check()">BUY</button>
              <button  style="position:absolute; right: 0" onclick="history.back()">BACK</button>
              
            </div>
          </c:if>
          <c:if test="${email!=null }">
        <div style="position:relative;">
             <a href="cart_go?id=${dto.id }"><button onclick="check5()">CART</button></a>
             <a href="buy?id=${dto.id}"><button>BUY</button></a>
             <a style="position:absolute; right: 0" href="javascript:history.back()"><button>BACK</button></a>
                
            </div>
          </c:if>
        </td>
      </tr>



    </tbody>
  </table>
</div>

<SCRIPT>
 function check5(){
	 alert("카트로 이동했습니다.");
	 
 }
</SCRIPT>

