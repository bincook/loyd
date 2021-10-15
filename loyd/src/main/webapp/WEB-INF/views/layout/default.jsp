<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<html>
<head>
    <title>
        <%-- 요청한 page 의 <title></title> 에 작성했던 내용이 온다 --%>
        <decorator:title />
    </title>

    <!-- 사이트 메시 요약 블로그 https://cofs.tistory.com/273 -->

    <!-- 파비콘 -->


    <!-- 부트스트랩 -->
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">

    <!-- 아이콘 사이트 https://icons.getbootstrap.com/ -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <!-- Index CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css" />">

    <!-- 부트스트랩 & 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="/resources/css/main.css" />">

    <%-- 요청한 page 의 <head></head> 에 작성했던 내용이 온다 --%>
    <decorator:head />
</head>
<body>

    <!-- header.jsp -->
    <page:applyDecorator name="header" />

    <main class="container-fluid">
        <section style="min-height: 83vh">
            <%-- 요청한 page 의 <body></body> 에 작성했던 내용이 온다 --%>
                <decorator:body />
        </section>
    </main>

    <div style="height: 10vh">
        <!-- footer.jsp -->
        <page:applyDecorator name="footer" />
    </div>
</body>
</html>
