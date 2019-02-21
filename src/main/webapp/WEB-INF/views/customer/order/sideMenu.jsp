<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/pmfp/resources/customer/js/common.js"></script>
<link rel="stylesheet" href="/pmfp/resources/customer/css/pizzaMaking.css">
<style>

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp" %>

	<div class="content-box">
		<div class="two brown ui attached buttons" style="height: 50px; margin-bottom: 100px;">
			<button class="ui button" style="font-size: 20px;" onclick="location.href='pizzaMaking.cor'">피자 만들기</button>
			<button class="ui button active" style="font-size: 20px;">사이드 메뉴</button>
		</div>
		
		<div class="ui grid">
			<c:forEach var="side" items="${ sideList }" varStatus="st">
				<c:if test="${ st.count mod 4 == 1 }">
				<div class="four column row" style="margin-bottom: 100px;">
				</c:if>
					<div class="column">
						<img class="sideImg" src="resources/customer/images/material/5/${ side.imgChangename }" width="100%"/>
						<h3>${ side.materialName }</h3>
						<div class="ui container right aligned sidePrice"><fmt:formatNumber value="${ side.materialSellprice }" pattern="#,###" /> 원</div>
						<button class="ui button orange attached container" onclick="addCart(${ side.materialNo })">장바구니에 담기</button>
					</div>
				<c:if test="${ st.count mod 4 == 0 || st.last }">
				</div>
				</c:if>
			</c:forEach>
		</div>
		
		
		<h3 style="margin-top: 100px;">장바구니</h3>
		<table class="ui fixed table cartTable" id="cartTable">
			<thead>
				<tr>
					<th style="width: 5%; text-align: center;"></th>
					<th style="width: 75%">주문제품</th>
					<th style="width: 9%;">수량</th>
					<th style="width: 16%; text-align: center;">가격</th>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan='4'>상품이 없습니다.</td></tr>
			</tbody>
		</table>
		<div class="ui container right aligned" style="margin-bottom: 50px;">
			<span class="text-label text-price">총 금액 : </span>
			<span class="text-label text-price" id="cartTotalPrice">0 원</span>
		</div>
		
		<div class="ui container center aligned">
			<c:if test="${ empty sessionScope.loginUser and empty sessionScope.noUserLogin }">
				<button class="ui blue button" style="width: 150px;" onclick="alert('로그인이 필요합니다.'); $('html,body').scrollTop(0); login();">
					주문하기
				</button>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser or !empty sessionScope.noUserLogin }">
				<button class="ui blue button" style="width: 150px;" onclick="orderBtn();">
					주문하기
				</button>
			</c:if>
		</div>
	</div>

	<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
	<script src="/pmfp/resources/customer/js/jquery.cookie-1.4.1.min.js"></script>
	<script>
		//장바구니 -----------------------------------------------------------------------------------------------------------
		var mateMap;
		var cartNo = 0;
		var cartNoList = [];
		var cartList = {};
		$(".sideImg").mouseenter(function(){
			$(this).removeClass("scale-out-center");
			$(this).addClass("scale-in-center");
		}).mouseout(function(){
			$(this).removeClass("scale-in-center");
			$(this).addClass("scale-out-center");
		});
		
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
		
		//장바구니에 추가
		function addCart(materialNo){
			cartNoList.push(cartNo);
			var cart = {
					cartNo: cartNo,
					categ: 2,
					pizzaName: mateMap[materialNo].materialName,
					dough: "",
					size: "",
					edge: "",
					sauce: "",
					amount: 1
			};
			
			cart["toppings"] = [{amount: 1, topping: materialNo}];
			
			//console.log(cart);
			
			$.cookie.raw = true;
			$.removeCookie("cartNoList");
			$.cookie("cartNoList", JSON.stringify(cartNoList), {expires: 1});
			$.cookie("cartNo"+cartNo, JSON.stringify(cart), {expires: 1});
			cartNo++;
			
			cartLoad();
			alert("장바구니에 담았습니다!");
		}
		
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
						$tr.append($("<td>").append($("<div class='mini-button' onclick='delCart(this, "+cart+")'>").text("×")));
						$tr.append($("<td>").html(cartList[cart].pizzaName + "<br>" + orderProductBasic + "<br>" + orderProductTopping));
						$tr.append($("<td>").append($("<span class='amount'>").text(cartList[cart].amount))
								.append($("<div class='mini-button' onclick='cartAmountPlus("+cart+", this);'>").text("＋"))
								.append($("<div class='mini-button' onclick='cartAmountMinus("+cart+", this);'>").text("－")));
						$tr.append($("<td>").text(numComma(price)));
						
						$cartTable.append($tr);
					}
				}
				for(var cart in cartList){
					if(cartList[cart].categ == 2){
						var $tr = $("<tr>");
						$tr.append($("<td>").append($("<div class='mini-button' onclick='delCart(this, "+cart+")'>").text("×")));
						$tr.append($("<td>").html(cartList[cart].pizzaName));
						$tr.append($("<td>").append($("<span class='amount'>").text(cartList[cart].amount))
								.append($("<div class='mini-button' onclick='cartAmountPlus("+cart+", this);'>").text("＋"))
								.append($("<div class='mini-button' onclick='cartAmountMinus("+cart+", this);'>").text("－")));
						$tr.append($("<td>").text(numComma(mateMap[cartList[cart].toppings[0].topping].materialSellprice*cartList[cart].amount)));
						
						$cartTable.append($tr);
					}
				}
				cartTotalCalc();
			}
		}
		
		//장바구니 삭제
		function delCart(btn, cart){
			//console.log(cartList);
			//console.log(cartNoList);
			$(btn).parent().parent().remove();
			
			delete cartList[cart];
			for(var i=0; i<cartNoList.length; i++) {
				if(cartNoList[i] == cart) {
					cartNoList.splice(i, 1);
					break;
				}
			}
			
			$.cookie.raw = true;
			$.removeCookie("cartNo"+cart);
			$.removeCookie("cartNoList");
			if(cartNoList.length > 0) $.cookie("cartNoList", JSON.stringify(cartNoList), {expires: 1});
			
			if($("#cartTable tbody tr").length == 0) $("#cartTable tbody").append($("<tr>").append($("<td colspan='4'>").text("상품이 없습니다.")));
			cartTotalCalc();
		}
		
		//장바구니 수량 증가
		function cartAmountPlus(cart, btn){
			//console.log(cartList);
			var price = $(btn).parent().parent().children().eq(3).text().replace(/,/g, "")/cartList[cart].amount;
			cartList[cart].amount++;
			
			$.cookie.raw = true;
			$.removeCookie("cartNo"+cart);
			$.removeCookie("cartNoList");
			$.cookie("cartNo"+cart, JSON.stringify(cartList[cart]), {expires: 1});
			$.cookie("cartNoList", JSON.stringify(cartNoList), {expires: 1});
			
			$(btn).parent().parent().children().eq(2).find(".amount").text(cartList[cart].amount);
			$(btn).parent().parent().children().eq(3).text(numComma(price*cartList[cart].amount));
			cartTotalCalc();
			//cartLoad();
		}
		
		//장바구니 수량 감소
		function cartAmountMinus(cart, btn){
			if(cartList[cart].amount > 1){
				var price = $(btn).parent().parent().children().eq(3).text().replace(/,/g, "")/cartList[cart].amount;
				cartList[cart].amount--;
				
				$.cookie.raw = true;
				$.removeCookie("cartNo"+cart);
				$.removeCookie("cartNoList");
				$.cookie("cartNo"+cart, JSON.stringify(cartList[cart]), {expires: 1});
				$.cookie("cartNoList", JSON.stringify(cartNoList), {expires: 1});
				
				$(btn).parent().parent().children().eq(2).find(".amount").text(cartList[cart].amount);
				$(btn).parent().parent().children().eq(3).text(numComma(price*cartList[cart].amount));
				cartTotalCalc();
				//cartLoad();
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
				
				$("#cartTotalPrice").text(numComma(totalPrice) + " 원")
			} else {
				$("#cartTotalPrice").text("0 원")
			}
		}
		//-----------------------------------------------------------------------------------------------------------
		
		function orderBtn(){
			var orderToday = new Date();
			if(orderToday.getHours() >= 21){
				alert("주문은 저녁 9시까지 가능합니다.");
				return;
			}
			
			var totalPrice = Number($("#cartTotalPrice").text().replace(" 원", "").replace(/,/g, ""));
			//console.log(totalPrice);
			if($.cookie("cartNoList")){
				if(totalPrice > 5000){
					location.href='order.cor';
				} else {
					alert("5000원 이상부터 주문이 가능합니다.");
				}
			} else {
				alert("장바구니에 상품이 담겨있지 않습니다.");
			}
		}
		
	</script>

</body>
</html>