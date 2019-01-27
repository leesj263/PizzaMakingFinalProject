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
	
		<p>sellerOrderDetail.jsp</p>
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
							<li class="member-li"><span>지점명</span><p>강남점</p></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>개점일</span><p>2018-11-01</p></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<!-- 주문 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 번호</span><p>2019012500010051</p></li>
							<li class="member-li"><span>주문 상태</span><p>수령완료</p></li>
							<li class="member-li"><span>정산 상태</span>
								<p>미정산&nbsp; &nbsp;<button class="btn btn-sm btn-outline-warning">정산 완료</button></p>	
							</li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>주문 일자</span><p>2019-01-25</p></li>
							<li class="member-li"><span>수령 일자</span><p>2019-01-26</p></li>
							<li class="member-li"><span>정산 일자</span><p>미정산</p></li>
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
									<td>도우 </td>
									<td>50 (개/팩)</td>
									<td>1,000</td>
									<td>50,000</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>포장 박스</td>
									<td>300(개/팩)</td>
									<td>200</td>
									<td>60,000</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>치즈 300g </td>
									<td>50 (개/팩)</td>
									<td>2,000</td>
									<td>100,000</td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>새우 100g</td>
									<td>50(개/팩)</td>
									<td>1,800</td>
									<td>90,000</td>
								</tr>
								<tr>
									<th colspan="2">총 액</th>
									<td colspan="3"> 300,000</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>	
				<div class="col-md-5">
					<button class="btn btn-outline-secondary" onclick="location.href='admin.ad?admin=seller/sellerOrder'">목록으로</button>
				</div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
