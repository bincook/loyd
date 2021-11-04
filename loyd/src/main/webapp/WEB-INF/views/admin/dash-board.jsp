<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>어드민 대시보드 페이지</title>    
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<canvas id="example" width="200" height="200">
    This text is displayed if your browser does not support HTML5 Canvas.
</canvas>
<script>
    var context = example.getContext('2d');
    context.fillStyle = 'red';
    context.fillRect(30, 30, 50, 50);
</script>
<script>
    var context = example.getContext('2d');
    context.fillStyle = 'red';
    context.fillRect(30, 30, 50, 50);
</script>

</head>
<body>
	<!-- 차트 -->
	<div>
		<div style="width:800px">
    <canvas id="myChart"></canvas>
</div>	
	</div>
<div >
<div class="d-flex p-3" style="gap: 50px;" >

	<div class="card" style="width:300px">
	     <div class="card-header">
	      
	        <a href="/loyd/qna/list" class="stretched-link">QnA </a>
	        <span> 최근 문의글 </span>
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
	
	  
	    <div class="card" style="width:300px">
	     <div class="card-header">
	      
	        <a href="/loyd/reviews/list" class="stretched-link">review </a>
	        <span> 최근  </span>
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
	  
	    
	  <div class="card" style="width:300px">
	     <div class="card-header">
	      
	        <a href="/loyd/cart/list" class="stretched-link">cart </a>
	        <span> 최근  </span>
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
	  
	  	  <div class="card" style="width:300px">
	     <div class="card-header">
	      
	        <a href="/loyd/order/product_list" class="stretched-link">order </a>
	        <span> 최근  </span>
	    </div>
	    <div class="card-body">   
	        <table class="table">
	    <thead>            
	      <c:forEach items="${dash_listo}" var="list"> 
	      <tr>
			<th >${list.price}</th>
	     </tr>
 	      </c:forEach>  
	</thead>         
		</table>    
	    </div>
	  </div>
  
</div>
 	<div>
	<%-- ${orderg} 주문내역이 가장 많은 상품번호 10개--%>

		</div>  
</div>
<script>
var ctx = document.getElementById("myChart").getContext('2d');

var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["총 회원 수", "총 문의글 수", "Yellow"],
        datasets: [{
            label: '# of Votes',
            data: [	'${tot}','${totq}', 5],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',        
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',         
            ],
            borderWidth: 1
        }]
    },
    options: {
        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ["총 회원 수", "총 문의글 수", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [	'${tot}','${totq}', 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
	
	
</body>
</html>

