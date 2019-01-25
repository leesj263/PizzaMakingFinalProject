<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	div.card-header{
		border:0px;
	}
</style>
<section>
	<div class="right-panel">
		<p>sellerList.jsp</p>
		
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">업체목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 업체 목록 영역 -->
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="userList">
					<thead>
						<tr>
							<th scope="col">업체 번호</th>
							<th scope="col">ID</th>
							<th scope="col">지점명</th>
							<th scope="col">개점일자</th>
							<th scope="col">영업상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>강남점</td>
							<td>2018-12-12</td>
							<td>영업중</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>선릉점</td>
							<td>2018-12-06</td>
							<td>영업중</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>해운대점</td>
							<td>2019-01-20</td>
							<td>개점준비중</td>
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
			<select class="form-control" name="searchUser">
				<option value="name">이름</option>
				<option value="userId">아이디</option>
				<option value="order">주문</option>
			</select> <input class="form-control mr-sm-2" type="text"
				name="searchUserValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchUser();">
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
		function searchUser() {
			var searchUser = $("select[name='searchUser']").val();
			var searchUserValue = $("input[name='searchUserValue']").val();
			console.log(searchUser + " / " + searchUserValue);
		}
		$(function(){
			$("#userList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
			});
		})
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
