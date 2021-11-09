<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="<c:url value="/resources/favicon.png" />" type="image/x-icon">
<script>
	// 아마 예약어라서
	function close2(){
		window.opener.location.reload();
		window.close(); 
	}
</script>
</head>
<body>


		<table class="table table-hover d-inline-block">
              <tr>  
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
                                <small>${dto.hap }</small>
                            </h6>
                            <h6>
                                <small>옵션 :${dto.item_count }개</small>
                            </h6>
                        </div>
                    </div>
                </td>
              </tr>
              <tr>
              	<td>
              		<c:if test="${chk ==1 }">
              			
              		</c:if>
					<c:if test="${chk >1 }">
              			<a href="minus?watch_id=${dto.watch_id }&email=${dto.email}"><input type="button" value="-"></a>	
              		</c:if>
              		
       
              		<span>${dto.item_count }</span>
              		<a href="plus?watch_id=${dto.watch_id }&email=${dto.email}"><input type="button" value="+"></a>
              	</td>
              </tr>
              <tr>
              	<td align="center">
              		<input type="button" value="확인" onclick="close2()">
              	</td>
              </tr>
          </table>
          
          
          




</body>
</html>