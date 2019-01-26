<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp"/>
<style>
	.card-header{
		border:0px;
	}
	table{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<p>toppingList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">토핑 목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 업체 목록 영역 -->
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="userList">
					<thead>
						<tr>
							<th scope="col">토핑 번호</th>
							<th scope="col">이름</th>
							<th scope="col">매입가</th>
							<th scope="col">도매가</th>
							<th scope="col">판매가</th>
							<th scope="col">상태</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">3</th>
							<td>피망</td>
							<td>000</td>
							<td>000</td>
							<td>000</td>
							<td>판매중</td>
							<td><button class="btn btn-sm btn-outline-warning" data-toggle="modal" data-target="#mediumModal">수정</button></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>페퍼로니</td>
							<td>000</td>
							<td>000</td>
							<td>000</td>
							<td>판매중</td>
							<td><button class="btn btn-sm btn-outline-warning" data-toggle="modal" data-target="#mediumModal">수정</button></td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>피망</td>
							<td>000</td>
							<td>000</td>
							<td>000</td>
							<td>판매중</td>
							<td><button class="btn btn-sm btn-outline-warning" data-toggle="modal" data-target="#mediumModal">수정</button></td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<!-- 페이징 영역 -->
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
	<div class="col-md-4">
		<button class="btn btn-outline-warning">토핑 추가</button>
	</div>
		<div class="modal fade" id="mediumModal" tabindex="-1" role="dialog"
			aria-labelledby="mediumModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="mediumModalLabel">토핑 상세보기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>토핑 상세 보기</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-primary">Confirm</button>
					</div>
				</div>
			</div>
		</div>
		<script>
		
	</script>
	</div>
</section>
<jsp:include page="../../common/footer.jsp"/>
