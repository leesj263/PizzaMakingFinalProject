<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/pmfp/resources/customer/js/common.js"></script>
<style>
.content-box {
	width: 1200px;
	margin-top: 80px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
}
.cartTable tbody tr td:not(:nth-child(2)){
	text-align: center;
}
.cartTable tbody tr td{
	height: 80px;
}
#couponTable tbody tr td:not(:first-child){
	text-align: center;
}
.discountText{
	font-size: 18px;
}

div.radio label:hover {
	cursor: pointer;
}

.delivery-table {
	display: none;
	outline: 3px solid lightgrey;
	padding: 10px;
	min-height: 79px;
}

.delivery-table tbody tr td:last-child:not(:first-child) {
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
			<input type="hidden" id="orderMethod">

		
			<div class="ui grid bottom aligned">
				<div class="left floated eight wide column" id="oaTopLeft"></div>
				<div class="right floated eight wide column right aligned"
					id="oaTopRight"></div>
			</div>
			
			<table class="ui very basic table delivery-table" id="addressTable">
				<tbody>
					<!-- 주소 -->
					<tr><td></td></tr>
				</tbody>
			</table>
			
			<table class="ui very basic table delivery-table" id="comTable">
				<tbody>
					<!-- 매장 방문 -->
					<tr><td></td></tr>
				</tbody>
			</table>
		</div>
		<input type="hidden" value="" id="deliveryNo">
		<input type="hidden" value="" id="comNo">

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
			<table class="ui fixed table cartTable" id="cartTable">
				<thead>
					<tr>
						<th style="width: 1%; text-align: center;"></th>
						<th style="width: 79%">주문제품</th>
						<th style="width: 9%; text-align: center;">수량</th>
						<th style="width: 16%; text-align: center;">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<tr><td colspan='4'>상품이 없습니다.</td></tr>
					</tr>
				</tbody>
			</table>
		</div>
		<input type="hidden" value="" id="cartTotalPrice">

		<!-- 할인-도착예정시간 -->
		<div class="discount-time">
			<div class="ui grid">
				<div class="left floated seven wide column">
					<div class="ui grid bottom aligned">
						<div class="left floated eight wide column">
							<h2>할인</h2>
						</div>
						<div class="right floated eight wide column right aligned">
							<c:if test="${ !empty sessionScope.loginUser }">
							<button class="ui brown button" onclick="getCouponList();">할인 선택</button>
							</c:if>
							<c:if test="${ empty sessionScope.loginUser }">
							<button class="ui brown button" onclick="alert('회원가입이 필요한 기능입니다.');">할인 선택</button>
							</c:if>
						</div>
					</div>
					<div class="ui divider"></div>
					
					<div style="margin-bottom: 50px;" id="discountDetail">
						* 할인내역<br><br><span class='discountText'>&nbsp;</span>
					</div>
					
					<div class="ui grid">
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label red-text">할인 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label red-text discountPrice">0 원</span>
							</div>
						</div>
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label">결제 예정 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label finalPrice">0 원</span>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="right floated seven wide column">
					<h2>도착예정시간</h2>
					<div class="ui divider"></div>
					
					<div class="two inverted orange ui attached buttons" style="margin-bottom: 50px;">
						<button class="ui button active reservationBtn" onclick="noReservation(this);">바로주문</button>
						<button class="ui button reservationBtn" onclick="reservation(this);">당일예약</button>
					</div>
					<input type="hidden" name="reservationCondition" value="1" id="reservationCondition">
					<div class="ui container center aligned" id="reservationDiv">
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
									<input type="text" maxlength="20" placeholder="이름" id="orderMemberName">
								</div>
							</td>
						</tr>
						<tr>
							<td><span class="text-label">전화번호</span></td>
							<td>
								<div class="ui input fluid">
									<input type="text" maxlength="13" placeholder="010-1234-5678" id="orderMemberPhone">
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
								<span class="text-label totalPrice">0 원</span>
							</div>
						</div>
						<div class="row">
							<div class="left floated eight wide column">
								<span class="text-label red-text">할인 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label red-text discountPrice">0 원</span>
							</div>
						</div>
						<div class="row" style="margin-top: 30px;">
							<div class="left floated eight wide column">
								<span class="text-label">결제 예정 금액</span>
							</div>
							<div class="right floated eight wide column right aligned">
								<span class="text-label finalPrice">0 원</span>
							</div>
						</div>
						<div class="row" style="margin-top: 30px;">
							<div class="left floated eight wide column"></div>
							<div class="right floated eight wide column right aligned">
								<button class="ui button red orderBtn" onclick="order();">주문</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<input type="hidden" value="" id="finalPrice">
		
	</div>

	<!-- 쿠폰 모달 -->
	<div class="ui longer modal" id="couponModal">
		<div class="header">할인 선택</div>
		<div class="content">
			<table class="ui fixed table" id="couponTable">
				<thead>
					<tr>
						<th style="width: 50%;">쿠폰명</th>
						<th style="width: 20%; text-align: center;">할인</th>
						<th style="width: 30%; text-align: center;">유효기간</th>
					</tr>
				</thead>
				<tbody>
					<!-- 목록 -->
				</tbody>
			</table>
		</div>
		<div class="actions">
			<div class="ui positive approve button" onclick="addCoupon();" id="addCouponBtn">선택</div>
			<div class="ui negative cancel button">취소</div>
		</div>
	</div>
	<input type="hidden" value="" id="issueNo">
	<input type="hidden" value="" id="couponDiscount">
	
	<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
	<script src="/pmfp/resources/customer/js/jquery.cookie-1.4.1.min.js"></script>
	
	<!-- 로그인 유저 -->
	<c:if test="${!empty sessionScope.loginUser}">
	<script>
		//최근 수령자 정보
		$(function(){
			$("#orderMemberName").val("${requestScope.receiver.orderReceiver}");;
			$("#orderMemberPhone").val("${requestScope.receiver.orderRtel}");
		});
	
		//주문방법 선택
		function orderMethodSel(val) {
			$("#oaTopLeft").empty();
			$("#oaTopRight").empty();
			if (val == 1) {
				$("#orderMethod").val(1);
				$("#oaTopLeft").append($("<h3>").text("배달주소"));
				$("#oaTopRight").append(
						$("<button class='ui button brown' onclick='deliPop(1);'>").text("배달주소 등록"));
				
				$.ajax({
					url: "getDeliveryInfo.cor",
					type: "POST",
					success: function(data){
						//console.log(data);
						
						var $table = $("#addressTable tbody");
						$table.empty();
						
						for(var i=0; i<data.length; i++){
							var $tr = $("<tr>");
							var $td1 = $("<td>").html(data[i].deliveryAddress + "<br><b>" + data[i].comName + " (" + data[i].comTel + ")" + "</b>");
							var $td2 = $("<td>").append($("<button class='ui grey button addrSel' onclick='addressSelect(this,"+data[i].deliveryNo+","+data[i].comNo+")'>").text("선택"));
							$tr.append($td1).append($td2);
							$table.append($tr);
						}
						
						if(data.length == 0){
							$table.append($("<tr>").append($("<td style='text-align: center;'>").text("배송지 정보가 없습니다.")));
						}
						
						$("#deliveryNo").val("");
						$("#comNo").val("");
						$("#comTable").hide();
						$("#addressTable").show();
						
					}, error: function(data){
						console.log("배송지 정보 가져오기 실패!");
					}
				});
			} else {
				$("#orderMethod").val(2);
				$("#oaTopLeft").append($("<h3>").text("매장"));
				$("#oaTopRight").append($("<button class='ui button brown' onclick='comPop();'>").text("매장 선택"));
				$("#comTable").empty();
				$("#comTable").append($("<tr>").append($("<td>")));
				$("#deliveryNo").val("");
				$("#comNo").val("");
				$("#addressTable").hide();
				$("#comTable").show();
			}
			
		}
	
		
		
	</script>
	</c:if>
	
	<!-- 비로그인 유저 -->
	<c:if test="${!empty sessionScope.noUserLogin}">
	<script>
		//비로그인 유저 정보
		$(function(){
			$("#orderMemberName").val("${sessionScope.noUserLogin.memberName}");
			$("#orderMemberPhone").val("${sessionScope.noUserLogin.memberPhone}");
		});
	
		//주문방법 선택
		function orderMethodSel(val) {
			$("#oaTopLeft").empty();
			$("#oaTopRight").empty();
			if (val == 1) {
				$("#orderMethod").val(1);
				$("#oaTopLeft").append($("<h3>").text("배달주소"));
				$("#oaTopRight").append(
						$("<button class='ui button brown' onclick='deliPop(2);'>").text("배달주소 등록"));
				
				$("#deliveryNo").val("");
				$("#comNo").val("");
				$("#comTable").hide();
				$("#addressTable").show();
				
			} else {
				$("#orderMethod").val(2);
				$("#oaTopLeft").append($("<h3>").text("매장"));
				$("#oaTopRight").append($("<button class='ui button brown' onclick='comPop();'>").text("매장 선택"));
				$(".addrSel").removeClass("active").removeClass("black").removeClass("grey");
				$(".addrSel").addClass("grey");
				$("#comTable").empty();
				$("#comTable").append($("<tr>").append($("<td>")));
				$("#deliveryNo").val("");
				$("#comNo").val("");
				$("#addressTable").hide();
				$("#comTable").show();
			}
			
		}
		
		function noUserAddress(deliveryAddress, comName, comTel, comNo, deliveryNo){
			var $table = $("#addressTable tbody");
			$table.empty();
			
			var $tr = $("<tr>");
			var $td1 = $("<td>").html(deliveryAddress + "<br><b>" + comName + " (" + comTel + ")" + "</b>");
			var $td2 = $("<td>").append($("<button class='ui grey button addrSel' onclick='addressSelect(this,"+deliveryNo+","+comNo+")'>").text("선택"));
			$tr.append($td1).append($td2);
			$table.append($tr);
			
			
			$("#deliveryNo").val("");
			$("#comNo").val("");
			$("#comTable").hide();
			$("#addressTable").show();
		}
	</script>
	</c:if>
	
	<script>
		//배송지 선택
		function addressSelect(btn, deliveryNo, comNo){
			$(".addrSel").removeClass("active").removeClass("black").removeClass("grey");
			$(".addrSel").addClass("grey");
			$("#deliveryNo").val(deliveryNo);
			$("#comNo").val(comNo);
			$(btn).removeClass("grey").addClass("black active");
		}
		
		//배송지 추가 팝업 설정
		function deliPop(loginCateg){
			var screenW = screen.availWidth; // 스크린 가로사이즈
			var screenH = screen.availHeight; // 스크린 세로사이즈
			
			var popW = 550;  //팝업 가로사이즈
			var popH = 240;  //팝업 세로사이즈
			
			var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션
			var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션
		
			window.open('myPageDelPopup.cor?loginCateg='+loginCateg,'',',width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
		}
		
		//매장 선택 팝업
		function comPop(){
			var screenW = screen.availWidth; // 스크린 가로사이즈
			var screenH = screen.availHeight; // 스크린 세로사이즈
			
			var popW = 800;  //팝업 가로사이즈
			var popH = 600;  //팝업 세로사이즈
			
			var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션
			var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션
		
			window.open('comPop.cor','',',width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
		}
		
		//매장 선택
		function selectCom(comNo, comName, comTel, comLocation){
			$("#comNo").val(comNo);
			var $table = $("#comTable tbody");
			$table.empty();
			
			var $tr = $("<tr>");
			var $td1 = $("<td>").html(comLocation + "<br><b>" + comName + " (" + comTel + ")" + "</b>");
			$tr.append($td1);
			$table.append($tr);
		}
		
		var mateMap;
		var cartNo = 0;
		var cartNoList = [];
		var cartList = {};
		$(function(){
			$.ajax({
				url: "mateList.cor",
				success: function(data){
					mateMap = data;
					cartLoad();
				}, error: function(data){
					console.log("데이터 불러오기 실패");
				}
			});
		});
		
		//장바구니 불러오기
		function cartLoad(){
			if($.cookie("cartNoList")) {
				
				cartNoList = $.parseJSON($.cookie("cartNoList"));
				cartNo = cartNoList[cartNoList.length-1] + 1;
				
				if(cartNoList.length> 0){
					for(var i=0; i<cartNoList.length; i++){
						cartList[cartNoList[i]] = $.parseJSON($.cookie("cartNo"+cartNoList[i]));
					}
				}
				//console.log(cartList);
				
				var $cartTable = $("#cartTable tbody");
				$cartTable.empty();
				
				for(var cart in cartList){
					if(cartList[cart].categ == 1){
						var price = 0;
						var orderProductBasic = "- 도우: " + mateMap[cartList[cart].dough].materialName
								+ ", 사이즈: " + cartList[cart].size
								+ ", 엣지: " + mateMap[cartList[cart].edge].materialName
								+ ", 소스: " + mateMap[cartList[cart].sauce].materialName;
						
						price += mateMap[cartList[cart].dough].materialSellprice
							+ mateMap[cartList[cart].edge].materialSellprice
							+ mateMap[cartList[cart].sauce].materialSellprice;
						
						var orderProductTopping = "- ";
						for(var i=0; i<cartList[cart].toppings.length; i++){
							orderProductTopping += mateMap[cartList[cart].toppings[i].materialNo].materialName
									+  "(" + mateMap[cartList[cart].toppings[i].materialNo].materialWeight + "g) "
									+ cartList[cart].toppings[i].amount + "개";
							if(i < cartList[cart].toppings.length - 1) orderProductTopping += ", ";
							
							price += mateMap[cartList[cart].toppings[i].materialNo].materialSellprice * cartList[cart].toppings[i].amount;
						}
						price *= cartList[cart].amount;
						
						var $tr = $("<tr>");
						$tr.append($("<td>"));
						$tr.append($("<td>").html(cartList[cart].pizzaName + "<br>" + orderProductBasic + "<br>" + orderProductTopping));
						$tr.append($("<td>").append($("<span class='amount'>").text(cartList[cart].amount)));
						$tr.append($("<td>").text(numComma(price)));
						
						$cartTable.append($tr);
					}
				}
				for(var cart in cartList){
					if(cartList[cart].categ == 2){
						var $tr = $("<tr>");
						$tr.append($("<td>"));
						$tr.append($("<td>").html(cartList[cart].pizzaName));
						$tr.append($("<td>").append($("<span class='amount'>").text(cartList[cart].amount)));
						$tr.append($("<td>").text(numComma(mateMap[cartList[cart].toppings[0].topping].materialSellprice*cartList[cart].amount)));
						
						$cartTable.append($tr);
					}
				}
				cartTotalCalc();
			}
		}
		
		//장바구니 총액 계산
		function cartTotalCalc(){
			if(cartNoList.length > 0){
				var totalPrice = 0;
				var $cartTable = $("#cartTable tbody tr");
				
				for(var i=0; i<$cartTable.length; i++){
					var price = Number($($cartTable[i]).children().eq(3).text().replace(/,/g, ""));
					totalPrice += price;
				}
				
				$("#cartTotalPrice").val(totalPrice);
				$(".totalPrice").text(numComma(totalPrice) + " 원");
				$(".finalPrice").text(numComma(totalPrice) + " 원");
				$("#finalPrice").val(totalPrice);
			} else {
				$("#cartTotalPrice").val(0);
				$("#finalPrice").val(0);
			}
		}
		
		//쿠폰 목록 가져오기
		function getCouponList(){
			var totalPrice = $("#cartTotalPrice").val();
			
			$.ajax({
				url: "getCouponList.cor",
				data: {"totalPrice": totalPrice},
				type: "POST",
				success: function(data){
					//console.log("성공");
					var $couponTable = $("#couponTable tbody");
					$couponTable.empty();
					if(data.length > 0){
						for(var i=0; i<data.length; i++){
							var $tr = $("<tr class='issueNo"+data[i].issueNo+"' onclick='selectCoupon(this, "+data[i].issueNo + ", " + (data[i].couponRdiscount+data[i].couponPdiscount) +")'>")
								.mouseenter(function(){
									$(this).css({"background":"lightgray", "cursor":"pointer"});
								}).mouseout(function(){
									$(this).css({"background":"white"});
								});;
							var $td1 = $("<td>").text(data[i].couponName);
							var $td2;
							if(data[i].couponCateg == 0){
								$td2 = $("<td>").text(data[i].couponRdiscount*100 + " %");
							} else {
								$td2 = $("<td>").text(data[i].couponPdiscount + "원 ");
							}
							
							var date = new Date(data[i].issueEdate);
							var $td3 = $("<td>").text("~ " + date.getFullYear() + "년 " + date.getMonth() + "월 " + date.getDate() + "일 까지");
							
							$tr.append($td1).append($td2).append($td3);
							$couponTable.append($tr);
						}
						$(".issueNo" + $("#issueNo").val()).addClass("active");
						$("#addCouponBtn").attr("onclick", "");
					} else {
						$couponTable.append($("<tr>").append($("<td colspan='3'>").text("사용할 수 있는 쿠폰이 없습니다.")))
					}
				}, error: function(data){
					console.log("쿠폰 목록 가져오기 실패!");
				}
			});
			$("#couponModal").modal("show");
		}
		
		//쿠폰 선택
		function selectCoupon(tr, issueNo, couponDiscount){
			if($(tr).hasClass("active")){
				$(tr).removeClass("active");
				
				$("#addCouponBtn").attr("onclick", "addCoupon('', '');");
			} else {
				$("#couponTable tbody tr").removeClass("active");
				$(tr).addClass("active");
				
				$("#addCouponBtn").attr("onclick", "addCoupon("+issueNo + ", " + couponDiscount+");");
			}
		}
		
		//쿠폰 적용
		function addCoupon(issueNo, couponDiscount){
			$("#issueNo").val(issueNo);
			$("#couponDiscount").val(couponDiscount);
			//console.log($("#couponDiscount").val());
			
			if(issueNo != ""){				
				var detail = $(".issueNo" + issueNo).children().eq(0).text() + " (" + $(".issueNo" + issueNo).children().eq(1).text() + ")";
				$("#discountDetail").html("* 할인내역<br><br><span class='discountText'>- " +detail+ "</span>");
			} else {
				$("#discountDetail").html("* 할인내역<br><br><span class='discountText'>&nbsp;</span>");
			}
			
			var totalPrice = Number($("#cartTotalPrice").val());
			
			if(couponDiscount > 1){
				$(".discountPrice").text(numComma(couponDiscount) + " 원");
				$(".finalPrice").text(numComma(totalPrice-couponDiscount) + " 원");
				$("#finalPrice").val(totalPrice-couponDiscount);
			} else {
				var discount = Math.ceil(totalPrice*couponDiscount/10)*10;
				$(".discountPrice").text(numComma(discount) + " 원");
				$(".finalPrice").text(numComma(totalPrice-discount) + " 원");
				$("#finalPrice").val(totalPrice-discount);
			}
		}
		
		//바로구매
		function noReservation(btn){
			$(".reservationBtn").removeClass("active");
			$(btn).addClass("active");
			
			$("#reservationCondition").val(1);
			
			$("#reservationDiv").empty();
		}
		
		//예약시간
		function reservation(btn){
			$(".reservationBtn").removeClass("active");
			$(btn).addClass("active");
			
			$("#reservationCondition").val(2);
			
			$("#reservationDiv").empty();
			
			var today = new Date();
			var todayAfter = new Date(today.getTime() + 60*60*1000);
			var hours = todayAfter.getHours();
			var minutes = Math.ceil(todayAfter.getMinutes()/10)*10;
			var todayEnd = new Date(todayAfter.getFullYear(),
													todayAfter.getMonth(),
													todayAfter.getDate(),
													20, 50, 0, 0);
			
			if(todayAfter.getTime() >= todayEnd.getTime()){
				$("#reservationDiv").text("예약시간이 지났습니다.");
			} else {
				var $div = $("<div class='ui selection dropdown' id='reserveHoursDrop'>")
								.append("<input type='hidden' name='timeHour' id='reserveHours'>")
								.append("<i class='dropdown icon'>")
								.append($("<div class='default text'>").text("시간"));
				var $menu = $("<div class='menu'>");
				
				if(minutes >= 60){
					for(var i=hours+1; i<21; i++){
						$menu.append($("<div class='item' data-value='"+i+"'>").text(i+"시"));
					}
				} else {
					for(var i=hours; i<21; i++){
						$menu.append($("<div class='item' data-value='"+i+"'>").text(i+"시"));
					}
				}
				
				
				$div.append($menu);
				$("#reservationDiv").append($div);
				
				var $div2 = $("<div class='ui selection dropdown' style='margin-left: 20px;' id='reserveMinutesDrop'>")
								.append("<input type='hidden' name='timeHour' id='reserveMinutes'>")
								.append("<i class='dropdown icon'>")
								.append($("<div class='default text'>").text("분"));
				var $menu2 = $("<div class='menu'>");
				
				$div2.append($menu2);
				$("#reservationDiv").append($div2);
				
				$("#reserveHours").change(function(){
					$('#reserveMinutesDrop').dropdown('restore defaults');
					$menu2.empty();
					if($(this).val() == hours){
						for(var i=minutes; i<60; i+=10){
							$menu2.append($("<div class='item' data-value='"+i+"'>").text(i+"분"));
						}
					} else {
						for(var i=0; i<60; i+=10){
							$menu2.append($("<div class='item' data-value='"+i+"'>").text(i+"분"));
						}
					}
				});
				
				$('.ui.dropdown').dropdown();
			}
		}
		
		//전화번호 유효성
		$("#orderMemberPhone").change(function(){
			var regExp1 = /\d\d\d-\d\d\d-\d\d\d\d/;
			var regExp2 = /\d\d\d-\d\d\d\d-\d\d\d\d/;
			
			if(regExp1.test($(this).val()) || regExp2.test($(this).val())){
				$(this).css({"color":"black"});
			} else {
				$(this).css({"color":"red"});
			}
		});
		
		//주문하기
		function order(){
			var orderReceiver = $("#orderMemberName").val();
			var orderRtel = $("#orderMemberPhone").val();
			var orderPayprice = $("#finalPrice").val();
			var orderMethod = $("#orderMethod").val();
			var deliveryNo = $("#deliveryNo").val();
			var comNo = $("#comNo").val();
			var issueNo = $("#issueNo").val();
			
			var regExp1 = /\d\d\d-\d\d\d-\d\d\d\d/;
			var regExp2 = /\d\d\d-\d\d\d\d-\d\d\d\d/;
			var regExp3 = /\d\d-\d\d\d\d-\d\d\d\d/;
			var regExp4 = /\d\d-\d\d\d-\d\d\d\d/;
			
			var orderToday = new Date();
			if(orderToday.getHours() >= 21){
				alert("주문은 저녁 9시까지 가능합니다.");
				return;
			}
			
			if(orderMethod == ""){
				alert("주문방법을 선택해주세요.");
				return;
			}
			
			if(orderMethod == 1){
				if(deliveryNo == ""){
					alert("배송지를 선택해주세요.");
					return;
				}
			} else if(orderMethod == 2){
				if(comNo == ""){
					alert("매장을 선택해주세요.");
					return;
				}
			}
			
			//폰번호 유효성
			if(regExp1.test(orderRtel) || regExp2.test(orderRtel)
					|| regExp3.test(orderRtel) || regExp4.test(orderRtel)){
			} else {
				alert("전화번호를 잘못 쓰셨습니다.");
				return;
			}
			
			
			//예약시간
			var orderReservetime = "";
			if($("#reservationCondition").val() == 2){
				if($("#reserveHours").val() != null && $("#reserveMinutes").val() != null){
					orderReservetime = $("#reserveHours").val() + ":" + $("#reserveMinutes").val();
				}
				if(orderReservetime == null || $("#reserveHours").val() == "" || $("#reserveMinutes").val() == ""){
					alert("예약시간을 선택해주세요.");
					return;
				}
			}
			
			
			//장바구니
			var orderItem = [];
			for(var no in cartList){
				var orderTopping = [];
				
				if(cartList[no].categ == 1){
					orderTopping.push({
						materialNo: cartList[no].dough,
						orderTcount: 1
					});
					orderTopping.push({
						materialNo: cartList[no].sauce,
						orderTcount: 1
					});
					orderTopping.push({
						materialNo: cartList[no].edge,
						orderTcount: 1
					});
				}
				
				for(var i=0; i<cartList[no].toppings.length; i++){
					if(cartList[no].categ == 1){
						orderTopping.push({
							materialNo: cartList[no].toppings[i].materialNo,
							orderTcount: cartList[no].toppings[i].amount
						});
					} else if(cartList[no].categ == 2){
						orderTopping.push({
							materialNo: cartList[no].toppings[i].topping,
							orderTcount: cartList[no].toppings[i].amount
						});
					}
				}
				
				orderItem.push({
					orderIcateg: cartList[no].categ,
					orderIsize: cartList[no].size,
					orderTcount: cartList[no].amount,
					orderTopping: orderTopping
				});
			}
			
			console.log(orderItem);
			console.log("orderMethod: " + orderMethod);
			console.log("orderReceiver: "+orderReceiver);
			console.log("orderRtel: "+orderRtel);
			console.log("orderReservetime: "+orderReservetime);
			console.log("orderPayprice: "+orderPayprice);
			console.log("deliveryNo: "+deliveryNo);
			console.log("comNo: "+comNo);
			console.log("issueNo: "+issueNo);
			
			var jsonData = JSON.stringify({
					orderItem: orderItem,
					orderMethod: orderMethod,
					orderReceiver: orderReceiver,
					orderRtel: orderRtel,
					orderReservetime: orderReservetime,
					orderPayprice: orderPayprice,
					deliveryNo: deliveryNo,
					comNo: comNo,
					issueNo: issueNo
			});
			
			$.ajax({
				url: "insertOrder.cor",
				type: "post",
				contentType:"application/json;charset=UTF-8",
				data: jsonData,
				success: function(data){
					console.log("성공");
				}, error: function(data){
					console.log("주문 실패!");
				}
			});
			
		}
	</script>

</body>
</html>