<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#orderDetail{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<p>orderDetail.jsp</p>
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
							<li class="member-li"><span>주문 번호</span><p>2019012600010051</p></li>
							<li class="member-li"><span>주문 상태</span><p>제조중</p></li>
							<li class="member-li"><span>결제</span>
								<p>카카오페이<!--  &nbsp; &nbsp;<button class="btn btn-sm btn-outline-warning">결제정보</button> --></p>	
							</li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 일자</span><p>2019-01-26 15:04</p></li>
							<li class="member-li"><span>주문 지점</span><p>강남점</p></li>
							<li class="member-li"><span>주문자</span><p>asdfqds</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span></span></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-9">
						<table class="table table-striped" id="orderDetail">
							<thead>
								<tr>
									<th scope="col">주문번호</th>
									<th scope="col">주문 항목</th>
									<th scope="col">수량(개/팩)</th>
									<th scope="col">단가</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>기본 도우 L</td>
									<td>1</td>
									<td>12,000</td>
									<td>12,000</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>치즈 L</td>
									<td>3</td>
									<td>3,000</td>
									<td>9,000</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>새우 L</td>
									<td>2</td>
									<td>3,000</td>
									<td>6,000</td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>페퍼로니 S</td>
									<td>1</td>
									<td>1,500</td>
									<td>1,500</td>
								</tr>
								<tr>
									<th colspan="3">총 액</th>
									<td colspan="2">28,500</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div>
					<div class="col-md-2"></div>
					<div class="col-md-4"><button class="btn btn-outline-warning" onclick="location.href='admin.ad?admin=sales/orderList'">목록으로</button></div>
					<div class="col-md-6"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>