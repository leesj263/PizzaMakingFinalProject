<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#bootstrap-data-table-export{
		text-align:center;
		width:700px;
	}
</style>
<section class="container">
	<div class="right-panel">
		<p>userDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">회원 정보</h3>
			</div>
			<div class="card-body">
				<!-- 회원 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>이름</span><p>${member.memberName }</p></li>
							<li class="member-li"><span>이메일</span><p>${member.memberEmail }</p></li>
							<li class="member-li"><span>주문 횟수</span><p>${member.orderCount }</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>아이디</span><p>${member.memberId }</p></li>
							<li class="member-li"><span>가입일</span><p>${member.memberEnroll }</p></li>
							<li class="member-li"><span>최근 주문</span>
								<p>
									<c:if test="${member.orderCount>0}">${member.orderDate }</c:if>
									<c:if test="${member.orderCount==0 }">　</c:if>
								</p></li>
						</ul>
					</div>
					<div class="col-md-2"></div>
				</div>
				
				<!-- 회원 주문 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<table class="table table-striped col-md-8" id="bootstrap-data-table-export">
						<c:if test="${orderList.size() > 0 }">
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">주문일자</th>
								<th scope="col">주문지점</th>
								<th scope="col">결제금액</th>
								<th scope="col">주문상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList}" var="o">
								<tr>
									<th scope="row">${o.orderNo }</th>
									<td>${o.orderDate }</td>
									<td>${o.comName}</td>
									<td>${o.orderPayPrice}</td>
									<c:choose>
										<c:when test="${o.orderStatus==1}">
											<td>대기중</td>
										</c:when>
										<c:when test="${o.orderStatus==2}">
											<td>제조중</td>
										</c:when>
										<c:when test="${o.orderStatus==3}">
											<td>배달중</td>
										</c:when>
										<c:when test="${o.orderStatus==4}">
											<td>배달완료</td>
										</c:when>
										<c:otherwise>
											<td>주문거절</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
							<!-- <tr>
								<th scope="row">1</th>
								<td>2018-12-12</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>10000</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>2018-12-06</td>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>3</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>2019-01-20</td>
								<td>Larry</td>
								<td>the Bird</td>
								<td>15</td>
							</tr> -->
						</tbody>
						</c:if>
						<c:if test="${orderList.size()==0 }">
						<thead>
							<tr>
								<td colspan="5">주문 내역이 없습니다</td>
							</tr>
						</thead>
						</c:if>
					</table>
					<div class="col-md-2"></div>
				</div>
				<!-- 페이징 처리 div -->
				<!-- <div class="row">
					<div class="col-md-7"></div>
					<div class="dataTables_paginate paging_simple_numbers col-md-3" id="bootstrap-data-table_paginate">
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
				</div> -->
				<!-- 페이징 처리 끝 -->
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<button class="btn btn-outline-secondary" onclick="location.href='userList.ad'">목록으로</button>
				</div>	
				<div class="col-md-6"></div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$("#bootstrap-data-table-export").find("td").mouseenter(function() {
				$(this).parent().css({"color" : "#9d9d9d","cursor" : "pointer"});
			}).mouseout(function() {
				$(this).parent().css({"color" : "#212529"});
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=sales/orderDetail";
			});
			$("#bootstrap-data-table-export_length").empty();
			$("#bootstrap-data-table-export_filter").empty();
			$("#bootstrap-data-table-export_info").empty();
			$("#bootstrap-data-table-export_paginate").css({"float":"right"});
		});
		
	</script>
	
	<script src="${contextPath }/resources/admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
	<script src="${contextPath }/resources/admin/assets/js/init-scripts/data-table/datatables-init.js"></script>
	<script src="${contextPath }/resources/admin/vendors/jszip/dist/jszip.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="${contextPath }/resources/admin/vendors/pdfmake/build/vfs_fonts.js"></script>
	</section>
<jsp:include page="../common/footer.jsp"/>