<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#container {
	position: relative;
	margin: auto;
	padding: 72px 60px 0;
	width: 1360px;
    overflow: hidden;
    background-color: #ffffff;
}

div {
	box-sizing: border-box;
    margin: 0;
    padding: 0;
    border: 0;
    font-family: "SpoqaHanSans";
    font-size: 100%;
    vertical-align: baseline;
}

h1 {
	font-size: 36px;
	font-family: "SpoqaHanSans";
	font-weight: 900;
	color: #000;
}

ul,
li {
	list-style: none;
}

a {
    text-decoration: none;
    color: #222;
}

a:hover {
	text-decoration: none;
    color: #222;
}

#left-side_menu {
    position: absolute;
    width: 310px;
    height: 100%;
    top: 0;
    z-index: 1;
}

#left-side_menu #left-dev-menu {
	padding: 30px 35px 0 30px;
}

#left-side_menu #left-dev-menu #mypage-subtitle {
	display: inline-block;
    font-family: "Cormorant Garamond";
    font-size: 28px;
    font-weight: 600;
    line-height: normal;
    color: #000;
}

#left-side_menu #left-dev-menu #mypage-list {
	overflow-y: hidden;
	margin: 40px 0;
	padding: 0;
}

#left-side_menu #left-dev-menu .menu-title {
	margin-top: 0px;
    padding: 10px 0 10px 0;
}

#left-side_menu #left-dev-menu #mypage-list span {
	font-family: "Montserrat";
    font-size: 16px;
    font-weight: 900;
    color: #000;
}

#left-side_menu #left-dev-menu .menu-title #mypage-enquiry,
#left-side_menu #left-dev-menu .menu-title #mypage-history,
#left-side_menu #left-dev-menu .menu-title #mypage-caution {
	margin: 6px 0 0;
	padding: 0;
}

#left-side_menu #left-dev-menu .menu-title #mypage-enquiry a,
#left-side_menu #left-dev-menu .menu-title #mypage-history a,
#left-side_menu #left-dev-menu .menu-title #mypage-caution a {
	font-family: "Montserrat";
    font-size: 14px;
    font-weight: normal;
    letter-spacing: normal;
    color: #7a7a7a;
}



#right-content {
	position: relative;
    float: right;
    min-height: calc(100vh - 315px);
    width: calc(100% - 310px);
    padding-bottom: 200px;
}

#right-content #content-enquiry{
	margin-top: 100px;
}

#right-content #content-enquiry #enquiry-title{
	font-size: 24px;
    padding-bottom: 16px;
    color: #000000;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-header {
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-top: 2px solid #000000;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: #000;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-view-header {
	display: flex;
    justify-content: space-between;
    padding: 16px 0px;
    border-bottom: 1px solid #000000;
    text-align: center;
    font-size: 14px;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-view-titl,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-cont {
	text-align: start;
}

#right-content #content-enquiry #enquiry-itembox #enquiry-col-numb,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-numb {width: 10%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-type,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-type {width: 15%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-titl,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-titl {width: 50%;}
#right-content #content-enquiry #enquiry-itembox #enquiry-col-date,
#right-content #content-enquiry #enquiry-itembox #enquiry-view-date {width: 25%;}


#right-content .first_text {
	font-size: 18px;
	font-weight: bold;
}

#right-content #battery {
	padding: 10px 10px 30px;
}

#right-content #keep {
	text-align: right;
	padding: 0 50px;
}

#right-content #watch #sand {
	text-align: right;
	padding-right: 50px;
}

#right-content #watch1,
#right-content #watch3,
#right-content #watch5 {
	text-align: right;
	padding: 20px 50px 20px 10px;
}

#right-content #watch2,
#right-content #watch4 {
	padding: 20px 50px 20px 10px;
}
</style>
</head>
<body>


<div id="container">
		<!-- 왼쪽 큰틀 -->
	<div id="left-side_menu" style="margin-left: 0px;">
		<!-- 왼쪽 자리 잡기 (padding margin) -->
		<div id="left-dev-menu">
			<!-- 이름 -->
			<div id="mypage-subtitle">
					<span> <a href="info"> My page</a></span>
			</div>
			
			<!-- 메뉴 리스트 -->
			<ul id="mypage-list">
			
				<li class="menu-title"> 
					<span> 나의 쇼핑 정보</span>
					
					<!-- 주문정보 -->
					<ul id="mypage-enquiry">
						<li> 
							<a href="order_list"> 주문 조회</a>
						</li>
						
						<li> 
							<a href="../cart/list?id=${id }"> 장바구니</a>
						</li>
					</ul>
				</li>

				<li class="menu-title">
					<span> 내 활동 내역</span>
					
					<!-- 활동 내역 -->
					<ul id="mypage-history">
					
						<li>
							<a href="enquiry"> 상품문의</a>
						</li>
						
						<li>
							<a href="wishlist"> 내 찜</a>
						</li>
					</ul>
				</li>
				
				<li class="menu-title">
					<span> 주의사항</span>
					
					<ul id="mypage-caution">
						<li>
							<a href="watch-care"> 취급시 주의사항</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div id="right-content">
		<div id="watch1">
			<div class="first_text">
				| 오토매틱시계 관리 TIP |
			</div>
				오토매틱 시계는 착용한 사람의 활동성에 의해 생성된 에너지가 진동추를 통해 배럴 스프링으로 전달됩니다.<br>
				이 에너지는 무브먼트의 전체로 분배되어 시계바늘 및 기타 기능을 작동시키는 동력이 됩니다.<br>

				손목의 자연스러운 움직으로 인해 시계가 계속해서 작동하므로, 매일 시계를 착용하는 것이 좋습니다.<br>

				시계가 멈춘 경우 최상의 상태에서 재시작을 하시려면 와인딩 크라운을 20회 정도 감으실 것을 추천합니다.<br> 
				그리고 태엽을 감기위해 인위적으로 세게 흔들지 않도록 주의 합니다.<br>
		</div>
		
		<div id="watch2">
			<div class="first_text">
				| 쿼츠시계 관리 TIP |
			</div>
				쿼츠는 진동하는 전기회로에 의해 매우 높은 주파수(32kHz)로 진동하는 뚜렷한 특징이 있습니다.<br>

				이런 과정으로 배터리가 공급하는 에너지를 조절하여 시계바늘이 작동하게 됩니다.
		</div>
		
		<div id="watch3">
			<div class="first_text">
				| 방수시계 관리 TIP |
			</div>
				시계 본연의 방수 기능을 유지하기 위해, 시계의 모든 봉인을 매년 체크하셔야 합니다.<br>
				또한 시계 모델별 방수 기능의 특징을 반드시 참조하여 사용하시길 바랍니다. <br>
				무브먼트를 습기로부터 보호하기 위해서는, 시간 세팅이나 기능 조절을 하신 후 반드시 크라운을 본래 위치로 누르시는 것과 
				케이스 높이와 동일하게 스크류를 조이시는 것이 중요합니다.<br>
				만일 사고로 물이 케이스 내부로 들어간 경우, 또는 습기의 흔적을 발견하신 경우, 고객 서비스 센터로 가져 가십시오.
		</div>
		
		<div id="watch4">
			<div class="first_text">
				| 가죽시계 관리 TIP |
			</div>
				가죽은 섬세하고 민감한 소재로 정기적인 손질이 필요합니다. <br>
				가죽 전용 보호관택제를 사용하여 관리해 주시고,
				화장품과의 접촉은 가죽의 노화를 가속시킬 수 있습니다.<br>
				
				가죽 밴드는 다른 소재의 밴드에 비해 수분이나 인체에서 나오는 땀 등으로 인해 영향을 받기 쉽습니다. <br>
				그로 인해 가죽이 손상되거나 변색, 악취와 함께 심하면 끊어지기 까지 할 수 있으니 각별한 주의가 필요합니다.
		</div>
		
		<div id="watch5">
			<div class="first_text">
				| 메탈시계 관리 TIP |
			</div>
				스테인레스 스틸소재의 밴드는 밴드사이 땀이나 오염 물질로 인해 녹이 생길 수 있습니다. <br>
				이는 시계점에 가시면 비싸지 않은 가격에 세척이 가능하므로 1~2년 사이 주기적으로 관리를 해 주시면 좋을 듯 합니다.<br> 
				만약 전문가의 손길이 아닌 직접 해 보시고자 하신다면 중성세제를 이용하여 손질이 가능합니다. 
		</div>
	
		<div id="battery">
			<img src="https://cdn.pixabay.com/photo/2019/09/21/17/31/rolex-4494393_960_720.jpg" width="600" height="400"><p>
	  		<div class="first_text">
		 		| 시계배터리 관리 TIP |<p>
			</div>
	
				가장 중요한 것은 설명서에 명시된 규격의 베터리를 사용하는 것입니다.<br> 
				수명이 다한 정지를 교체하지 않고 장시간 방치한 경우 전지액 등이 누출되어 부품에 손상을 끼칠 수 있습니다.<br>
				보통 배터리가 다 된 경우 다음에 배터리 교체해야지 하고 서랍속에 두는 경우가 많은데,<br>
				
				미루다가 소중한 시계가 고장날 수 있다는 것 주의하시길 바랍니다.<p>
		</div>
		
		<div id="keep">
	  		<div class="first_text">
	  	 		| 장시간 미착용 보관 TIP |<p>
			</div>
				오토매틱 시계는 상관없지만,<br>
					
				쿼츠 시계는 용두를 시간이 멈출때까지 최대한 바깥으로 빼놓습니다.<br>
				이유는 시계 내부부품은 미세한 기름기로 유활유 역할을 하며 움직이는데<br>
				그 기름기와 전지를 최대한 아끼자는 이유입니다. <p>
  		</div>
  		
  		<div id="watch">
  			<div id="sand">
	   			<img src="https://cdn.pixabay.com/photo/2020/03/22/04/10/hourglass-4955799_960_720.jpg" width="800" height="500">
	   		</div>
    	</div>
    </div>
</div>
    	
    	
 


 

</body>
</html>


