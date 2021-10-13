<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1 align="center">작성 페이지</h1>

<form action="<c:url value="/member/write.do"/>" method="post">

    <p>
        이메일
        <input type="text" name="email" value="test">
    </p>
    <p>
        비밀번호
        <input type="text" name="pwd" value="1234">
    </p>
    <p>
        이름
        <input type="text" name="name" value="test">
    </p>
    <p>
        전화번호
        <input type="text" name="phone" value="01012345678">
    </p>

    <button>완료</button>

</form>

</body>
</html>

