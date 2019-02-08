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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#employeeAddBtn {
	position: relative;
	left: 900px
}

#backBtn {
	position: relative;
	left: 930px
}

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
							<div class="card-header">
								<strong class="card-title">업체 직원 관리</strong>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table-export"
									class="table table-striped table-bordered"
									style="table-layout: fixed; word-wrap: break-word;">

									<thead>
										<tr>
											<th style="width: 7%"></th>
											<th style="width: 8%">번호</th>
											<th style="width: 10%">직급</th>
											<th style="width: 10%">이름</th>
											<th style="width: 15%">번호</th>
											<th style="width: 30%">주소</th>
											<th style="width: 20%">입사일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="value">
											<c:if test="${ value.employeeStatus == 'Y' }">
												<tr class="adminMessageTr" style="cursor: pointer;">
													<td><input type="checkbox" name="checkComMember"
														id="${ value.employeeNo }"
														style="width: 20px; height: 20px"></td>
													<td>${ value.employeeNo }</td>
													<c:if test="${ value.employeeRank =='manager'}">
														<td>점장</td>
													</c:if>
													<c:if test="${ value.employeeRank =='cook'}">
														<td>요리사</td>
													</c:if>
													<c:if test="${ value.employeeRank =='delivery'}">
														<td>배달원</td>
													</c:if>
													<c:if test="${ value.employeeRank =='partTime'}">
														<td>아르바이트</td>
													</c:if>
													<td>${ value.employeeName }</td>
													<td>${ value.employeePhone }</td>
													<td>${ value.employeeAddress }</td>
													<td>${ value.employeeDate }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<button id="employeeAddBtn" type="button" class="btn btn-primary"
							onclick="location.href = 'movePage.com?movePage=inputCompanyMember'">
							<i class="fa fa-sign-in"></i>&nbsp; 입력하기
						</button>
						<button id="backBtn" type="button" class="btn btn-secondary"
							onclick="deleteEmployeeInfo()">
							<i class="fa fa-sign-out"></i>&nbsp; 삭제하기
						</button>
					</div>


				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->




	</div>
	<script>
    	function deleteEmployeeInfo(){
    		var arr = new Array();
    		$("input:checkbox:checked").each(function (index) {  
    	        //str += $(this).parent().css("background", "black") + ",";  
    	        arr.push($(this).parent().parent().children("td").eq(1).text());
    	    });  
			
     	  	//alert(arr); 
     	  	swal({
				  title: "정말 삭제하시겠습니까?",
				  text: "한번 지우시면 다시 복구하실 수 없습니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    $.ajax({
		     	  		url : "deleteEmployeeInfo.com",
		     	  		type : "get",
		     	  		data : {
		     	  			arr : arr
		     	  		},
		     	  		traditional : true,
		     	  		success : function(data){
		     	  			swal("회원삭제가 정상적으로 이루어졌습니다!").then((value) =>{
								if(value = "ok"){
									location.href = "selectEmployeeList.com";
								}
							});
		     	  			console.log(data);
		     	  			
		     	  		},
		     	  		error : function(data){
		     	  			console.log(data);
		     	  		}
		     	  		
		     	  	});
				  } else {
				    swal("회원 삭제를 취소합니다!");
				  }
				});
     	  	
     	  	
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