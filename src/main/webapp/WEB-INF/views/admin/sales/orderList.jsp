<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#orderList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>orderList.jsp</p>
			<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">주문 목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 주문 목록 영역 -->
	
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="orderList">
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">주문일자</th>
							<th scope="col">주문금액</th>
							<th scope="col">주문아이디</th>
							<th scope="col">주문지점</th>
							<th scope="col">진행상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">3</th>
							<td>2019-01-26 15:06</td>
							<td>28,500</td>
							<td>asdfqds</td>
							<td>강남점</td>
							<td>결제완료</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>2019-01-26 15:04</td>
							<td>26,000</td>
							<td>qjdsdj</td>
							<td>고덕점</td>
							<td>제조중</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>2019-01-26 15:04</td>
							<td>31,500</td>
							<td>kghnmn</td>
							<td>왕십리점</td>
							<td>배달완료</td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
	<!-- 검색 영역 -->
	<div class="form-inline col-md-5">
		<form class="search-form">
			<select class="form-control" name="searchOrder">
				<option value="orderNo">주문번호</option>
				<option value="userId">아이디</option>
				<option value="orderSeller">주문지점</option>
			</select> 
			<input class="form-control mr-sm-2" type="text"name="searchOrderValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchOrder();">
			<i class="fa fa-search"></i>
		</button>
	</div>
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
	<div class="col-md-1"></div>
	<script>
		$(function(){
			$("#orderList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=sales/orderDetail";
			});
		});
		function searchOrder(){
			
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>