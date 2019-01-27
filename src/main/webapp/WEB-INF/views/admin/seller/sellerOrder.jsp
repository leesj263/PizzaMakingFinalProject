<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#sellerOrderList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>sellerOrder.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">재료 주문 목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 업체 목록 영역 -->
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-6">
					<button class="btn btn-sm btn-link" disabled>선택한 주문을</button>
					<select name="orderStatus">
						<option>분류를 선택하세요</option>
						<option value="delivery">주문상태</option>
						<option value="calculate">정산상태</option>
					</select>
					<select name="orderStatus1">
						<option>분류를 선택하세요</option>
						<option value="delivery">발송완료</option>
						<option value="calculate">정산완료</option>
					</select>
					<button class="btn btn-sm btn-outline-warning">로 상태변경</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="sellerOrderList">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th scope="col">주문번호</th>
							<th scope="col">주문일자</th>
							<th scope="col">지점</th>
							<th scope="col">주문내역</th>
							<th scope="col">진행상태</th>
							<th scope="col">정산여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<th scope="row">3</th>
							<td>2019-01-26</td>
							<td>인천송도점</td>
							<td>피자 도우 50개 외 5건</td>
							<td>수령대기중</td>
							<td>미정산</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<th scope="row">2</th>
							<td>2019-01-25</td>
							<td>고덕점</td>
							<td>피자치즈 50봉 외 8건</td>
							<td>수령완료</td>
							<td>미정산</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<th scope="row">1</th>
							<td>2019-01-25</td>
							<td>왕십리점</td>
							<td>피자 박스 1000개 외 12건</td>
							<td>수령완료</td>
							<td>미정산</td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
		<div class="col-md-4"></div>
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
			$("#sellerOrderList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=seller/sellerOrderDetail";
			});
		})
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
