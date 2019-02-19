<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
  <!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.all.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
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




		<div class="content mt-3">

			<!--  <div style = "border : 1px solid black ;display : inline; text-align : center; width : 150px; cursor: pointer">대기중</div>
        <div style = "border : 1px solid black ;display : inline; text-align : center; width : 150px; cursor: pointer">제조중</div>
        <div style = "border : 1px solid black ;display : inline; text-align : center; width : 150px; cursor: pointer">배달중</div>
        <div style = "border : 1px solid black ;display : inline; text-align : center; width : 150px; cursor: pointer">배달완료</div> -->
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<!-- 화면 전환 탭  -->
							<div class="row">
								<div class="col-lg-6">
									<ul class="nav nav-tabs" id="myTab" role="tablist">
										<li class="nav-item"><a class="nav-link  active"
											style="background: #F7F7F7" href="orderWaiting.com?comNo=${sessionScope.loginUser.comNo }">대기중</a></li>
										<li class="nav-item"><a class="nav-link"
											href="orderMaking.com?comNo=${sessionScope.loginUser.comNo }">제조중</a></li>
										<li class="nav-item"><a class="nav-link"
											href="orderDelivering.com?comNo=${sessionScope.loginUser.comNo }">배달중</a></li>
										<li class="nav-item"><a class="nav-link "
											href="orderComplete.com?comNo=${sessionScope.loginUser.comNo }">배달완료</a></li>
										<li class="nav-item"><a class="nav-link "
										href="orderRefuseList.com?comNo=${sessionScope.loginUser.comNo }">거절목록</a></li>
									</ul>
								</div>
							</div>
							<!-- 화면 전환 탭  끝-->
							<div class="card-header">
								<strong class="card-title">대기중 목록</strong>
							</div>
							<div class="card-body">

								<table id="bootstrap-data-table-export"
									class="table table-striped table-bordered"
									style="table-layout: fixed; word-wrap: break-word;">
									<thead>
										<tr>
											<th style = "width : 7%">번호</th>
											<th style = "width : 9%">주문고객</th>
											<th style = "width : 12%">고객번호</th>
											<th style = "width : 15%">주소</th>
											<th style = "width : 35%">추가토핑</th>
											<th style = "width : 10%">주문시간</th>
											<th style = "width : 12%">버튼</th>
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
													<button type="button" class="btn btn-primary btn-sm" phoneNumber = "${ value.orderTel }" orderNo = "${value.orderNo}" onclick = "acceptOrderFunction(this)">수락</button>
													<button type="button" class="btn btn-secondary btn-sm" onclick = "location.href = 'refuseOrder.com?orderNo=${value.orderNo}&comNo=${sessionScope.loginUser.comNo }'">거절</button>
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





<div class="modal" id = "orderModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>









<script>
	function acceptOrderFunction(btn){
		var orderNo = $(btn).attr("orderNo");
		var phoneNumber = $(btn).attr("phoneNumber");
		var comNo = "${sessionScope.loginUser.comNo}";
		console.log("orderNo : " + orderNo);
		console.log("comNo : " + comNo);
		console.log("phoneNumber : " + phoneNumber);
			 
	

		$.ajax({
			url : "acceptOrder.com",
			data : {
				orderNo : orderNo,
				comNo : comNo
			},
			type : "get",
			success : function(data){
				
				console.log("돌아옴")
				
				Swal.fire({
					  title: '예생 배달 소요시간을 선택해 주세요!',
					  input: 'select',
					  inputOptions: {
					    '10': '10분',
					    '20': '20분',
					    '30': '30분',
					    '40': '40분',
					    '50': '50분',
					    '60': '60분'
					  },
					  inputPlaceholder: '소요시간',
					  showCancelButton: true,
					  inputValidator: (value) => {
					    return new Promise((resolve) => {
					      if (value === '') {
					    	 resolve('소요시간을 선택해 주세요!');
					      } else {
					    	 var expectTime = value;
					    	 Swal.fire('예상 소요시간 ' + value + "분으로\n 문자를 전송합니다!").then((value) =>{
									if(value = "ok"){
										location.href = "sendCustomerDeliveryMsg.com?comNo="+comNo +"&expectTime=" + expectTime +"&phoneNumber=" + phoneNumber;
									}
								});
					      }
					    })
					  }
					})
				
				
				
				
			},
			error : function(data){
				console.log(data);
			}
		});
		//"location.href = 'acceptOrder.com?orderNo=${value.orderNo}&comNo=${sessionScope.loginUser.comNo }'"
	}

</script>


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