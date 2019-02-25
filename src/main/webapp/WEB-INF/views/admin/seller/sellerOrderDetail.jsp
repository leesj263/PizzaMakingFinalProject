<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<jsp:include page="../common/header.jsp"/>
<style>
	#orderList{
		text-align:center;
		width:700px;
	}
</style>
<section>
	<div class="right-panel">
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">재료 주문 정보</h3>
			</div>
			<div class="card-body">
				<!-- 업체 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>지점명</span><p>${seller.comName }</p></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>개점일</span><p>${seller.comDate}</p></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<!-- 주문 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 번호</span><p>${orderOne.orderMDate }000${orderOne.comNo}${orderOne.orderMno }</p></li>
							<li class="member-li"><span>주문 상태</span>
								<p>
									<c:choose>
										<c:when test="${orderOne.orderMStatus==1 }">주문완료&nbsp; &nbsp;<button class="btn btn-sm btn-outline-warning" onclick="deliYes(${orderOne.comNo }, '${orderOne.orderMDate }', ${orderOne.orderMStatus })">배송 완료</button></c:when>
										<c:when test="${orderOne.orderMStatus==2 }">배송완료</c:when>
										<c:otherwise>수령완료</c:otherwise>
									</c:choose>
								</p>
							</li>
							
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 일자</span><p>${orderOne.orderMDate }</p></li>
							<li class="member-li"><span>정산 상태</span>
								<p>
									<c:choose>
										<c:when test="${orderOne.orderCal=='Y' }">정산완료</c:when>
										<c:otherwise>미정산</c:otherwise>
									</c:choose>
								</p>	
							</li>
							
							<li class="member-li"><span></span></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table table-striped" id="orderList">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">주문 항목</th>
									<th scope="col">중량</th>
									<th scope="col">수량(개/팩)</th>
									<th scope="col">단가</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order}" var="om">
									<tr>
										<td>${om.rn}</td>
										<td>${om.materialName }</td>
										<td>${om.weight }</td>
										<td>${om.materialWeight}</td>
										<td>${om.unit }</td>
										<td>${om.price }</td>
									</tr>
								</c:forEach>
								<tr>
									<th colspan="3">총 액</th>
									<th colspan="3">${total }</th>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>	
				<div class="col-md-5">
					<button class="btn btn-outline-secondary" onclick="location.href='sellerOrder.ad'">목록으로</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function deliYes(num1, date1, num2){
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
						location.href='sellerOrderDetail.ad?comNo='+num1+'&orderMDate='+date1;
					}else{
						console.log(data);
						alert("배송완료 처리가 실패했습니다. 다시 시도해주세요.");
					}
				},
				error:function(data){
					alert("배송완료 처리가 실패했습니다. 다시 시도해주세요.");
				}
			});
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
