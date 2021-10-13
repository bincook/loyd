<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1 align="center">상세 페이지</h1>


<table border="1" align="center" width="500">
    <tr>
        <td>이메일</td>
        <td>${member.email}</td>
    </tr>

    <tr>
        <td>
            <a href="<c:url value="/member/update?id=${member.id}" />">수정</a>
        </td>
        <td>
            <a href="javascript:deleteButton()">삭제</a>
        </td>
    </tr>
</table>

<script>
    function deleteButton() {
        var result = confirm('삭제하시겠습니까?')

        if (result) {
            sendForm('delete.do', '${member.id}')
        }
    }

    function sendForm(url, id) {
        var form = document.createElement('form')
        form.setAttribute('method', 'post')
        form.setAttribute('action', url)
        document.charset = 'utf-8'
        var input = document.createElement('input')
        input.setAttribute('type', 'hidden')
        input.setAttribute('name', 'id')
        input.setAttribute('value', id)
        form.appendChild(input)
        document.body.appendChild(form)
        form.submit()
    }
</script>

</body>
</html>

