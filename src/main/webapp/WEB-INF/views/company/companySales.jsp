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
	.col-lg-8{
		position : relative;
		left : 15%
	}
	
	#salesListBtn{
		position : relative;
		left : 68%
	}
</style>

</head>
<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>


		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">



					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4 class="mb-3">매출관리</h4>
								<canvas id="lineChart"></canvas>
							</div>
						</div>



					</div>

				</div>
				<!-- .animated -->
				<button id = "salesListBtn" onclick = "location.href = 'movePage.com?movePage=companySalesList'" type="button" class="btn btn-primary" style = "width : 150px">매출 내역</button>
			</div>
			<!-- .content -->
		</div>
	</div>
	<script
		src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/assets/js/init-scripts/chart-js/chartjs-init2.js?after"></script>
</body>
</html>