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
.card text-white bg-flat-color-1 {
	position: relative;
	left: -10%
}
</style>

</head>

<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>


		<div class="content mt-3">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="col-lg-3">토핑선택</h4>


							<br>
							<div class="col-lg-3">
								<div class="card text-white bg-flat-color-1">

									<div class="dropdown float-right">
										<button
											class="btn bg-transparent dropdown-toggle theme-toggle text-light"
											type="button" id="dropdownMenuButton2" data-toggle="dropdown">

										</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton2">
											<div class="dropdown-menu-content">
												<a class="dropdown-item" href="#">불고기</a> <a
													class="dropdown-item" href="#">치즈</a> <a
													class="dropdown-item" href="#">페페로니</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<br> <br> <br>


							<h4 class="col-lg-3">수량선택</h4>


							<br>

							<div class="col-lg-3">
								<div class="card text-white bg-flat-color-1">

									<div class="dropdown float-right">
										<button
											class="btn bg-transparent dropdown-toggle theme-toggle text-light"
											type="button" id="dropdownMenuButton2" data-toggle="dropdown">

										</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton2">
											<div class="dropdown-menu-content">
												<a class="dropdown-item" href="#">10kg</a> <a
													class="dropdown-item" href="#">20kg</a> <a
													class="dropdown-item" href="#">30kg</a>
											</div>
										</div>
									</div>
								</div>
							</div>



							<br> <br> <br> <br>
							<div class="col-lg-3">
								<button type="button" class="btn btn-secondary">
									<i class="fa fa-shopping-cart"></i>&nbsp; 추가하기
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /# column -->

				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">선택 품목</strong>
						</div>
						<div class="card-body">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">#</th>
										<th scope="col">토핑</th>
										<th scope="col">중량</th>
										<th scope="col">가격</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>불고기</td>
										<td>30kg</td>
										<td>150,000</td>
										<td>
											<button type="button" class="btn btn-secondary btn-sm">-</button>
										</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>치즈</td>
										<td>60kg</td>
										<td>80,000</td>
										<td>
											<button type="button" class="btn btn-secondary btn-sm">-</button>
										</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>페페로니</td>
										<td>30kg</td>
										<td>50,000</td>
										<td>
											<button type="button" class="btn btn-secondary btn-sm">-</button>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h4 class="col-lg-3" style = "font-size : 1.2em">총금액 : <div style = "color : red; display : inline; font-size : 1.2em">280,000</div></h4>
				<hr>
					<div align = "right">
					<button onclick = "location.href = 'movePage.com?movePage=companyStock'" type="button" class="btn btn-primary" style = "width : 150px">신청</button>
					<button onclick = "location.href = 'movePage.com?movePage=companyStock'" type="button" class="btn btn-secondary" style = "width : 150px">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /# column -->

	</div>



	</div>

	<script
		src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<script src="${contextPath }/resources/companyCss/assets/js/widgets.js"></script>
</body>
</html>