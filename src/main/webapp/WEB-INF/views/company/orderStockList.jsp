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

</head>

<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<strong class="card-title">주문 재고</strong>
				</div>
				<div class="card-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">#</th>
								<th scope="col">토핑</th>
								<th scope="col">중량</th>
								<th scope="col">가격</th>
								<th scope="col">신청날짜</th>
								<th scope="col">수령상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></th>
								<td>불고기</td>
								<td>30kg</td>
								<td>150,000</td>
								<td>
									2019.01.28
								</td>
								<td>X</td>
							</tr>
							<tr>
								<th scope="row"><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></th>
								<td>치즈</td>
								<td>60kg</td>
								<td>80,000</td>
								<td>
									2019.01.28
								</td>
								<td>X</td>
							</tr>
							<tr>
								<th scope="row"><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></th>
								<td>페페로니</td>
								<td>30kg</td>
								<td>50,000</td>
								<td>
									2019.01.28
								</td>
								<td>X</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		
		
		
		
		<div class="content mt-3">

				<div class="col-lg-8" style = "background : white;">
					<img src = "${contextPath }/resources/companyCss/images/shoppingCart.png" style = "width : 50px; height : 50px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					신청목록에서 수령확인시 지점 재고량에 자동 반영됩니다!
				</div>
				<div class="col-lg-4">
					<div align = "right">
					<button onclick = "location.href = 'movePage.com?movePage=companyStock'" type="button" class="btn btn-primary" style = "width : 150px">수령확인</button>
					<button onclick = "location.href = 'movePage.com?movePage=companyStock'" type="button" class="btn btn-secondary" style = "width : 150px">취소</button>
					</div>
				</div>
			
		</div>
		
		
		
		
		
		

	</div>
</body>
</html>