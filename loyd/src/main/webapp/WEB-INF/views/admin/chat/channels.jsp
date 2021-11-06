<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>어드민 대시보드 페이지</title>

    <!-- ajax 요청을 위한 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
        // 이 소스는 참고하지 마세요 -_- jsp 에서 자바스크립트로 해결하는 건 그닥 좋은 방법은 아닌것 같아요
        let page = 0;
        let size = 10;
        let data = []
        axios({
            method: 'post',
            url: '/channel'
        }).then(response => {
            console.log(response)
            response.data.forEach(d => {
                data.push(d)
            })

            render();
        })

        function render() {

        }

    </script>
</head>
<body>
	<div class="container">

    </div>
</body>
</html>

