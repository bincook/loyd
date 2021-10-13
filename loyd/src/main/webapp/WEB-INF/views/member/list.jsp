<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1 align="center">리스트 페이지</h1>

<table border="1" align="center" width="500">
    <c:forEach items="${members}" var="member">
    <tr>
        <td>이메일</td>
        <td>
            <a href="<c:url value="/member/${member.id}" />">
                ${member.email}
            </a>
        </td>
    </tr>
    </c:forEach>

</table>

</body>
</html>

