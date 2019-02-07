<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
td {
	font-size: 0.9em;
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

					<div class="col-md-12">
						<div class="card">


							<!-- 화면 전환 탭  -->
							<div class="row">
								<div class="col-lg-6">
									<ul class="nav nav-tabs" id="myTab" role="tablist">
										<li class="nav-item"><a class="nav-link "
											href="orderWaiting.com">대기중</a></li>
										<li class="nav-item"><a class="nav-link"
											href="orderMaking.com">제조중</a></li>
										<li class="nav-item"><a class="nav-link"
											href="orderDelivering.com">배달중</a></li>
										<li class="nav-item"><a class="nav-link active"
											style="background: #F7F7F7" href="orderComplete.com">배달완료</a>
										</li>
										<li class="nav-item"><a class="nav-link "
											href="orderRefuseList.com">거절목록</a></li>
									</ul>
								</div>
							</div>




							<div class="card-header">
								<strong class="card-title">배달 완료 목록</strong>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table-export"
									class="table table-striped table-bordered"
									style="table-layout: fixed; word-wrap: break-word;">
									<thead>
										<tr>
											<th style="width: 7%">번호</th>
											<th style="width: 9%">주문고객</th>
											<th style="width: 12%">고객번호</th>
											<th style="width: 15%">주소</th>
											<th style="width: 35%">추가토핑</th>
											<th style="width: 10%">주문시간</th>
											<th style="width: 12%">버튼</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="value">
											<tr class="adminMessageTr" style="cursor: pointer;">
												<td>${ value.orderNo }</td>
												<td>${ value.receiver }</td>
												<td>${ value.orderTel }</td>
												<td>${ value.deliveryAddress }</td>
												<td>${ value.addTopping }</td>
												<td>${ value.orderDate }</td>
												<td>
													<button type="button" class="btn btn-danger btn-sm" onclick = "location.href = 'orderUpdateToDelete.com?orderNo=${ value.orderNo }'">삭제</button>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->


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