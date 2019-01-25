<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	div.card{
		border:0px;
	}
	div.card-header{
		background:#ffffff;
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
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>이름</span><p>홍ㄹ동</p></li>
							<li class="member-li"><span>이메일</span><p>asdflaksdf@asdfa.com</p></li>
							<li class="member-li"><span>주문 횟수</span><p>3</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>아이디</span><p>asdfasdfa</p></li>
							<li class="member-li"><span>가입일</span><p>2018-11-01</p></li>
							<li class="member-li"><span>최근 주문</span><p>2018-12-12</p></li>
						</ul>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="userOrderList">
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">주문일자</th>
							<th scope="col">주문지점</th>
							<th scope="col">주문내용</th>
							<th scope="col">결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
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
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
				<script>
					$(function() {
						$("#userOrderList").find("td").mouseenter(function() {
							$(this).parent().css({
								"color" : "#9d9d9d",
								"cursor" : "pointer"
							});
						}).mouseout(function() {
							$(this).parent().css({
								"color" : "#212529"
							});
						}).click(function() {
							var num = $(this).parent().children().eq(0).text();
							console.log(num);
						});
					})
				</script>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>