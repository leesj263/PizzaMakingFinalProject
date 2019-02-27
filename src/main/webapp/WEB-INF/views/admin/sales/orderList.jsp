<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#orderList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
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
							<th scope="col"></th>
							<th scope="col">주문번호</th>
							<th scope="col">주문일자</th>
							<th scope="col">주문금액</th>
							<th scope="col">주문아이디</th>
							<th scope="col">주문지점</th>
							<th scope="col">진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList }" var="order">
							<tr>	
								<td><input type="hidden" name="orderNo" value="${order.orderNo }"></td>
								<td>${fn:replace(order.orderDate, "-", "")}-00${order.comNo}-00${order.orderNo }</td>
								<td>${order.orderSDate }</td>
								<td>${order.orderPayPrice }</td>
								<td>${order.memberId }</td>
								<td>${order.comName }</td>
								<td>
									<c:choose>
										<c:when test="${order.orderStatus==1 }">주문완료</c:when>
										<c:when test="${order.orderStatus==2 }">제조중</c:when>
										<c:when test="${order.orderStatus==3 }">배달중</c:when>
										<c:when test="${order.orderStatus==4 }">배달완료</c:when>
										<c:otherwise>주문거절</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>
	<!-- <div class="col-md-2"></div>
	검색 영역
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
	</div> -->
	<!-- 페이징 영역 -->
	<div class="col-md-5"></div>
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
	<script>
		$(function(){
			$("#orderList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().children().eq(0).val();
				console.log(num);
				location.href="orderDetail.ad?orderNo="+num;
			});
		});
		function searchOrder(){
			
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
