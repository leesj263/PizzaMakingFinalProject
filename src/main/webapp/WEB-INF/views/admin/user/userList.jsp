<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp" />
<style>
div.card-header {
	border: 0px;
}
h3.menu-title{
	
}

#userList{
	text-align: center;
	align: center;
	
}
</style>
<script>
	function searchUser() {
		var searchUser = $("select[name='searchUser']").val();
		var searchUserValue = $("input[name='searchUserValue']").val();
		console.log(searchUser + " / " + searchUserValue);
	}
	$(function() {
		$("#userList").find("td").mouseenter(function() {
			$(this).parent().css({"color" : "#9d9d9d","cursor" : "pointer"});
		}).mouseout(function() {
			$(this).parent().css({"color" : "#212529"});
		}).click(function() {
			var num=$(this).parent().children().eq(0).children().val();
			console.log(num);
			location.href = "userDetail.ad?num=" + num;
		});
	});
</script>
<section class="container">
	<div class="right-panel">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h3 class="menu-title">회원목록</h3>
				</div>
				<div class="card-body">
				<div class="row">
					<div class="col-md-2"></div>
					<table id="userList" class="table table-striped col-md-8">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">회원번호</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">주문횟수</th>
								<th scope="col">최근 주문일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${memberList}" var="m">
								<tr>
									<td><input type="hidden" name="memberNo" value="${m.memberNo }"></td>
									<td scope="row">${m.rn }</td>
									<td>${m.memberId }</td>
									<td>${m.memberName }</td>
									<td>${m.orderCount }</td>
									<c:if test="${m.orderCount >0}">
										<td>${m.orderDate }</td>
									</c:if>
									<c:if test="${m.orderCount ==0}">
										<td>주문내역이 없습니다</td>
									</c:if>
								</tr>

							</c:forEach>
							<!-- <tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>1</td>
							<td>2018-12-12</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>3</td>
							<td>2018-12-06</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>15</td>
							<td>2019-01-20</td>
						</tr> -->
						</tbody>
					</table>
					 <div class="col-md-2"></div>
					
				</div>
				</div>
			</div>
		</div>
		</div>
	<div class="col-md-5"></div>
<!-- 	<div class="form-inline col-md-5">
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
	<div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
		<ul class="pagination">
			<c:if test="${pi.currentPage >1}">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${pi.currentPage-1}"/>
				</c:url>
				<li class="paginate_button page-item previous" id="bootstrap-data-table_previous">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
				</li>
			</c:if>
			<c:if test="${pi.currentPage==1 }">
				<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
				</li>
			</c:if>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<li class="paginate_button page-item active disabled">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
				</li>
			</c:if>
				
			<c:if test = "${ p ne pi.currentPage }">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${ p }"/>
				</c:url>
				<li class="paginate_button page-item">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
				</li>
			</c:if>
		</c:forEach>
			<c:if test="${pi.currentPage <pi.maxPage}">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${pi.currentPage+1}"/>
				</c:url>
				<li class="paginate_button page-item next" id="bootstrap-data-table_next">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
				</li>
			</c:if>
			<c:if test="${pi.currentPage>=pi.maxPage }">
				<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="col-md-4"></div>
</section>
<jsp:include page="../common/footer.jsp" />
