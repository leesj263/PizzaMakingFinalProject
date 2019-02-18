<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<jsp:include page="../common/header.jsp"/>
<style>
	#sellerOrder{
		text-align:center;
		width:800px;
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
					<!-- <button class="btn btn-sm btn-link" disabled>선택한 주문을</button>
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
					<button class="btn btn-sm btn-outline-warning">로 상태변경</button> -->
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="sellerOrder">
					<thead>
						<tr>
							<!-- <th><input type="checkbox"></th> -->
							<th scope="col"></th>
							<th scope="col">주문일자</th>
							<th id="com" scope="col">지점</th>
							<th scope="col">주문내역</th>
							<th scope="col">진행상태</th>
							<th scope="col">정산여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList }" var="order">
							<tr>
								<td><input type="hidden" name="comNo" value="${order.comNo}"></td>
								<td>${order.orderMDate.toString().substring(0,10) }</td>
								<td>${order.comName }</td>
								<td>${order.orderList }</td>
								<c:choose>
									<c:when test="${order.orderMStatus ==1}">
										<td><input type="hidden" name="orderMStatus" value="${order.orderMStatus}">주문 완료</td>
										<th><button class="btn btn-sm btn-outline-warning" type="button" onclick="orderMStatus();">배송완료</button></th>
									</c:when>
									<c:when test="${order.orderMStatus ==2}">
										<td><input type="hidden" name="orderMStatus" value="${order.orderMStatus}">배송 완료</td>
										<th><button class="btn btn-sm btn-outline-warning" disabled type="button"onclick="orderMStatus();">수령 대기중</button></th>
									</c:when>
									<c:otherwise>
										<td>수령 완료</td>
										<th></th>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
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
			$("#sellerOrder").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var orderMDate=$(this).parent().children().eq(1).text();
				var comNo=$(this).parent().children().eq(0).children().val();
				location.href="sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate;
				console.log("sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate);
			});
		});
		function orderMStatus(){
			var orderMDate=$("#sellerOrder").find("td").parent().children().eq(1).text();
			var comNo=$("#sellerOrder").find("td").parent().children().eq(0).children().val();
			var orderMStatus=$("#sellerOrder").find("td").parent().children().eq(4).children().eq(0).val();
			location.href="sellerOrderApply.ad?comNo="+comNo+"&orderMDate="+orderMDate+"&orderMStatus="+orderMStatus;
		}
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
