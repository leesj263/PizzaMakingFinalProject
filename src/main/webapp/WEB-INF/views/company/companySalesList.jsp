<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<strong class="card-title">매출 내역</strong>
				</div>
				<div class="card-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">토핑</th>
								<th scope="col">중량</th>
								<th scope="col">신청자</th>
								<th scope="col">신청날짜</th>
								<th scope="col">가격</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>불고기</td>
								<td>30kg</td>
								<td>황민규</td>
								<td>2019.01.28</td>
								<td>150,000</td>
							</tr>
							<tr>
								<td>치즈</td>
								<td>60kg</td>
								<td>황민규</td>
								<td>2019.01.28</td>
								<td>80,000</td>
							</tr>
							<tr>
								<td>페페로니</td>
								<td>30kg</td>
								<td>황민규</td>
								<td>2019.01.28</td>
								<td>50,000</td>
							</tr>
							<tr>
								<td>토마토소스</td>
								<td>10kg</td>
								<td>황민규</td>
								<td>2019.02.01</td>
								<td>100,000</td>
							</tr>
							<tr>
								<td>도우</td>
								<td>60kg</td>
								<td>황민규</td>
								<td>2019.02.01</td>
								<td>80,000</td>
							</tr>
							<tr>
								<td>새우</td>
								<td>30kg</td>
								<td>황민규</td>
								<td>2019.02.01</td>
								<td>170,000</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: right; font-size: 1.3em"><b>결제
										예정 금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td style="color: red"><b style="font-size: 1.3em">630,000</b>원</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>




		<div class="content mt-3">

			<div class="col-lg-8" style="background: lightgray;">
				<img
					src="${contextPath }/resources/companyCss/images/Smartphone-Message-icon.png"
					style="width: 50px; height: 50px">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				'매출 내역 받기' 클릭시 내역이 스마트폰으로 전송됩니다!
			</div>
			<div class="col-lg-4">
				<div align="right">
					<button
						onclick="location.href = 'movePage.com?movePage=companySales'"
						type="button" class="btn btn-primary" style="width: 150px">매출 내역 받기</button>
					<button
						onclick="location.href = 'movePage.com?movePage=companySales'"
						type="button" class="btn btn-secondary" style="width: 150px">돌아가기</button>
				</div>
			</div>

		</div>




	</div>
</body>
</html>