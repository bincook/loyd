<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1 align="center">수정 페이지</h1>

<form align="center" action="<c:url value="/member/update.do"/>" method="post">
        <input type="hidden" name="id" value="${member.id}">

    <p>
        이메일
        <input type="text" name="email" value="${member.email}">
    </p>
    <p>
        비밀번호
        <input type="text" name="pwd" value="${member.pwd}">
    </p>
    <p>
        이름
        <input type="text" name="name" value="${member.name}">
    </p>
    <p>
        전화번호
        <input type="text" name="phone" value="${member.phone}">
    </p>

    <button>완료</button>

</form>



</table>

</body>
</html>

