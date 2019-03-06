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
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">재료 주문 목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 업체 목록 영역 -->
			<div class="row">
				<div class="col-md-7"></div>
				<div class="col-md-3">
					<button class="btn btn-sm btn-link" disabled>선택한 주문을</button>
					<button class="btn btn-sm btn-outline-warning" onclick="selectDeliYes()">발송 완료</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="sellerOrder">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="checkAll();" name="checkAllRow"></th>
							<th scope="col"></th>
							<th scope="col">주문일자</th>
							<th id="com" scope="col">지점</th>
							<th scope="col">주문내역</th>
							<th scope="col">진행상태</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList }" var="order">
							<tr>
								<th>
									<c:if test="${order.orderMStatus==3 }"></c:if>
									<c:if test="${order.orderMStatus==2 }"></c:if>
									<c:if test="${order.orderMStatus==1 }">
										<input type="checkbox" name="checkOrder">
									</c:if>
								</th>
								<td><input type="hidden" name="comNo" value="${order.comNo}"></td>
								<td>${order.orderMDate.toString().substring(0,10) }</td>
								<td>${order.comName }</td>
								<td>${order.orderList }</td>
								<c:choose>
									<c:when test="${order.orderMStatus ==1}">
										<td><input type="hidden" name="orderMStatus" value="${order.orderMStatus}">주문 완료</td>
										<th><button class="btn btn-sm btn-outline-warning" type="button" onclick="orderMStatus(${order.comNo}, '${order.orderMDate}', ${order.orderMStatus});">배송완료</button></th>
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
				var orderMDate=$(this).parent().children().eq(2).text();
				var comNo=$(this).parent().children().eq(1).children().val();
				location.href="sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate;
				console.log("sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate);
			});
		});
		function checkAll(){
			if($("input[name='checkAllRow']").is(':checked')){
				$("input[name=checkOrder]").prop("checked", true);
			}else{
				$("input[name=checkOrder]").prop("checked", false);
			}
		}
		function orderMStatus(num1, date1, num2){
			console.log("sellerOrderApply.ad?comNo="+num1+"&orderMDate="+date1+"&orderMStatus="+num2);

			$.ajax({
				url:"sellerOrderApply.ad",
				type:"get",
				async: false,
				data:{comNo:num1,orderMDate:date1,orderMStatus:num2},
				success:function(data){
					console.log(data);
					if(data==1){
						console.log(data);
						alert("배송완료 처리가 완료되었습니다.");
						location.href='sellerOrder.ad';
					}else{
						console.log(data);
						alert("배송완료 처리가 실패했습니다. 다시 시도해주세요.");
					}
				},
				error:function(data){
					alert("통신 실패했습니다. 다시 시도해주세요.");
				}
			});
			//location.href="sellerOrderApply.ad?comNo="+comNo+"&orderMDate="+orderMDate+"&orderMStatus="+orderMStatus;
		}
		
		function selectDeliYes(){
			var checkOrderMDate= "";
			var checkOrderMStatus= "";
			var checkComNo="";
			$( "input[name='checkOrder']:checked").each(function (){
				checkOrderMDate=checkOrderMDate+$(this).parent().parent().children().eq(2).text()+",";
				checkComNo=checkComNo+$(this).parent().parent().children().children().eq(1).val()+",";
				checkOrderMStatus=checkOrderMStatus+$(this).parent().parent().children().eq(5).children().eq(0).val()+",";
			});
			checkOrderMDate = checkOrderMDate.substring(0,checkOrderMDate.lastIndexOf(","));
			checkComNo = checkComNo.substring(0,checkComNo.lastIndexOf(","));
			checkOrderMStatus = checkOrderMStatus.substring(0,checkOrderMStatus.lastIndexOf(","));
			console.log(checkOrderMDate);
			console.log(checkComNo);
			console.log(checkOrderMStatus);
			$.ajax({
				url:"selectSellerOrderApply.ad",
				type:"get",
				async: false,
				data:{orderMDate:checkOrderMDate,comNo:checkComNo,orderMStatus:checkOrderMStatus},
				success:function(data){
					if(data==1){
						alert("배송완료 처리가 완료되었습니다.");
						location.href='sellerOrder.ad';
					}else{
						alert("배송완료 처리가 실패했습니다. 다시 시도해주세요.");
					}
				},
				error:function(data){
					alert("배송완료 처리가 실패했습니다. 다시 시도해주세요.");
				}
			});
		}
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
