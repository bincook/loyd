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

    <!-- 채팅 -->
    <link rel="stylesheet" href="<c:url value="/resources/css/chat.css" />">
    <script>
        let websocket = null
        let client_ipaddress = "여기에아이피"
        let chat_server_host = 'http://localhost:8080'
        let chat_server_url = '/socket/connect/url'
        let chat = null

        $.getScript("/resources/js/chat.js", function () {
            chat = new Chat()
            $.getScript("/resources/js/real_time_client.js", function () {
                // 웹 소켓 연결
                websocket = new RealTimeClient(chat_server_host);
                websocket.init(chat_server_url, client_ipaddress)
            });
        });
    </script>

    <%-- 요청한 page 의 <head></head> 에 작성했던 내용이 온다 --%>
    <decorator:head />
</head>
<body>

    <div class="container-fluid">
        <div class="row">

            <!-- header.jsp -->
            <page:applyDecorator name="header" />

            <%-- 요청한 page 의 <body></body> 에 작성했던 내용이 온다 --%>
            <decorator:body />
        </div>

        <!-- 채팅 html -->
        <div class="chat-container">
            <div class="open-button">
                <i class="bi bi-app"></i>
            </div>

            <div class="chat">
                <div class="chat-title">
                    <h1>Fabio Ottaviani</h1>
                    <h2>Supah</h2>
                    <figure class="avatar">
                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure>
                </div>
                <div class="messages">
                    <div class="messages-content"></div>
                </div>
                <div class="message-box">
                    <textarea type="text" class="message-input" placeholder="Type message..."></textarea>
                    <button type="submit" class="message-submit">Send</button>
                </div>
                <div class="bg"></div>
            </div>
        </div>
    </div>
</body>
</html>
