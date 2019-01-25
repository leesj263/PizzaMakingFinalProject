<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#sellerSalesList, #sellerOrderList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>sellerOrder.jsp</p>
	<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">업체 정보</h3>
			</div>
			<div class="card-body">
				<!-- 업체 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>지점명</span><p>강남점</p></li>
							<li class="member-li"><span>이메일</span><p>asdflaksdf@asdfa.com</p></li>
							<li class="member-li"><span>영업 상태</span><p>영업중</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>매출</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>아이디</span><p>asdfasdfa</p></li>
							<li class="member-li"><span>개점일</span><p>2018-11-01</p></li>
							<li class="member-li"><span>?????</span><p>2018-12-12</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				
				<!-- 승인 상태일 때 불러오는 것 -->
				<div class="row">
					<div class="col-md-2"></div>
					
					<!-- 매출 영역 -->
					<table class="table table-striped col-md-4" id="sellerSalesList">
						<thead>
							<tr>
								<th scope="col">매출번호</th>
								<th scope="col">집계기간</th>
								<th scope="col">매출액</th>
								<th scope="col">주문건</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>2018-12</td>
								<td>11,125,110</td>
								<td>45</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>2018-11</td>
								<td>13,551,181</td>
								<td>62</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>2018-10</td>
								<td>12,458,820</td>
								<td>56</td>
							</tr>
						</tbody>
					</table>
					<!-- <div class="col-sm-1"></div>	 -->				
					<!-- 업체 주문 영역  -->
					<table class="table table-striped col-md-4" id="sellerOrderList">
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">주문일자</th>
								<th scope="col">주문내용</th>
								<th scope="col">주문상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>2018-12-12</td>
								<td>Mark</td>
								<td>수령완료</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>2018-12-06</td>
								<td>Jacob</td>
								<td>Thornton</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>2019-01-20</td>
								<td>Larry</td>
								<td>the Bird</td>
							</tr>
						</tbody>
					</table>
					<div class="col-md-2"></div>
				</div>
				<!-- 주문 내역 선택 함수 -->
				<script>
					$(function() {
						$("#userOrderList").find("td").mouseenter(function() {
							$(this).parent().css({
								"color" : "#9d9d9d",
								"cursor" : "pointer"
							});
						}).mouseout(function() {
							$(this).parent().css({
								"color" : "#212529"
							});
						}).click(function() {
							var num = $(this).parent().children().eq(0).text();
							console.log(num);
						});
					})
				</script>
				<!-- 주문 내역 선택 끝 -->
				<!-- 페이징 처리 div -->
				<div class="row">
					<div class="col-md-3"></div>
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
					<!-- <div class="col-sm-1"></div> -->
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
					<div class="col-md-2"></div>
				</div>
				<!-- 페이징 처리 끝 -->
				<!-- 승인 대기중일 때 불러오는 것 -->
				
			</div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
