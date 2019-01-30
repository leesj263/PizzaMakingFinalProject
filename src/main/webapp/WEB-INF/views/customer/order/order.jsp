<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.content-box {
	width: 1200px;
	margin-top: 80px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
}

div.radio label:hover {
	cursor: pointer;
}

.delivery-table {
	display: none;
	outline: 3px solid lightgrey;
	padding: 10px;
}

.delivery-table tbody tr td:last-child {
	text-align: right;
}

.order-method{
	min-height: 400px;
	border: 1px solid white;
}
.order-product{
	min-height: 400px;
	border: 1px solid white;
}
.discount-time{
	min-height: 400px;
	border: 1px solid white;
}
.receiver-pay{
	min-height: 400px;
	border: 1px solid white;
}
.last-order{
	min-height: 400px;
	border: 1px solid white;
}
.text-label{
	font-weight: bold;
	font-size: 18px;
}
.red-text{
	color: orangered;
}
.receiver-table tr{
	height: 60px;
}
.payBtn{
	width: 160px;
	height: 40px;
	font-size: 20px !important;
	padding: 0 !important;
}
.orderBtn{
	width: 160px;
	height: 40px;
	font-size: 20px !important;
	padding: 0 !important;
	margin: 0 !important;
	border-radius: 0 !important;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<div class="content-box">

		<h1 align="center">주문서 작성</h1>

		<!-- 주문방법 -->
		<div class="order-method">
			<h2>주문방법 선택</h2>
			<div class="ui divider"></div>
			<div class="ui radio checkbox" style="margin-right: 50px;">
				<input type="radio" name="orderMethod" id="deliveryOrder" value="1"
					onchange="orderMethodSel(1);"> <label for="deliveryOrder"
					style="font-size: 16px;">배달주문</label>
			</div>
			<div class="ui radio checkbox" style="margin-bottom: 20px;">
				<input type="radio" name="orderMethod" id="visitOrder" value="2"
					onchange="orderMethodSel(2);"> <label for="visitOrder"
					style="font-size: 16px;">방문포장</label>
			</div>

		
			<div class="ui grid bottom aligned">
				<div class="left floated eight wide column" id="oaTopLeft"></div>
				<div class="right floated eight wide column right aligned"
					id="oaTopRight"></div>
			</div>
			
			<table class="ui very basic table delivery-table">
				<tbody>
					<tr>
						<td>서울특별시 강남구 역삼동 kh정보교육원 C클래스<br> <b>역삼지점(02-123-1234)</b></td>
						<td>
							<button class="ui black active button">선택</button>
							<button class="ui grey button">삭제</button>
						</td>
					</tr>
					<tr>
						<td>서울특별시 강남구 역삼동 kh정보교육원 C클래스<br> <b>역삼지점(02-123-1234)</b></td>
						<td>
							<button class="ui grey button">선택</button>
							<button class="ui grey button">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 주문제품 -->
		<div class="order-product">
			<div class="ui grid bottom aligned">
				<div class="left floated eight wide column">
					<h2>주문제품</h2>
				</div>
				<div class="right floated eight wide column right aligned">
					<button class="ui brown button" onclick="location.href='pizzaMaking.cor'">메뉴 변경하기</button>
				</div>
			</div>
			<table class="ui celled table">
				<thead>
					<tr>
						<th>주문제품</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>토핑 설정 이름(default: 내맘대로 피자1), 사이즈: L, 도우: 나폴리, 엣지: 치즈 크러스트,
							소스: 토마토 소스<br> - 올리브(60g) 5개, 페퍼로니(8piece) 5개, 치즈(150g) 5개
						</td>
						<td>1</td>
						<td>20,000</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 할인-도착예정시간 -->
		<div class="discount-time">
			<div class="ui grid">
				<div class="left floated seven wide column">
					<div class="ui grid bottom aligned">
						<div class="left floated eight wide column">
							<h2>할인</h2>
						</div>
						<div class="right floated eight wide column right aligned">
							<button class="ui brown button" onclick="couponSelect();">할인 선택</button>
						</div>
					</div>
					<div class="ui divider"></div>
					
					<div style="margin-bottom: 30px;">
						* 할인내역
					</div>
					
					<div class="ui grid">
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label red-text">할인 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label red-text">0 원</span>
							</div>
						</div>
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label">결제 예정 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label">20,000 원</span>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="right floated seven wide column">
					<h2>도착예정시간</h2>
					<div class="ui divider"></div>
					
					<div class="two blue ui attached buttons" style="margin-bottom: 50px;">
						<button class="ui button active reservationBtn" onclick="noReservation(this);">바로주문</button>
						<button class="ui button reservationBtn" onclick="reservation(this);">당일예약</button>
					</div>
					<input type="hidden" name="reservationCondition" value="1" id="reservationCondition">
					<div class="ui container center aligned" id="reservationDiv">
						<label class='text-label'>00:00분 배달 예정입니다</label>
					</div>
					
				</div>
			</div>
		</div>
		
		<!-- 수령인-결제정보 -->
		<div class="receiver-pay">
			<div class="ui grid">
				<div class="left floated seven wide column">
					<h2>수령인 정보</h2>
					<div class="ui divider"></div>
					
					<table class="receiver-table" style="width: 100%;">
						<tr>
							<td style="width: 160px;"><span class="text-label">이름</span></td>
							<td>
								<div class="ui input fluid">
									<input type="text" placeholder="이름">
								</div>
							</td>
						</tr>
						<tr>
							<td><span class="text-label">전화번호</span></td>
							<td>
								<div class="ui input fluid">
									<input type="text" placeholder="전화번호">
								</div>
							</td>
						</tr>
						<tr>
							<td><span class="text-label">기타 요청사항</span></td>
							<td>
								<div class="ui input fluid">
									<input type="text" placeholder="기타 요청사항">
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="right floated seven wide column">
					<h2>결제방법</h2>
					<div class="ui divider"></div>
					
					<button class="ui button yellow attached active payBtn">카카오페이</button>
				</div>
			</div>
		</div>
		
		<!-- 최종결제 -->
		<div class="last-order">
			<div class="ui grid">
				<div class="left floated seven wide column"></div>
				<div class="right floated seven wide column">
					<h2>결제</h2>
					<div class="ui divider"></div>
						
					<div class="ui grid">
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label">총 주문 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label">20,000 원</span>
							</div>
						</div>
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label red-text">할인 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label red-text">0 원</span>
							</div>
						</div>
						<div class="row" style="margin-top: 30px;">
							<div class="left floated eight wide column">
								<span class="text-label">결제 예정 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label">20,000 원</span>
							</div>
						</div>
						<div class="row" style="margin-top: 30px;">
							<div class="left floated eight wide column"></div>
							<div class="right floated eight wide column right aligned">
								<button class="ui button red orderBtn">주문</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>


	<!-- 토핑 추가 모달 -->
	<div class="ui longer modal" id="couponModal">
		<div class="header">할인 선택</div>
		<div class="content">
			<table class="ui single line table">
				<thead>
					<tr>
						<th>쿠폰명</th>
						<th>쿠폰설명</th>
						<th>할인</th>
						<th>유효기간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="actions">
			<div class="ui positive approve button">선택</div>
			<div class="ui negative cancel button">취소</div>
		</div>
	</div>

	
	<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
	<script>
		
		function orderMethodSel(val) {
			$("#oaTopLeft").empty();
			$("#oaTopRight").empty();
			if (val == 1) {
				$("#oaTopLeft").append($("<h3>").text("배달주소"));
				$("#oaTopRight").append(
						$("<button class='ui button brown'>").text("배달주소 등록"));
			} else {
				$("#oaTopLeft").append($("<h3>").text("매장"));
				$("#oaTopRight").append(
						$("<button class='ui button brown'>").text("매장 등록"));
			}
			$(".delivery-table").show();
		}
		
		function couponSelect(){
			$("#couponModal").modal("show");
		}
		
		function noReservation(btn){
			$(".reservationBtn").removeClass("active");
			$(btn).addClass("active");
			
			$("#reservationCondition").val(1);
			
			$("#reservationDiv").empty();
			var $label = $("<label class='text-label'>").text("00:00분 배달 예정입니다");
			$("#reservationDiv").append($label);
		}
		function reservation(btn){
			$(".reservationBtn").removeClass("active");
			$(btn).addClass("active");
			
			$("#reservationCondition").val(2);
			
			$("#reservationDiv").empty();
			
			var $div = $("<div class='ui selection dropdown'>")
							.append("<input type='hidden' name='timeHour'>")
							.append("<i class='dropdown icon'>")
							.append($("<div class='default text'>").text("시간"));
			var $menu = $("<div class='menu'>")
								.append($("<div class='item' data-value='0'>").text("00시"))
								.append($("<div class='item' data-value='1'>").text("01시"));
			$div.append($menu);
			$("#reservationDiv").append($div);
			
			var $div2 = $("<div class='ui selection dropdown' style='margin-left: 20px;'>")
							.append("<input type='hidden' name='timeHour'>")
							.append("<i class='dropdown icon'>")
							.append($("<div class='default text'>").text("분"));
			var $menu2 = $("<div class='menu'>")
								.append($("<div class='item' data-value='0'>").text("00분"))
								.append($("<div class='item' data-value='5'>").text("05분"));
			$div2.append($menu2);
			$("#reservationDiv").append($div2);
			
			$('.ui.dropdown').dropdown();
		}
	</script>

</body>
</html>