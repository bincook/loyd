<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>마이 페이지</title>
</head>
<body>
<h1> 마이 페이지 </h1>

<a href="order_list?email=${email }"> 주문내역</a><br>
<a href="enquiry?email=${email }"> 상품문의</a><br>
<a href="wishlist?email=${email }"> 내 찜</a>
<a href="watch-care"> 취급시 주의사항</a>

</body>
</html>

