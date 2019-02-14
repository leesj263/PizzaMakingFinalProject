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
<style>
	td{
		font-size : 0.9em;
	}
</style>
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
					<table id="bootstrap-data-table-export"
						class="table table-striped table-bordered"
						style="table-layout: fixed; word-wrap: break-word;">
						<thead>
							<tr>
								<th style = "width : 6%">번호</th>
								<th style = "width : 11%">날짜</th>
								<th style = "width : 12%">카테고리</th>
								<th style = "width : 24%">판매, 구매물품</th>
								<th style = "width : 25%">가격</th>
							</tr>
						</thead>
						<tbody>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>1</td>
								<td>minkyu112</td>
								<td>010-9972-5512</td>
								<td>방배3동 고가도로 212가길 18 301호</td>
								<td>치즈 20g, 새우 80g, 토마토소스</td>
								<td>21,000원</td>
								<td>19.01.17 19:03</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>2</td>
								<td>tjnwn123</td>
								<td>010-6751-7715</td>
								<td>사당1동 남부순환로 212가길 18 502호</td>
								<td>불고기 50g, 치즈 80g, 토마토소스</td>
								<td>18,000원</td>
								<td>19.01.17 19:01</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>3</td>
								<td>pizzaMan551</td>
								<td>010-2491-9905</td>
								<td>동작 2동 사이도로 117나길 5 5동 201호</td>
								<td>치즈 10g, 페페로니 180g, 데리야끼소스</td>
								<td>25,000원</td>
								<td>19.01.17 18:53</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>4</td>
								<td>qikkzam1</td>
								<td>010-8132-5512</td>
								<td>방배3동 고가도로 212가길 18 301호</td>
								<td>치즈 20g, 새우 80g, 토마토소스</td>
								<td>19,000원</td>
								<td>19.01.16 19:03</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>5</td>
								<td>jgcjww3</td>
								<td>010-8811-7715</td>
								<td>사당1동 남부순환로 212가길 18 502호</td>
								<td>불고기 50g, 치즈 80g, 토마토소스</td>
								<td>12,000원</td>
								<td>19.01.16 19:01</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>6</td>
								<td>2sfxrrr551</td>
								<td>010-3391-9905</td>
								<td>동작 2동 사이도로 117나길 5 5동 201호</td>
								<td>치즈 10g, 페페로니 180g, 데리야끼소스</td>
								<td>25,000원</td>
								<td>19.01.16 18:53</td>
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
						type="button" class="btn btn-primary" style="width: 150px">매출
						내역 받기</button>
					<button
						onclick="selectAllCompanySales.com"
						type="button" class="btn btn-secondary" style="width: 150px">돌아가기</button>
				</div>
			</div>

		</div>




	</div>


	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/jszip/dist/jszip.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/pdfmake/build/vfs_fonts.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/assets/js/init-scripts/data-table/datatables-init.js"></script>
</body>
</html>