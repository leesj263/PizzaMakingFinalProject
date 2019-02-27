<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#orderDetail{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">주문 상세보기</h3>
			</div>
			<div class="card-body">
				<!-- 주문 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 번호</span><p>${fn:replace(order.orderDate, "-", "")}-00${order.comNo}-00${order.orderNo }</p></li>
							<li class="member-li"><span>주문 상태</span>
								<p>
									<c:choose>
										<c:when test="${order.orderStatus==1 }">주문완료</c:when>
										<c:when test="${order.orderStatus==2 }">제조중</c:when>
										<c:when test="${order.orderStatus==3 }">배달중</c:when>
										<c:when test="${order.orderStatus==4 }">배달완료</c:when>
										<c:otherwise>주문거절</c:otherwise>
									</c:choose>
								</p>
							</li>
							<li class="member-li"><span>결제번호</span>
								<p>카카오페이  ${order.orderPayno}<!--  &nbsp; &nbsp;<button class="btn btn-sm btn-outline-warning">결제정보</button> --></p>	
							</li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 일자</span><p>${order.orderSDate }</p></li>
							<li class="member-li"><span>주문 지점</span><p>${order.comName }</p></li>
							<li class="member-li"><span>주문자</span><p>${order.memberName }</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span></span></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table table-striped" id="orderDetail">
							<thead>
								<tr>
									<th scope="col" style="width:70px">번호</th>
									<th scope="col">주문 항목</th>
									<th scope="col" style="width:70px">수량</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${menuList }" var="menu">
									<tr>
										<td>${menu.rn}</td>
										<td>${menu.menu }</td>
										<td>${menu.tCount}</td>
										<td>${menu.price }</td>
									</tr>
								</c:forEach>
								<tr>
									<th colspan="2">총 액</th>
									<th colspan="2">${total}</th>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div>
					<div class="col-md-2"></div>
					<div class="col-md-4"><button class="btn btn-outline-warning" onclick="location.href='orderList.ad'">목록으로</button></div>
					<div class="col-md-6"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>