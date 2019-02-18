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
							<div class="card-header">
								<strong class="card-title">주문 재료 목록</strong>
							</div>
							<div class="card-body">

								<table id="bootstrap-data-table-export"
									class="table table-striped table-bordered"
									style="table-layout: fixed; word-wrap: break-word;">
									<thead class="thead-dark">
										<tr>
											<th scope="col"><input type="checkbox" name="orderMaterialListcheckHeader"
															style="width: 20px; height: 20px" onclick = "toggleCheckbox()"></th>
											<th scope="col">토핑</th>
											<th scope="col">중량</th>
											<th scope="col">가격</th>
											<th scope="col">신청날짜</th>
											<th scope="col">수령상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="value">
											<tr class="adminMessageTr" style="cursor: pointer;" orderMNo = "${value.orderMNo}">
												<th scope="row"><c:if
														test="${ value.orderMStatus == 1 ||  value.orderMStatus == 2 }">
														<input type="checkbox" name="orderMaterialListcheck"
															style="width: 20px; height: 20px" >
													</c:if></th>
												<td>${ value.materialName }</td>
												<td>${ value.materialWeight }KG</td>
												<td>${ value.materialPrice }원</td>
												<td>${ value.orderMDate }</td>
												<c:if test="${ value.orderMStatus == 1}">
													<td>미수령</td>
												</c:if>
												<c:if test="${ value.orderMStatus == 2}">
													<td>배달완료</td>
												</c:if>
												<c:if test="${ value.orderMStatus == 3}">
													<td>수령완료</td>
												</c:if>

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


<script>
	function toggleCheckbox(){
		if($("input:checkbox[name = 'orderMaterialListcheckHeader']").prop("checked")){
			$("input:checkbox[name = 'orderMaterialListcheck']").prop("checked", true);
		}else{
			$("input:checkbox[name = 'orderMaterialListcheck']").prop("checked", false);
		}
		
	}
	
	
	function receiptConfirm(){
		var arr = new Array();
		$("input:checkbox:checked[name='orderMaterialListcheck']").each(function(){
			console.log($(this).parent().parent().attr("orderMNo"));
			arr.push($(this).parent().parent().attr("orderMNo"));
		});
		
		console.log(arr);
		
		$.ajax({
			url : "receiptConfirm.com",
			data : {arr : arr},
			type : "get",
			traditional : true,
			success : function(data){
				console.log(data);
				location.href = "selectOrderStockList.com";
			},
			error : function(data){
				console.log(data);
			}
		});
	}

</script>




		<div class="content mt-3">

			<div class="col-lg-8" style="background: white;">
				<img
					src="${contextPath }/resources/companyCss/images/shoppingCart.png"
					style="width: 50px; height: 50px">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				신청목록에서 수령확인시 지점 재고량에 자동 반영됩니다!
			</div>
			<div class="col-lg-4">
				<div align="right">
					<button
						onclick = "receiptConfirm()"
						type="button" class="btn btn-primary" style="width: 150px">수령확인</button>
					<button
						onclick="location.href = 'selectAllMaterialList.com'"
						type="button" class="btn btn-secondary" style="width: 150px">취소</button>
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




	</div>
</body>
</html>