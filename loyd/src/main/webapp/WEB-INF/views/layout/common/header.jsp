<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" />
<c:set value="${ pageContext.request.requestURI}" var="reqUri" />

<div style="height: 7vh"  class="col-md-12 navbar ${!reqUri.equals(contextPath.concat("/")) ? "bg-dark-green sticky-top" : "fixed-top" }">
    <a href="<c:url value="/"/>" class="logo navbar-brand text-white offset-md-2">Watch</a>
    <ul class="nav">
        <li class=" nav-item">
            <a href="#" class="nav-link">Search</a>
        </li>

        <li class="nav-item ${reqUri.equals(contextPath.concat("/cart/list")) ? "active" : ""}">
            <a href="<c:url value="/cart/list"/>" class="nav-link ">Cart</a>
        </li>
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
