<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	div.card-header{
		border:0px;
	}
	#bootstrap-data-table-export{
		text-align:center;
		align:center;
	}
</style>
<section class="container">
	<div class="right-panel">
	<p>userList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">회원목록</h3>
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-md-2"></div>
				<table id="bootstrap-data-table-export" class="table table-striped" >
					<thead>
						<tr>
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
								<th scope="row">${m.memberNo }</th>
								<td>${m.memberId }</td>
								<td>${m.memberName }</td>
								<td>${m.orderCount }</td>
								<c:if test="${m.orderCount >0}">
									<td>${m.orderDate }</td>
								</c:if>
								<c:if test="${m.orderCount ==0}">
									<td>　</td>
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
<!-- 	<div class="col-md-2"></div>
	검색 영역
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
	페이징 영역
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
	<div class="col-md-1"></div> -->
	<script>
		/* function searchUser() {
			var searchUser = $("select[name='searchUser']").val();
			var searchUserValue = $("input[name='searchUserValue']").val();
			console.log(searchUser + " / " + searchUserValue);
		} */
		$(function(){
			$("#bootstrap-data-table-export").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="userDetail.ad?num="+num;
			});
		})
	</script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/jszip/dist/jszip.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/pdfmake/build/vfs_fonts.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
	<script src="${contextPath }/resources/admin/assets/js/init-scripts/data-table/datatables-init.js"></script>
</section>
<jsp:include page="../common/footer.jsp"/>
