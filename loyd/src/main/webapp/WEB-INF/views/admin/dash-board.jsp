<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>어드민 대시보드 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.1/moment.min.js"></script>
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
 padding:50px;
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
 border:dotted 2px blue;
 border-radius:10px;
 display:inline;
 position: absolute;
 right: 150px;
 margin:0;
 padding:30px 30px 100px;
 width:300px;
 }
 
 .card tr th:nth-child(1) {
	vertical-align: middle
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
			<div style="width:500px; margin-left: 200px"  class="second" >
			
			
				<canvas Id="myChart2"></canvas>
			</div>
		</div>

		<div class="d-flex p-3" style="gap: 50px;">

			<div class="card" style="width: 300px">
				<div class="card-header">

					<a href="#" class="stretched-link">QnA </a> <span>
						최근 문의글 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listq}" var="list">
								<tr>
									<th>
 										<div  style="height:30px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 125px">									
										${list.content}
										</div>
									</th>
									
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
								<tr >
									<th>
									
									
										<div style="height:30px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 125px" >
										${list.content}
										</div>	
									</th>
									<th>${list.writeday}</th>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</div>
			</div>


			<div class="card" style="width: 520px">
				<div class="card-header">

					<a href="/loyd/cart/list" class="stretched-link">cart </a> <span>
						최근 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listc}" var="list">
								<tr>
									<th style="width: 120px">${list.brand}</th>
									<th>${list.name}</th>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</div>
			</div>

			<div class="card" style="width: 500px">
				<div class="card-header">

					<a href="/loyd/admin/member/list" class="stretched-link">주문량 높은 회원
					</a> <span> 최근 </span>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<c:forEach items="${dash_listo}" var="list">
							
								<tr>
									<th>${list.order_name } 님의 소비금액</th>
									<th>${String.format("%,d",list.price)} 원</th>
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
				labels : [
					<c:forEach items="${orderc }" var="ic"  varStatus="i" >
					"${ic.orderday }" <c:if test="${!i.last}">,</c:if>
					</c:forEach>
		
				],
				datasets : [ {
					label : '올 해 판매량',
					data : [
						<c:forEach items="${orderc }" var="ic"  varStatus="i">
						${ic.c } <c:if test="${!i.last}">,</c:if>
					</c:forEach>
						
					],
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
			}
		});
	</script>

  </div>
</body>
</html>

