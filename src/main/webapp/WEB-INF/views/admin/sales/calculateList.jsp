<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>

</style>
<section>
	<div class="right-panel">
	
		<p>calculateList.jsp</p>
					<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">정산 목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 주문 목록 영역 -->
	
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="calculateList">
					<thead>
						<tr>
							<th scope="col">정산번호</th>
							<th scope="col">정산월</th>
							<th scope="col">지점</th>
							<th scope="col">정산금액</th>
							<th scope="col">정산상태</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">3</th>
							<td>2019-01</td>
							<td>강남점</td>
							<td>4,516,900</td>
							<td>미정산</td>
							<td><button class="btn btn-outline-warning" onclick="">정산완료</button></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>2019-01</td>
							<td>고덕점</td>
							<td>3,150,400</td>
							<td>정산완료</td>
							<td><button class="btn btn-outline-secondary" disabled>정산완료</button></td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>2019-01</td>
							<td>왕십리점</td>
							<td>4,780,000</td>
							<td>미정산</td>
							<td><button class="btn btn-outline-warning" onclick="">정산하기</button></td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="col-md-4"></div>
	<!-- 검색 영역 -->
	
	<!-- 페이징 영역 -->
	<div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
		<ul class="pagination">
			<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a></li>
			<li class="paginate_button page-item active"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
			<li class="paginate_button page-item next" id="bootstrap-data-table_next"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a></li>
		</ul>
	</div>
	<div class="col-md-4"></div>
	<script>
		$(function(){
			$("#calculateList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=sales/calculateDetail";
			});
		});
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>