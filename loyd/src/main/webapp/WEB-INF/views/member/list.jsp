<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<section>
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

            <tr>
                <td colspan="2" class="text-center">
                    <a href="<c:url value="/member/write"/>">작성하기</a>
                </td>
            </tr>
    </table>

</section>


</body>
</html>

