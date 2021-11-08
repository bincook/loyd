<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> Mypage - EnquiryDetail</title>
	
<style>
#container {
	margin: auto;
	padding-bottom: 200px;
	width: 1100px;
}

h1 {
	font-size: 36px;
	font-family: "SpoqaHanSans";
	font-weight: 900;
	color: #000;
}

#enquiry-detail {
	position: relative;
	margin-top: 100px;
}

#enquiry-detail #enquiry-title {
	font-size: 24px;
	padding-bottom: 16px;
	color: #000;
}

#enquiry-detail #enquiry-content #enquiry-sub {
	display: flex;
	justify-content: space-between;
	border-top: 2px solid #000;
	border-bottom: 1px solid #000;
	padding-top: 16px;
	padding-bottom: 16px;
	text-align: start;
	font-size: 16px;
	font-weight: bold;
	color: #000;
}

#enquiry-content #enquiry-sub #enquiry-type {width: 15%;text-align: center;}
#enquiry-content #enquiry-sub #enquiry-member-title {width: 85%;}

#enquiry-content #enquiry-member-content {
	border-bottom: 2px solid #000;
	font-size: 16px;
	font-weight: bold;
	color: #000;
	padding-bottom: 100px;
	padding-top: 20px;
	padding-left: 12px;
}

#button {
	text-align: right;
	padding: 20px;
}

.btn-primary{
	background: #133c2b;
	border: none;
}
</style>
</head>
<body>

<div id="container">
	<div id="enquiry-detail">
		<div id="enquiry-title">
			<h1> 문의 상세 내역</h1>
		</div>
		
		<div id="enquiry-content">
			
			<!-- 두번째줄 (유형과 제목이 같이 존재함) -->
			<div id="enquiry-sub">
				<div id="enquiry-type">
					<span> { ${enquiry_d.qnatype } }</span>
				</div>
				
				<div id="enquiry-member-title">
					<span> &nbsp; ${enquiry_d.title }</span>
				</div>
			</div>
			<div id="enquiry-member-content">
				<span> 문의 번호 [ ${enquiry_d.id } ]</span><br>
				<span> ${enquiry_d.content }</span>
			</div>
		</div>
		
		<div id="button">
			<div class="form-group">
					<a class="btn btn-primary" href="../qna/write" onclick="enquiry()"> 문의 작성하러가기</a>
			</div>
		</div>
	</div>
</div>

</body>
</html>