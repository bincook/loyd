<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>시계 쇼핑몰</title>

</head>
<body>


<div id="carouselExampleIndicators" class="carousel slide " data-pause="false" data-ride="carousel" data-interval="3800">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="https://cdn.pixabay.com/photo/2016/04/13/16/21/rolex-1327168_960_720.jpg" class="d-block w-100" alt="...">
		</div>
		<div class="carousel-item">
			<img src="https://cdn.pixabay.com/photo/2017/03/24/19/19/rolex-2171961_960_720.jpg" class="d-block w-100" alt="...">
		</div>
		<div class="carousel-item">
			<img src="https://cdn.pixabay.com/photo/2020/03/22/04/10/hourglass-4955799_960_720.jpg" class="d-block w-100" alt="...">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>


</body>
</html>
