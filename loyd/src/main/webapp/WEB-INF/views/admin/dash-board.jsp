<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>어드민 대시보드 페이지</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<script>
	var context = example.getContext('2d');
	context.fillStyle = 'red';
	context.fillRect(30, 30, 50, 50);
</script>
<script>
	var context2 = example.getContext('2d');
	context2.fillStyle = 'red';
	context2.fillRect(30, 30, 50, 50);
</script>
<style>
 #holder{
 padding:60px;
 }
 #first{
  margin:auto;
 width:800px;
 text-align:right;
 background:red; 
 color:white;	
 }
 .second{
 display:inline-block;

 }
 #side{
 background:pink;
 border:dotted 1px blue;
 border-radius:10px;
 display:inline;
 float:right;
 margin:0;
 padding:30px 30px 100px;
 width:300px;
 }

</style>
</head>
<body>
<div id="holder">
	<!-- 차트 -->
	 <div id="side">
			<ul>
	 	 <li>반품문의 많은 상품 :  ${grapq_id}</li>
	 	 <li>주문 Top3.  ${orderg}</li>
	 	 <li>오늘의 스케줄 : </li>	 	
	 	 </ul>
	  </div>	  
<div>
 
		<div>
			<div style="width:400px" class="second">
				<canvas Id="myChart"></canvas>		
			</div>
			<div style="width:500px"  class="second">
				<canvas Id="myChart2"></canvas>
			</div>
		</div>

		<div class="d-flex p-3" style="gap: 50px;">

			<div class="card" style="width: 300px">
				<div class="card-header">

					<a href="/loyd/qna/list" class="stretched-link">QnA </a> <span>
						최근 문의글 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listq}" var="list">
								<tr>
									<th>${list.content}</th>
									<th>${list.writeday}</th>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</div>
			</div>


			<div class="card" style="width: 300px">
				<div class="card-header">

					<a href="/loyd/reviews/list" class="stretched-link">review </a> <span>
						최근 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listr}" var="list">
								<tr>
									<th>${list.content}</th>
									<th>${list.writeday}</th>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</div>
			</div>


			<div class="card" style="width: 300px">
				<div class="card-header">

					<a href="/loyd/cart/list" class="stretched-link">cart </a> <span>
						최근 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listc}" var="list">
								<tr>
									<th>${list.created_at}</th>
									<th>${list.email}</th>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</div>
			</div>

			<div class="card" style="width: 300px">
				<div class="card-header">

					<a href="/loyd/order/product_list" class="stretched-link">order
					</a> <span> 최근 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listo}" var="list">
								<tr>
									<th>${list.price}</th>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</div>
			</div>

		</div>

	</div>
	<script>
		var ctx = document.getElementById("myChart").getContext('2d');

		var myChart = new Chart(ctx,
				{
					type : 'pie',
					data : {
						labels : [ "총 회원 수", "총 문의글 수", "총 리뷰 수" ],
						datasets : [ {
							label : '# of Votes',
							data : [ '${tot}', '${totq}', '${totr}'],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)', ],
							borderColor : [ 'rgba(255,99,132,1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)', ],
							borderWidth : 1
						} ]
					},
					options : {
						maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
	</script>
	<script>
		var ctx = document.getElementById("myChart2").getContext('2d');
		var myChart2 = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ '한달 전 주문 count' ],
				datasets : [ {
					label : '# of Votes',
					data : [ '${ic.orderday}', 1, 1, 1, 1 ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<c:forEach items="${orderc}" var="ic"> 
  ${ic.orderday}
  </c:forEach>
  </div>
</body>
</html>

