<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	div.card-header{
		border:0px;
	}
	#waitSeller{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<p>waitSeller.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">승인 대기 업체</h3>
			</div>
			<div class="card-body">
			
			
			<!-- 업체 목록 영역 -->
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="waitSeller">
				<c:if test="${waitSeller.size() > 0 }">
					<thead>
						<tr>
							<th scope="col">업체 번호</th>
							<th scope="col">ID</th>
							<th scope="col">지점명</th>
							<th scope="col">개점일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${waitSeller }" var="seller">
							<tr>
								<th scope="row">${seller.comNo }</th>
								<td>${seller.memberId }</td>
								<td>${seller.comName }</td>
								<td>
									<c:if test="${empty seller.comDate }">미정</c:if>
									<c:if test="${not empty seller.comDate }">${seller.comDate }</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					</c:if>
					<c:if test="${waitSeller.size()==0 }">
						<thead>
							<tr>
								<td colspan="5">승인 대기 지점이 없습니다</td>
							</tr>
						</thead>
					</c:if>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<!-- 검색 영역 -->
<!-- 	<div class="form-inline col-md-4">
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
	</div> -->
	<!-- 페이징 영역 -->
	<!-- <div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
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
	<div class="col-md-4"></div> -->
	<script>
		$(function(){
			$("#waitSeller").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href='sellerDetail.ad?num='+num;
			});
		});
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
