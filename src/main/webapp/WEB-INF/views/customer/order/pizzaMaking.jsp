<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/pmfp/resources/customer/js/common.js"></script>
<link rel="stylesheet" href="/pmfp/resources/customer/css/pizzaMaking.css">
<style>
	#recipeModalComplete:hover{
		cursor: default;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/menubar.jsp"/>
	
	<div class="content-box">
		<div class="two brown ui attached buttons" style="height: 50px; margin-bottom: 50px;">
			<button class="ui button active" style="font-size: 20px;">피자 만들기</button>
			<button class="ui button" style="font-size: 20px;" onclick="location.href='sideMenu.cor'">사이드 메뉴</button>
		</div>
		
		<div class="ui center aligned container" style="margin-bottom: 20px;">
			<div class="ui transparent fluid input">
				<input type="text" maxlength="20" value="내 피자" id="pizzaName" style="font-size: 28px; font-weight: bold; color: #975b33; text-align: center; z-index: 10">
			</div>
			<div style="height:7px; width: 600px; background: darkorange; bottom: 7px; position: relative; margin-left: auto; margin-right: auto;"></div>
		</div>
		
		<div class="canvasPlace">
			<img class="placeImg" src="resources/customer/images/order/pizza_place.png">
			<div id="toppings" class="toppings"></div>
		</div>
		
		<div class="controllerPlace">
			<div class="tableCell">
			
				<div class="ui icon floating labeled dropdown green button no-action" id="basicMenuDiv">
					<i class="dropdown icon"></i>
					<span class="text">기본메뉴</span>
					<div class="menu">
						<!-- basicMenu -->
				    </div>
				</div>
				
				<div class="ui icon floating labeled dropdown green button no-action" id="myPizzaMenuDiv" style="margin-left: 20px;">
					<i class="dropdown icon"></i>
					<span class="text">내 레시피</span>
					<div class="menu">
						<!-- myPizzaMenu -->
				    </div>
				</div>
				
				<c:if test="${ !empty sessionScope.loginUser }">
				<button class="ui icon grey button" onclick="location.href='myPageMyMenu.t'">
					<i class="edit icon"></i>
				</button>
				</c:if>
				<c:if test="${ empty sessionScope.loginUser }">
				<button class="ui icon grey button" onclick="alert('로그인이 필요한 기능입니다.');">
					<i class="edit icon"></i>
				</button>
				</c:if>
				
				<c:if test="${ !empty sessionScope.loginUser }">
				<button class="ui blue button" onclick="recipeSave();" style="margin-left: 20px;">
					레시피 저장
				</button>
				</c:if>
				<c:if test="${ empty sessionScope.loginUser }">
				<button class="ui blue button"  onclick="alert('로그인이 필요한 기능입니다.');" style="margin-left: 20px;">
					레시피 저장
				</button>
				</c:if>
				<button class="ui black button" onclick="toppingReset();">
					초기화
				</button>
			</div>
			
			<br>
			
			<div class="tableCell">
			
				<div class="tableCell" style="width: 400px;">
				
				<table class="ui fixed table topping-table">
					<thead>
						<tr>
							<th style="width: 40%;">토핑</th>
							<th style="width: 25%;">수량</th>
							<th style="width: 23%; text-align: center;">가격</th>
							<th style="width: 12%; text-align: center;"></th>
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
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				
				</div>
				
				
				<div class="tableCell" style="width: 180px; padding-left: 10px; vertical-align: top;">
					<span class="text-label">도우</span>
					<div class="ui fluid selection dropdown action" id="doughDiv">
						<input type="hidden" name="dough" id="dough" value="">
						<i class="dropdown icon"></i>
						<div class="default text">도우</div>
						<div class="menu">
							<!-- doughList -->
					    </div>
					</div>
					<span class="text-label">사이즈</span>
					<div class="ui fluid selection dropdown action" id="doughSizeDiv">
						<input type="hidden" name="doughSize" id="doughSize" value="">
						<i class="dropdown icon"></i>
						<div class="default text">사이즈</div>
						<div class="menu">
							<!-- sizeList -->
					    </div>
					</div>
					<span class="text-label">엣지</span>
					<div class="ui fluid selection dropdown action" id="doughEdgeDiv">
						<input type="hidden" name="doughEdge" id="doughEdge">
						<i class="dropdown icon"></i>
						<div class="default text">엣지</div>
						<div class="menu">
							<!-- edgeList -->
					    </div>
					</div>
					<span class="text-label">소스</span>
					<div class="ui fluid selection dropdown action" id="doughSauceDiv">
						<input type="hidden" name="doughSauce" id="doughSauce">
						<i class="dropdown icon"></i>
						<div class="default text">소스</div>
						<div class="menu">
							<!-- sauseList -->
					    </div>
					</div>
					
					<button id="addToppingBtn" class="ui fluid green button" style="margin-top: 34px;">
						토핑 추가
					</button>
				</div>
			</div>
			
			<br>
			
			<div class="tableCell">
				<div style="border-bottom: 1px solid lightgrey;">
					<div style="width: 300px; display: inline-block;">
						<span class="text-label text-price">토핑금액 : </span>
						<span class="text-label text-price" id="toppingPrice">0 원</span>
					</div>
					<div style="width: 272px; display: inline-block; text-align: right;">
						<span class="text-label text-price">기본금액 : </span>
						<span class="text-label text-price" id="basicPrice">0 원</span>
					</div>
				</div>
				
				<div>
					<div style="width: 150px; display: inline-block; margin-top: 30px; border-bottom: 1px solid lightgrey;">
						<span class="text-label text-price">총 금액 : </span>
						<span class="text-label text-price" id="totalPrice">0 원</span>
					</div>
					
					<div style="width: 422px; display: inline-block; text-align: right;">
						<button class="ui orange button" style="width: 150px;" onclick="addCart();">
							장바구니에 담기
						</button>
					</div>
				</div>
			</div>
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
			<button class="ui blue button" style="width: 150px;" onclick="location.href='order.cor'">
				주문하기
			</button>
		</div>
	</div>
	
	
	<!-- 토핑 추가 모달 -->
	<div class="ui longer modal" id="toppingModal" style="top: 40px;">
		<div class="header">토핑 추가 (최대 6개까지 선택)</div>
		<div class="content">
			<div class="ui grid">
				<div class="eight wide column">
					<h4>토핑 목록</h4>
					<table class="ui fixed table" id="toppingAllList">
						<thead>
							<tr>
								<th style="width: 40%; text-align: center;">토핑</th>
								<th style="width: 20%; text-align: center;">사이즈</th>
								<th style="width: 20%; text-align: center;">중량(g)</th>
								<th style="width: 20%; text-align: center;">가격(원)</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				
				</div>
				
				
				<div class="eight wide column">
					<h4>토핑 추가</h4>
					<table class="ui fixed table" id="toppingSelectList">
						<thead>
							<tr>
								<th style="width: 40%; text-align: center;">토핑</th>
								<th style="width: 20%; text-align: center;">사이즈</th>
								<th style="width: 20%; text-align: center;">중량(g)</th>
								<th style="width: 20%; text-align: center;">가격(원)</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				
				</div>
			</div>
			
		</div>
		
		<div class="actions">
			<div class="ui positive approve button" onclick="toppingApply();">추가</div>
			<div class="ui negative cancel button">취소</div>
		</div>
	</div>
	
	<!-- 기본메뉴 사이즈 선택 모달 -->
	<div class="ui modal" id="basicMenuSizeModal">
		<div class="header">사이즈 선택</div>
		<div class="content">
			<div class="two blue ui attached buttons" style="height: 50px;">
			
			</div>
		</div>
	</div>
	
	<!-- 레시피 저장 모달 -->
	<div class="ui tiny basic modal" id="recipeSaveModal">
		<div class="ui massive text loader" id="recipeModalLoader">저장중...</div>
		<div class="ui massive black button" id="recipeModalComplete" style="width: 100%; height: 200px; background-color: transparent;">
			<i class="huge check icon" style="margin-left: 40px;"></i><br><br>
			<div>저장완료</div>
		</div>
	</div>
	
	<!-- 로딩 -->
	<div class="overlayModal fade-in" id="loadingModal">
		<div class="ui active massive text loader"><font color="white">Loading</font></div>
	</div>
	
	
	
	
	
	<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
	<script src="/pmfp/resources/customer/js/jquery.cookie-1.4.1.min.js"></script>
	<script src="/pmfp/resources/customer/js/html2canvas.js"></script>
	<!-- <script src="/pmfp/resources/customer/js/canvas2image.js"></script> -->
	<script>
		$('.ui.dropdown.no-action').dropdown({action: 'hide'});
		$('.ui.dropdown.action').dropdown();
		
		var mateMap;
		var basicMenuList;
		var toppingList;
		var sizeList;
		var mpMap;
		var pizzaSetting;
		var pizzaSettingTopping;
		var cartNo = 0;
		var cartNoList = [];
		var cartList = {};
		//onload -----------------------------------------------------------------------------------------------------------
		$(function(){
			if($.cookie("pizzaSetting")) pizzaSetting = $.parseJSON($.cookie("pizzaSetting"));
			if($.cookie("pizzaSettingTopping")) pizzaSettingTopping = $.parseJSON($.cookie("pizzaSettingTopping"));
			
			$.ajax({
				url: "pizzaMakingData.cor",
				success: function(data){
					mateMap = data["mateMap"];
					basicMenuList = data["basicMenuList"];
					toppingList = data["toppingList"];
					sizeList = data["sizeList"];
					
					var doughList = data["doughList"];
					var sauceList = data["sauceList"];
					var edgeList = data["edgeList"];
					var basicMenu = data["basicMenu"];
					
					/* console.log(mateMap);
					console.log(doughList);
					console.log(sizeList);
					console.log(sauceList);
					console.log(edgeList);
					console.log(toppingList);
					console.log(basicMenu);
					console.log(basicMenuList); */
					
					//기본메뉴
					for(var i=0; i<basicMenu.length; i++) $("#basicMenuDiv .menu").append($("<div class='item' onclick='selectBasicMenuSize(this);'>").text(basicMenu[i]));
					//도우 리스트
					for(var i=0; i<doughList.length; i++) $("#doughDiv .menu").append($("<div class='item'>").text(doughList[i]));
					//사이즈 리스트
					for(var i=0; i<sizeList.length; i++) {
						$("#doughSizeDiv .menu").append($("<div class='item'>").text(sizeList[i]));
						$("#basicMenuSizeModal .content .buttons").append($("<button class='ui button' onclick='selectBasicMenu(this);'>").text(sizeList[i]));
					}
					//소스 리스트
					for(var i=0; i<sauceList.length; i++) $("#doughSauceDiv .menu").append($("<div class='item'>").text(sauceList[i]));
					//엣지 리스트
					for(var i=0; i<edgeList.length; i++) $("#doughEdgeDiv .menu").append($("<div class='item'>").text(edgeList[i]));
					
					//내 레시피
					if(data["mpMap"] != null){
						mpMap = data["mpMap"];
						//console.log(mpMap);
						
						for(var mypizzaNo in mpMap) {
							$("#myPizzaMenuDiv .menu").append($("<div class='item' onclick='selectMyPizzaMenu("+mpMap[mypizzaNo][0].mypizzaNo+")'>").text(mpMap[mypizzaNo][0].mypizzaName));
						}
						if($.isEmptyObject(mpMap)) $("#myPizzaMenuDiv .menu").append($("<div class='item'>").text("없음"));
					} else {
						$("#myPizzaMenuDiv .menu").append($("<div class='item'>").text("없음"));
					}
					
					
					$("#toppings").empty();
					$(".topping-table tbody td").empty();
					$('.ui.dropdown').dropdown('restore defaults');
					pizzaSettingFunc();
					priceCalc();
					cartLoad();
					
					$("#loadingModal").hide();
				}, error: function(data){
					console.log("데이터 불러오기 실패");
				}
			});
		});
		//-----------------------------------------------------------------------------------------------------------
		
		
		
		//기본메뉴 -----------------------------------------------------------------------------------------------------------
		var basicMenu;
		//기본메뉴 사이즈 선택
		function selectBasicMenuSize(div){
			basicMenu = $(div).text();
			$('#basicMenuSizeModal').modal('show');
		}
		
		//기본메뉴 선택
		function selectBasicMenu(div){
			$('#basicMenuSizeModal').modal('hide');
			var doughSize = $(div).text();
			
			//console.log(basicMenu+":"+doughSize);
			
			for(var i=0; i<basicMenuList.length; i++){
				if(basicMenuList[i].basicMenu == basicMenu && basicMenuList[i].basicSize == doughSize){
					//console.log(basicMenuList[i]);
					
					var dough;
					var sauce;
					var edge;
					var pizzaName = basicMenuList[i].basicMenu;
					var toppings = {};
					
					//도우
					for(var j=0; j<basicMenuList[i].basicTopping.length; j++){
						var mate = mateMap[basicMenuList[i].basicTopping[j].materialNo];
						
						if(mate.materialCateg == 1) {
							dough = mate;
						} else if(mate.materialCateg == 2){
							sauce = mate;
						} else if(mate.materialCateg == 3){
							edge = mate;
						} else if(mate.materialCateg == 4){
							toppings[basicMenuList[i].basicTopping[j].materialNo] = {amount: basicMenuList[i].basicTopping[j].basicTcount, topping: mate};
						}
					};
					
					pizzaSetting = {
							dough: dough,
							size: doughSize,
							sauce: sauce,
							edge: edge,
							pizzaName: pizzaName
					};
					pizzaSettingTopping = toppings;
					//쿠키에 저장
					$.cookie.raw = true;
					$.removeCookie("pizzaSetting");
					$.removeCookie("pizzaSettingTopping");
					$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
					$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
					//console.log($.parseJSON($.cookie("pizzaSetting")));
					
					
					
					$("#toppings").empty();
					$(".topping-table tbody td").empty();
					$('.ui.dropdown').dropdown('restore defaults');
					pizzaSettingFunc();
					priceCalc();
					break;
				}
			}
		}
		//-----------------------------------------------------------------------------------------------------------
		
		
		
		//공통 -----------------------------------------------------------------------------------------------------------
		//피자 세팅
		function pizzaSettingFunc(){
			//console.log(pizzaSetting);
			//console.log(pizzaSettingTopping);
			if(pizzaSetting){
				if(pizzaSetting.pizzaName) $("#pizzaName").val(pizzaSetting.pizzaName);
				if(pizzaSetting.dough){
					$("#doughDiv input").val(pizzaSetting.dough.materialName);
					$("#doughDiv .text").text(pizzaSetting.dough.materialName);
				}
				if(pizzaSetting.size){
					$("#doughSizeDiv input").val(pizzaSetting.size);
					$("#doughSizeDiv .text").text(pizzaSetting.size);
				}
				if(pizzaSetting.edge){
					$("#doughEdgeDiv input").val(pizzaSetting.edge.materialName);
					$("#doughEdgeDiv .text").text(pizzaSetting.edge.materialName);
				}
				if(pizzaSetting.sauce){
					$("#doughSauceDiv input").val(pizzaSetting.sauce.materialName);
					$("#doughSauceDiv .text").text(pizzaSetting.sauce.materialName);
				}
				
				if(pizzaSettingTopping){
					var i=0;
					for(var materialNo in pizzaSettingTopping){
						$(".topping-table tbody tr").eq(i).children().eq(0).text(pizzaSettingTopping[materialNo].topping.materialName + " (" + pizzaSettingTopping[materialNo].topping.materialWeight + "g)");
						$(".topping-table tbody tr").eq(i).children().eq(1)
							.append($("<span class='amount'>").text(pizzaSettingTopping[materialNo].amount))
							.append($("<div class='mini-button' onclick='toppingAmountPlus("+materialNo+", this);'>").text("＋"))
							.append($("<div class='mini-button' onclick='toppingAmountMinus("+materialNo+", this);'>").text("－"));
						$(".topping-table tbody tr").eq(i).children().eq(2).text(numComma(pizzaSettingTopping[materialNo].topping.materialSellprice*pizzaSettingTopping[materialNo].amount));
						$(".topping-table tbody tr").eq(i++).children().eq(3).append($("<div class='mini-button' onclick='toppingTableListDel("+materialNo+", this);'>").text("×"));
					}
				}
				
				imgAll();
			}
		}
		
		//토핑 개수 증가
		function toppingAmountPlus(no, btn){
			if(pizzaSettingTopping[no].amount < 6) {
				pizzaSettingTopping[no].amount++;
				$(btn).parent().parent().children().eq(1).find(".amount").text(pizzaSettingTopping[no].amount);
				$(btn).parent().parent().children().eq(2).text(numComma(pizzaSettingTopping[no].topping.materialSellprice*pizzaSettingTopping[no].amount));
				priceCalc();
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSettingTopping");
				$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
			}
		}
		
		//토핑 개수 감소
		function toppingAmountMinus(no, btn){
			if(pizzaSettingTopping[no].amount > 1) {
				pizzaSettingTopping[no].amount--;
				$(btn).parent().parent().children().eq(1).find(".amount").text(pizzaSettingTopping[no].amount);
				$(btn).parent().parent().children().eq(2).text(numComma(pizzaSettingTopping[no].topping.materialSellprice*pizzaSettingTopping[no].amount));
				priceCalc();
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSettingTopping");
				$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
			}
		}
		
		//토핑 제거
		function toppingTableListDel(no, btn){
			$(btn).parent().parent().remove();
			var $tr = $("<tr>").append($("<td>")).append($("<td>")).append($("<td>")).append($("<td>"));
			$(".topping-table tbody").append($tr);
			toppingDelImg(no);
			//$(".doughToppingImg"+no).remove();
			
			delete pizzaSettingTopping[no];
			if($.isEmptyObject(pizzaSettingTopping)) pizzaSettingTopping = null;
			
			priceCalc();
			
			$.cookie.raw = true;
			$.removeCookie("pizzaSettingTopping");
			$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
		}
		
		//옵션 & 토핑 세팅 초기화
		function toppingReset(){
			for(var i=0; i<setTime.length; i++) {
				clearTimeout(setTime[i]);
			}
			setTime = [];
			$("#pizzaName").val("내 피자");
			
			$("#toppings").empty();
			$(".topping-table tbody td").empty();
			$('.ui.dropdown').dropdown('restore defaults');
			$.removeCookie("pizzaSetting");
			$.removeCookie("pizzaSettingTopping");
			pizzaSetting = null;
			pizzaSettingTopping = null;
			priceCalc();
		}
		
		//피자 이름 변경시
		$("#pizzaName").change(function(){
			pizzaSetting.pizzaName = $("#pizzaName").val();
			//console.log(pizzaSetting.pizzaName);
			$.cookie.raw = true;
			$.removeCookie("pizzaSetting");
			$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
		});
		
		//가격 계산
		function priceCalc(){
			var basicPrice = 0;
			if(pizzaSetting){
				if(pizzaSetting.dough) basicPrice += pizzaSetting.dough.materialSellprice;
				if(pizzaSetting.edge) basicPrice += pizzaSetting.edge.materialSellprice;
				if(pizzaSetting.sauce) basicPrice += pizzaSetting.sauce.materialSellprice;
			}
			
			var toppingPrice = 0;
			if(pizzaSettingTopping){
				for(var materialNo in pizzaSettingTopping){
					toppingPrice += pizzaSettingTopping[materialNo].topping.materialSellprice * pizzaSettingTopping[materialNo].amount;
				}
			}
			
			var totalPrice = basicPrice + toppingPrice;
			
			$("#basicPrice").text(numComma(basicPrice) + " 원");
			$("#toppingPrice").text(numComma(toppingPrice) + " 원");
			$("#totalPrice").text(numComma(totalPrice) + " 원");
		}
		//-----------------------------------------------------------------------------------------------------------
		
		
		//토핑 추가 모달 -----------------------------------------------------------------------------------------------------------
		//토핑 추가 버튼
		$("#addToppingBtn").click(function (){
			if($('#dough').val() == ""){
				$('#addToppingBtn').popup({	//팝업 요소 생성
					html : '<span style="color: red;">도우를 선택해주세요!</span>',
					on: 'click',	//클릭할때 보여짐
					position: 'bottom left',
					onHidden: function() {	//팝업창 히든시 팝업 요소 제거
						$('#addToppingBtn').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			} else if($('#doughSize').val() == ""){
				$('#addToppingBtn').popup({	//팝업 요소 생성
					html : '<span style="color: red;">사이즈를 선택해주세요!</span>',
					on: 'click',	//클릭할때 보여짐
					position: 'bottom left',
					onHidden: function() {	//팝업창 히든시 팝업 요소 제거
						$('#addToppingBtn').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			} else if($('#doughEdge').val() == ""){
				$('#addToppingBtn').popup({	//팝업 요소 생성
					html : '<span style="color: red;">엣지를 선택해주세요!</span>',
					on: 'click',	//클릭할때 보여짐
					position: 'bottom left',
					onHidden: function() {	//팝업창 히든시 팝업 요소 제거
						$('#addToppingBtn').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			} else if($('#doughSauce').val() == ""){
				$('#addToppingBtn').popup({	//팝업 요소 생성
					html : '<span style="color: red;">소스를 선택해주세요!</span>',
					on: 'click',	//클릭할때 보여짐
					position: 'bottom left',
					onHidden: function() {	//팝업창 히든시 팝업 요소 제거
						$('#addToppingBtn').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			} else {
				selectToppingList();
				$('#toppingModal').modal('show');
			}
		});
		
		//토핑 목록 가져오기(사이즈)
		function selectToppingList(){
			var materialSize = $("#doughSize").val().toUpperCase();
			
			var $toppingAllList = $("#toppingAllList tbody");
			$toppingAllList.empty();
			
			for(var i=0; i<toppingList.length; i++){
				if(toppingList[i].materialSize == materialSize){
					var $tr = $("<tr onclick='addToppingModal(this)'>")
						.mouseenter(function(){
							$(this).css({"background":"lightgray", "cursor":"pointer"});
						}).mouseout(function(){
							$(this).css({"background":"white"});
						});
					
					if(pizzaSettingTopping){
						for(var materialNo in pizzaSettingTopping){
							if(pizzaSettingTopping[materialNo].topping.materialName == toppingList[i].materialName){
								$tr.css({"background":"lightgray"});
								$tr.off('mouseout');
								break;
							}
						}
					}
					
					$tr.append($("<input type='hidden' class='materialNo' value='"+toppingList[i].materialNo+"'>"));
					$tr.append($("<td>").text(toppingList[i].materialName));
					$tr.append($("<td>").text(toppingList[i].materialSize));
					$tr.append($("<td>").text(toppingList[i].materialWeight));
					$tr.append($("<td>").text(numComma(toppingList[i].materialSellprice)));
					
					$toppingAllList.append($tr);
				}
			}
			
			var $toppingSelectList = $("#toppingSelectList tbody");
			$toppingSelectList.empty();
			
			if(pizzaSettingTopping){
				for(var materialNo in pizzaSettingTopping){
					var $tr = $("<tr onclick='delToppingModal(this)'>")
						.mouseenter(function(){
							$(this).css({"background":"lightgray", "cursor":"pointer"});
						}).mouseout(function(){
							$(this).css({"background":"white"});
						});
					$tr.append($("<input type='hidden' class='materialNo' value='"+pizzaSettingTopping[materialNo].topping.materialNo+"'>"));
					$tr.append($("<td>").text(pizzaSettingTopping[materialNo].topping.materialName));
					$tr.append($("<td>").text(pizzaSettingTopping[materialNo].topping.materialSize));
					$tr.append($("<td>").text(pizzaSettingTopping[materialNo].topping.materialWeight));
					$tr.append($("<td>").text(numComma(pizzaSettingTopping[materialNo].topping.materialSellprice)));
					
					$toppingSelectList.append($tr);
				}
			}
		}
		
		//토핑 추가(모달)
		function addToppingModal(tr){
			var $toppingSelectList = $("#toppingSelectList tbody");
			var chk = true;
			var materialNo = $(tr).children().eq(0).val();
			var materialNoSel = $("#toppingSelectList tbody .materialNo")

			for(var i=0; i<materialNoSel.length; i++){
				if(materialNoSel[i].value == materialNo) {
					chk = false;
					break;
				}
			}
			if($toppingSelectList.children().length < 6 && chk){
				$toppingSelectList.append($(tr).clone(true).attr("onclick", "delToppingModal(this)").css({"background":"white"}));
				$(tr).css({"background":"lightgray"});
				$(tr).off('mouseout');
			} else if($toppingSelectList.children().length >= 6 && chk) {
				alert("토핑은 최대 6개까지 선택 가능합니다.");
			}
		}
		
		//토핑 제거(모달)
		function delToppingModal(tr){
			var materialNo = $(tr).children().eq(0).val();
			var materialNoAll = $("#toppingAllList tbody .materialNo");
			
			for(var i=0; i<materialNoAll.length; i++){
				if(materialNoAll[i].value == materialNo) {
					$(materialNoAll[i]).parent().css({"background":"white"})
					.mouseout(function(){
						$(this).css({"background":"white"});
					});
					break;
				}
			}
			$(tr).remove();
		}
		
		//토핑 적용
		function toppingApply(){
			var materialNoList = $("#toppingSelectList tbody").find(".materialNo");
			
			if(materialNoList.length > 0){
				var toppings = {};
				for(var i=0; i<materialNoList.length; i++){
					var chk = true;
					for(var materialNo in pizzaSettingTopping){
						if(materialNoList[i].value == materialNo){
							toppings[materialNoList[i].value] = pizzaSettingTopping[materialNo];
							chk = false;
							break;
						}
					}
					if(chk){
						toppings[materialNoList[i].value] = {amount: 1, topping: mateMap[materialNoList[i].value]};
					}
				}
				
				//delete pizzaSettingTopping;
				pizzaSettingTopping = toppings;
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSettingTopping");
				$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
				
				
				$(".topping-table tbody td").empty();
				$(".doughToppingImg").remove();
				pizzaSettingFunc();
				priceCalc();
				
				//console.log(pizzaSettingTopping);
			}
		}
		//-----------------------------------------------------------------------------------------------------------
		
		//기본 설정 -----------------------------------------------------------------------------------------------------------
		//도우, 사이즈, 소스, 엣지
		$('#dough').change(function(){
			if($('#dough').val() != "" && $('#doughSize').val() != ""){
				var dough;
				
				for(var materialNo in mateMap){
					if(mateMap[materialNo].materialCateg == 1 && mateMap[materialNo].materialName == $('#dough').val()
							&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
						dough = mateMap[materialNo];
						break;
					}
				}
				
				if(pizzaSetting){
					pizzaSetting["pizzaName"] = $('#pizzaName').val();
					pizzaSetting["dough"] = dough;
					pizzaSetting["size"] = $('#doughSize').val().toUpperCase();
				} else {
					pizzaSetting = {
							pizzaName: $('#pizzaName').val(),
							dough: dough,
							size: $('#doughSize').val().toUpperCase()
					}
				}
				
				if($('#doughSauce').val() != ""){
					var sauce;
					
					for(var materialNo in mateMap){
						if(mateMap[materialNo].materialCateg == 2 && mateMap[materialNo].materialName == $('#doughSauce').val()
								&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
							sauce = mateMap[materialNo];
							break;
						}
					}
					
					pizzaSetting["sauce"] = sauce;
				}
				if($('#doughEdge').val() != ""){
					var edge;
					
					for(var materialNo in mateMap){
						if(mateMap[materialNo].materialCateg == 3 && mateMap[materialNo].materialName == $('#doughEdge').val()
								&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
							edge = mateMap[materialNo];
							break;
						}
					}
					
					pizzaSetting["edge"] = edge;
				}
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSetting");
				$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
				
				priceCalc();
				imgAll();
			}
		});
		$('#doughSize').change(function(){
			if($('#dough').val() != "" && $('#doughSize').val() != ""){
				var dough;
				
				for(var materialNo in mateMap){
					if(mateMap[materialNo].materialCateg == 1 && mateMap[materialNo].materialName == $('#dough').val()
							&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
						dough = mateMap[materialNo];
						break;
					}
				}
				
				if(pizzaSetting){
					pizzaSetting["pizzaName"] = $('#pizzaName').val();
					pizzaSetting["dough"] = dough;
					pizzaSetting["size"] = $('#doughSize').val().toUpperCase();
				} else {
					pizzaSetting = {
							pizzaName: $('#pizzaName').val(),
							dough: dough,
							size: $('#doughSize').val().toUpperCase()
					}
				}
				
				//console.log(pizzaSetting);
				
				if($('#doughSauce').val() != ""){
					var sauce;
					
					for(var materialNo in mateMap){
						if(mateMap[materialNo].materialCateg == 2 && mateMap[materialNo].materialName == $('#doughSauce').val()
								&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
							sauce = mateMap[materialNo];
							break;
						}
					}
					
					pizzaSetting["sauce"] = sauce;
				}
				if($('#doughEdge').val() != ""){
					var edge;
					
					for(var materialNo in mateMap){
						if(mateMap[materialNo].materialCateg == 3 && mateMap[materialNo].materialName == $('#doughEdge').val()
								&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
							edge = mateMap[materialNo];
							break;
						}
					}
					
					pizzaSetting["edge"] = edge;
				}
				if(pizzaSettingTopping){
					var toppings = {};
					for(var materialNo in pizzaSettingTopping){
						for(var materialNo2 in mateMap){
							if(mateMap[materialNo2].materialCateg == 4 && mateMap[materialNo2].materialName == pizzaSettingTopping[materialNo].topping.materialName
									&& mateMap[materialNo2].materialSize == $('#doughSize').val().toUpperCase()) {
								toppings[materialNo2] = {amount: pizzaSettingTopping[materialNo].amount, topping: mateMap[materialNo2]};
								break;
							}
						}
					}
					
					pizzaSettingTopping = toppings;
					
					$(".topping-table tbody td").empty();
					var i=0;
					for(var materialNo in pizzaSettingTopping){
						$(".topping-table tbody tr").eq(i).children().eq(0).text(pizzaSettingTopping[materialNo].topping.materialName + " (" + pizzaSettingTopping[materialNo].topping.materialWeight + "g)");
						$(".topping-table tbody tr").eq(i).children().eq(1)
							.append($("<span class='amount'>").text(pizzaSettingTopping[materialNo].amount))
							.append($("<div class='mini-button' onclick='toppingAmountPlus("+materialNo+", this);'>").text("＋"))
							.append($("<div class='mini-button' onclick='toppingAmountMinus("+materialNo+", this);'>").text("－"));
						$(".topping-table tbody tr").eq(i).children().eq(2).text(numComma(pizzaSettingTopping[materialNo].topping.materialSellprice*pizzaSettingTopping[materialNo].amount));
						$(".topping-table tbody tr").eq(i++).children().eq(3).append($("<div class='mini-button' onclick='toppingTableListDel("+materialNo+", this);'>").text("×"));
					}
				}
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSetting");
				$.removeCookie("pizzaSettingTopping");
				$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
				$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
				
				priceCalc();
				imgAll();
			}
		});
		$('#doughSauce').change(function(){
			if($('#doughSauce').val() != "" && $('#doughImg').length > 0){
				
				if($('#doughSauceImg').length > 0) $('#doughSauceImg').remove();
				if($('.doughToppingImg').length > 0) $('.doughToppingImg').remove();
				var sauce;
				
				for(var materialNo in mateMap){
					if(mateMap[materialNo].materialCateg == 2 && mateMap[materialNo].materialName == $('#doughSauce').val()
							&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
						sauce = mateMap[materialNo];
						break;
					}
				}
				
				pizzaSetting["sauce"] = sauce;
				
				priceCalc();
				imgAll();
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSetting");
				$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
			}
		});
		$('#doughEdge').change(function(){
			if($('#doughEdge').val() != "" && $('#doughImg').length > 0 ) {
				var edge;
				
				for(var materialNo in mateMap){
					if(mateMap[materialNo].materialCateg == 3 && mateMap[materialNo].materialName == $('#doughEdge').val()
							&& mateMap[materialNo].materialSize == $('#doughSize').val().toUpperCase()) {
						edge = mateMap[materialNo];
						break;
					}
				}
				
				pizzaSetting["edge"] = edge;
				
				priceCalc();
				
				$.cookie.raw = true;
				$.removeCookie("pizzaSetting");
				$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
			}
		});
		//-----------------------------------------------------------------------------------------------------------
		
		var setTime = [];
		//이미지 -----------------------------------------------------------------------------------------------------------
		//이미지 공통
		function imgAll(){
			for(var i=0; i<setTime.length; i++) {
				clearTimeout(setTime[i]);
			}
			setTime = [];
			if($('#dough').val() != "" && $('#doughSize').val() != "" && $('#doughImg').length == 0){
				setTime.push(setTimeout(function(){doughImg();}, 100));
				
				if($('#doughSauce').val() != "") setTime.push(setTimeout(function(){sauceImg();}, 600));
				
				var interval = 0;
				if(pizzaSettingTopping){
					var chk = true;
					for(var materialNo in pizzaSettingTopping){
						if(pizzaSettingTopping[materialNo].topping.imgOriginname.indexOf("cheese") > -1){
							if(chk){
								(function(no){
									setTime.push(setTimeout(function(){cheeseImg(no);}, 800 + interval));
									interval = interval + 400;
								})(materialNo);
								chk = false;
							}
						} else {
							(function(no){
								setTime.push(setTimeout(function(){toppingImg(no);}, 800 + interval));
								interval = interval + 200;
							})(materialNo);
						}
					}
				}
				
				return;
			}
			if($('#doughSauce').val() != "" && $('#doughImg').length > 0 && $('#doughSauceImg').length == 0){
				setTime.push(setTimeout(function(){sauceImg();}, 100));
				
				var interval = 0;
				if(pizzaSettingTopping){
					var chk = true;
					for(var materialNo in pizzaSettingTopping){
						if(pizzaSettingTopping[materialNo].topping.imgOriginname.indexOf("cheese") > -1){
							if(chk){
								(function(no){
									setTime.push(setTimeout(function(){cheeseImg(no);}, 200 + interval));
									interval = interval + 400;
								})(materialNo);
								chk = false;
							}
						} else {
							(function(no){
								setTime.push(setTimeout(function(){toppingImg(no);}, 200 + interval));
								interval = interval + 200;
							})(materialNo);
						}
					}
				}
				
				return;
			}
			if($('#doughImg').length > 0 && $('#doughSauceImg').length > 0 && $('.doughToppingImg').length == 0){
				var interval = 0;
				if(pizzaSettingTopping){
					var chk = true;
					for(var materialNo in pizzaSettingTopping){
						if(pizzaSettingTopping[materialNo].topping.imgOriginname.indexOf("cheese") > -1){
							if(chk){
								(function(no){
									setTime.push(setTimeout(function(){cheeseImg(no);}, interval));
									interval = interval + 400;
								})(materialNo);
								chk = false;
							}
						} else {
							(function(no){
								setTime.push(setTimeout(function(){toppingImg(no);}, interval));
								interval = interval + 200;
							})(materialNo);
						}
					}
				}
				
				return;
			}
		}
		
		//도우 이미지
		function doughImg(){
			var $dough = $("<img id='doughImg'>");
			$dough.attr("src", "resources/customer/images/material/1/"+pizzaSetting.dough.imgOriginname);
			$dough.addClass("scale-down-center");
			$dough.css({"position":"absolute", "z-index":"2", "width":"420px", "height":"420px"});
			
			$("#toppings").append($dough);
		}
		
		//소스 이미지
		function sauceImg(){
			var $sauce = $("<img id='doughSauceImg'>");
			$sauce.attr("src", "resources/customer/images/material/2/"+pizzaSetting.sauce.imgOriginname);
			$sauce.addClass("scale-up-center");
			$sauce.css({"position":"absolute", "z-index":"3", "width":"420px", "height":"420px"});
			
			$("#toppings").append($sauce);
		}
		
		//치즈 이미지
		function cheeseImg(materialNo){
			var $cheese = $("<img class='doughToppingImg doughToppingImg"+materialNo+"'>");
			$cheese.attr("src", "resources/customer/images/material/4/cheese.png");
			$cheese.addClass("scale-up-center");
			$cheese.css({"position":"absolute", "z-index":"4", "width":"420px", "height":"420px"});
			
			$("#toppings").append($cheese);
		}
		
		//토핑 이미지
		function toppingImg(materialNo){
			var $topping = $("<img class='doughToppingImg doughToppingImg"+materialNo+"'>");
			$topping.attr("src", "resources/customer/images/material/4/" + pizzaSettingTopping[materialNo].topping.imgOriginname);
			$topping.addClass("scale-down-center");
			$topping.css({"position":"absolute", "z-index":materialNo, "width":"420px", "height":"420px"});
			
			$("#toppings").append($topping);
		}
		
		//토핑 이미지 제거
		function toppingDelImg(materialNo){
			var $topping = $(".doughToppingImg"+materialNo);
			$topping.removeClass();
			$topping.addClass("fade-out");
			setTimeout(function(){$topping.remove();}, 500);
		}
		
		//이미지 저장
		function imgSave(){
			$("#doughImg").removeClass('scale-down-center');
		    $("#doughSauceImg").removeClass('scale-up-center');
		    $(".doughToppingImg").removeClass('scale-up-center');
		    $(".doughToppingImg").removeClass('scale-down-center');
		    
			html2canvas(document.getElementById("toppings")).then(function(canvas) {
				$.ajax({
					url: "pizzaMakingImgUpload.cor",
					data: {img: canvas.toDataURL("image/png")},
					dataType: "text",
					type: "POST",
					success: function(data){
						console.log("우왕");
					}, error: function(data){
						console.log("이미지 업로드 실패!");
					}
				});
			});
		}
		//-----------------------------------------------------------------------------------------------------------
		
		
		
		//장바구니 -----------------------------------------------------------------------------------------------------------
		//장바구니에 추가
		function addCart(){
			if(pizzaSetting != null && pizzaSettingTopping != null){
				cartNoList.push(cartNo);
				var cart = {
						cartNo: cartNo,
						categ: 1,
						pizzaName: pizzaSetting.pizzaName,
						dough: pizzaSetting.dough.materialNo,
						size: pizzaSetting.size,
						edge: pizzaSetting.edge.materialNo,
						sauce: pizzaSetting.sauce.materialNo,
						amount: 1
				};
				var toppings = [];
				
				for(var materialNo in pizzaSettingTopping){
					toppings.push({
						materialNo: pizzaSettingTopping[materialNo].topping.materialNo,
						amount: pizzaSettingTopping[materialNo].amount
					});
				}
				cart["toppings"] = toppings;
				
				//console.log(cart);
				
				$.cookie.raw = true;
				$.removeCookie("cartNoList");
				$.cookie("cartNoList", JSON.stringify(cartNoList), {expires: 1});
				$.cookie("cartNo"+cartNo, JSON.stringify(cart), {expires: 1});
				cartNo++;
				
				cartLoad();
			} else {
				alert("옵션을 선택하세요!\nex) 도우, 사이즈, 엣지, 소스, 토핑 최소 1개 이상");
			}
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
		
		
		//레시피 -----------------------------------------------------------------------------------------------------------
		//레시피 저장
		function recipeSave(){
			if(pizzaSetting != null && pizzaSettingTopping != null){
				$("#recipeModalLoader").show();
				$("#recipeModalComplete").hide();
				$("#recipeModalComplete").off();
				$("#recipeSaveModal").modal('setting', 'closable', false).modal("show");
				//이미지 애니메이션 제거
				$("#doughImg").removeClass('scale-down-center');
			    $("#doughSauceImg").removeClass('scale-up-center');
			    $(".doughToppingImg").removeClass('scale-up-center');
			    $(".doughToppingImg").removeClass('scale-down-center');
			    
			    html2canvas(document.getElementById("toppings")).then(function(canvas) {
			    	//재료정보
					var toppings = [];
					for(var materialNo in pizzaSettingTopping){
						toppings.push(pizzaSettingTopping[materialNo].topping.materialNo+":"+pizzaSettingTopping[materialNo].amount);
					}
					var setting = {
							pizzaName: pizzaSetting.pizzaName,
							dough: pizzaSetting.dough.materialNo,
							size: pizzaSetting.size,
							edge: pizzaSetting.edge.materialNo,
							sauce: pizzaSetting.sauce.materialNo,
							toppings: toppings,
							img: canvas.toDataURL("image/png")
					};
			    	
					$.ajax({
						url: "saveRecipe.cor",
						type: "POST",
						data: setting,
						success: function(data){
							//alert(data);
							if(data != null){
								mpMap = data;
								$("#myPizzaMenuDiv .menu").empty();
								for(var mypizzaNo in data) {
									$("#myPizzaMenuDiv .menu").append($("<div class='item' onclick='selectMyPizzaMenu("+data[mypizzaNo][0].mypizzaNo+")'>").text(data[mypizzaNo][0].mypizzaName));
								}
								
								$("#recipeModalLoader").hide();
								$("#recipeModalComplete").show();
								$("#recipeModalComplete").click(function(){
									$("#recipeSaveModal").modal("hide");
								});
								$("#recipeSaveModal").modal('setting', 'closable', true);
							} else {
								$("#recipeSaveModal").modal('setting', 'closable', true).modal("hide");
								alert("레시피 저장 실패!");
							}
							
						}, error: function(data){
							$("#recipeSaveModal").modal('setting', 'closable', true).modal("hide");
							alert("레시피 저장 실패!");
						}
					});
				});
			} else {
				alert("옵션을 선택하세요!\nex) 도우, 사이즈, 엣지, 소스, 토핑 최소 1개 이상");
			}
			
		}
		
		//내 레시피 선택
		function selectMyPizzaMenu(mypizzaNo){
			var dough;
			var doughSize = mateMap[mpMap[mypizzaNo][0].materialNo].materialSize;
			var sauce;
			var edge;
			var pizzaName = mpMap[mypizzaNo][0].mypizzaName;
			var toppings = {};
			
			//도우
			for(var i=0; i<mpMap[mypizzaNo].length; i++){
				var mate = mpMap[mypizzaNo][i];
				
				if(mate.materialCateg == 1) {
					dough = mateMap[mpMap[mypizzaNo][i].materialNo];
				} else if(mate.materialCateg == 2){
					sauce = mateMap[mpMap[mypizzaNo][i].materialNo];
				} else if(mate.materialCateg == 3){
					edge = mateMap[mpMap[mypizzaNo][i].materialNo];
				} else if(mate.materialCateg == 4){
					toppings[mpMap[mypizzaNo][i].materialNo] = {amount: mpMap[mypizzaNo][i].orderTcount, topping: mateMap[mpMap[mypizzaNo][i].materialNo]};
				}
			};
			
			pizzaSetting = {
					dough: dough,
					size: doughSize,
					sauce: sauce,
					edge: edge,
					pizzaName: pizzaName
			};
			pizzaSettingTopping = toppings;
			//쿠키에 저장
			$.cookie.raw = true;
			$.removeCookie("pizzaSetting");
			$.removeCookie("pizzaSettingTopping");
			$.cookie("pizzaSetting", JSON.stringify(pizzaSetting), {expires: 1});
			$.cookie("pizzaSettingTopping", JSON.stringify(pizzaSettingTopping), {expires: 1});
			//console.log($.parseJSON($.cookie("pizzaSetting")));
			
			
			
			$("#toppings").empty();
			$(".topping-table tbody td").empty();
			$('.ui.dropdown').dropdown('restore defaults');
			pizzaSettingFunc();
			priceCalc();
		}
		//-----------------------------------------------------------------------------------------------------------
		
	</script>
</body>
</html>