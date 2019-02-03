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
.adminMessageTr:hover {
	background: lightgray !important;
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
					<strong class="card-title">내 지점 후기</strong>
				</div>
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-bordered"
						style="table-layout: fixed; word-wrap: break-word;">
						<thead>
							<tr>
								<th style="width: 8%">게시글<br>번호
								</th>
								<th style="width: 13%">작성자</th>
								<th style="width: 22%">제목</th>
								<th style="width: 33%">내용</th>
								<th style="width: 15%">작성일</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>1</td>
								<td>minkyu112</td>
								<td>사당점 추천해요~</td>
								<td>이번에 집앞에 새로 생겨서 가봤는데, 정말 맛있어요!</td>
								<td>190203 13:29</td>
								<td>X</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>2</td>
								<td>tjnwn123</td>
								<td>치즈 많이 올려먹어보는거는 처음이에요!</td>
								<td>기본 치즈양에서 추가로 올려먹으니까, 엄청 맛있어요</td>
								<td>190202 11:05</td>
								<td>X</td>
							</tr>
							<tr class="adminMessageTr" style="cursor: pointer;">
								<td>3</td>
								<td>pizzaMan551</td>
								<td>직접 만드니까 재밌네요</td>
								<td>제가 원하는대로 만들어먹으니까, 만족도가 높아요</td>
								<td>190201 20:29</td>
								<td>O</td>
							</tr>
						</tbody>
					</table>





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