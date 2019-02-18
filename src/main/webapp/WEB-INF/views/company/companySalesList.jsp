<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
td {
	font-size: 0.9em;
}

.col-lg-4{
	position : relative;
	left : 65%;
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
								<th style="width: 6%">번호</th>
								<th style="width: 11%">날짜</th>
								<th style="width: 7%">카테고리</th>
								<th style="width: 60%">판매, 구매물품</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${inComeList}" var="value">
								<tr class="adminMessageTr" style="cursor: pointer;">
									<td>${ value.salesNo }</td>
									<td>${ value.salesInputdate }</td>
									<td>수익</td>
									<td>${ value.addTopping }</td>
									<td>${ value.salesPrice }원</td>
								</tr>
							</c:forEach>
							<c:forEach items="${outComeList}" var="value">
								<tr class="adminMessageTr" style="cursor: pointer;">
									<td>${ value.salesNo }</td>
									<td>${ value.salesInputdate }</td>
									<td>지출</td>
									<td>${ value.materialName }(${ value.materialWeight }KG)</td>
									<td>${ value.salesPrice }원</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>





				</div>
			</div>
		</div>
<%-- 
<div class="modal fade" id="smallmodal" tabindex="-1" role="dialog"
		aria-labelledby="smallmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="smallmodalLabel">스마트폰 번호 입력</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" id="smsForm">
						번호입력 : <input type="text" name="from" style="border-radius: 5px" />
						<input type = "hidden" name="text" value = '
						[피자학교]업체 매출 내역안내
						안녕하세요, 점주님의 매출 내역을 안내해드립니다!
						▣지출품목
						<c:forEach items="${outComeList}" var="value">
							◆  ${ value.salesInputdate }, ${ value.materialName }(${ value.materialWeight }KG),${ value.salesPrice }원, 	
						</c:forEach>
						▣수익품목
						<c:forEach items="${inComeList}" var="value">
							◆${ value.salesInputdate }, ${ value.addTopping }, ${ value.salesPrice }원, 	
						</c:forEach>'/>
						<!-- 명세서 내역 입력  -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="sendSMS('sendExampleMsg2.com')" value="전송하기">전송</button>
				</div>
			</div>
		</div>
	</div>

 --%>


		<div class="content mt-3">

		<%-- 	<div class="col-lg-8" style="background: lightgray;">
				<img
					src="${contextPath }/resources/companyCss/images/Smartphone-Message-icon.png"
					style="width: 50px; height: 50px">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				'매출 내역 받기' 클릭시 내역이 스마트폰으로 전송됩니다!
			</div> --%>
			<div class="col-lg-4">
				<div align="right">
					<!-- <button  type="button" class="btn btn-primary" style="width: 150px" data-toggle="modal" data-target="#smallmodal">매출
						내역 받기</button> -->
					<button onclick="location.href='selectAllCompanySales.com?comNo=${sessionScope.loginUser.comNo }'" type="button"
						class="btn btn-secondary" style="width: 150px">돌아가기</button>
				</div>
			</div>

		</div>




	</div>
<!-- 	<script>
	 function sendSMS(pageName){
			//전송해야되는 명세서 내용을 text에 담아 전송
			
	    	$("#smsForm").attr("action", pageName);
	    	$("#smsForm").submit();
	    }
  </script> -->

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