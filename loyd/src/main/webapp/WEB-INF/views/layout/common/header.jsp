<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function check1(){
		alert("회원만 가능");
	}
	function view(){
		document.getElementById("drop-content").style.display="block";
	}
	function hide(){
		document.getElementById("drop-content").style.display="none";
	}
</script>

<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" />
<c:set value="${ pageContext.request.requestURI}" var="reqUri" />

<div style="height: 7vh"  class="col-md-12 navbar ${!reqUri.equals(contextPath.concat("/")) ? "bg-dark-green sticky-top" : "fixed-top" }">
    


<div class="dropdown" onmouseout="hide()" onmouseover="view()">
 <a href="<c:url value="/"/>" class="logo navbar-brand text-white offset-md-2"  >Watch</a>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2" id="drop-content" style="display:none;">
    <a href="<c:url value="/order/product_list"/>" class="logo navbar-brand text-black offset-md-2">watch list</a>
    <a href="<c:url value="/order/men_product_list"/>" class="logo navbar-brand text-black offset-md-2">MEN WATCH</a>
    <a href="<c:url value="/order/women_product_list"/>" class="logo navbar-brand text-black offset-md-2">WOMEN WATCH</a>
    <a href="<c:url value="/mypage/info"/>" class="logo navbar-brand text-black offset-md-2">MYPAGE</a>
    <c:if test="${email==null }">
    <a href="<c:url value="#"/>" onclick="check1()" class="logo navbar-brand text-black offset-md-2">CART</a>
    </c:if>
    <c:if test="${email!=null }">
    <a href="<c:url value="/cart/list?id=${id }"/>" class="logo navbar-brand text-black offset-md-2">CART</a>
    </c:if>
  </div>
</div>

    
    
    
    
    

    
    <ul class="nav">
        
        <c:if test="${email != null }">
        	<li class=" nav-item">
            <a href="#" class="nav-link">${name }님환영합니다</a>
        </li>
        	
        </c:if>
        
        <li class=" nav-item">
            <a href="<c:url value="/search/search"/>" class="nav-link">Search</a>
        </li>

	  <c:if test="${email==null }">
        <li class="nav-item ${reqUri.equals(contextPath.concat("/cart/list")) ? "active" : ""}">
            <a href="#" onclick="check1()" class="nav-link">Cart</a>
        </li>
      </c:if>
      
      <c:if test="${email != null }">
        <li class="nav-item ${reqUri.equals(contextPath.concat("/cart/list")) ? "active" : ""}">
            <a href="<c:url value="/cart/list?id=${id }"/>" class="nav-link ">Cart</a>
        </li>
      </c:if>
        
        
        <c:if test="${email==null }">
        	<li class="nav-item ${reqUri.equals(contextPath.concat("/sign-in")) ? "active" : ""}">
            <a href="<c:url value="/mber/login" />" class="nav-link">Login</a>
        	</li>
        </c:if>
        <c:if test="${email!=null }">
        	<li class="nav-item ${reqUri.equals(contextPath.concat("/sign-in")) ? "active" : ""}">
            <a href="<c:url value="/mber/logout" />" class="nav-link">logout</a>
            </li>
        </c:if>
        
        <li class="nav-item ${reqUri == contextPath.concat("/mypage/info") ? "active" : ""}">
            <a href="<c:url value="/mypage/info" />" class="nav-link">MyPage</a>
        </li>
        <li class="nav-item ${reqUri == contextPath.concat("/sample") ? "active" : ""}">
            <a href="<c:url value="/sample" />" class="nav-link">Sample</a>
        </li>
    </ul>
</div>

