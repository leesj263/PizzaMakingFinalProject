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
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<style>
td {
	font-size: 0.9em;
}
</style>

<script>
	selectOrderNo = 0;
</script>
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
										<li class="nav-item"><a class="nav-link active"
											style="background: #F7F7F7" href="orderMaking.com">제조중</a></li>
										<li class="nav-item"><a class="nav-link"
											href="orderDelivering.com">배달중</a></li>
										<li class="nav-item"><a class="nav-link "
											href="orderComplete.com">배달완료</a></li>
										<li class="nav-item"><a class="nav-link "
											href="orderRefuseList.com">거절목록</a></li>
									</ul>
								</div>
							</div>
							<!-- 화면 전환 탭  끝-->
							<div class="card-header">
								<strong class="card-title">제조중 목록</strong>
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
													<button type="button" class="btn btn-primary btn-sm"
														data-toggle="modal" data-target="#smallmodal" id = "${ value.orderNo }" onclick = "modalBtn(this)">배달원
														지정</button>
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

	<!--모달 상세 시작  -->
	<div class="modal fade" id="smallmodal" tabindex="-1" role="dialog"
		aria-labelledby="smallmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="smallmodalLabel">배달원 지정하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">남아있는 배달원</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<c:forEach items = "${DeliveryManList}" var = "value">
							<c:if test="${value.empDeliveryStatus == 'Y'}">
								<a class="dropdown-item" id = "${value.employeeNo}" onclick = "clickDeliveryMan(this)">${ value.employeeName }</a>
							</c:if>
							<c:if test="${value.empDeliveryStatus == 'N'}">
								<a class="dropdown-item" style = "background : gray">${ value.employeeName }</a>
							</c:if>
						</c:forEach>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<!-- <button type="button" class="btn btn-primary">확정</button> -->
				</div>
			</div>
		</div>
	</div>

<script>
	function modalBtn(btn){
		console.log($(btn).attr('id'));
		selectOrderNo = $(btn).attr('id');
		
	}
	
	function clickDeliveryMan(btn){
		var empNo = $(btn).attr('id');
		location.href = "assignDeliveryMan.com?orderNo=" + selectOrderNo +"&empNo="+empNo;
	}
</script>


	<!--모달 상세 끝 -->
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