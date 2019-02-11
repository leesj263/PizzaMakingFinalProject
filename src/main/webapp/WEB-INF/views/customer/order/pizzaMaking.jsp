<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
    .scale-down-center {
        -webkit-animation: scale-down-center 0.7s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
                animation: scale-down-center 0.7s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
    }
    /* ----------------------------------------------
    * Generated by Animista on 2019-1-23 14:12:58
    * w: http://animista.net, t: @cssanimista
    * ---------------------------------------------- */

    /**
    * ----------------------------------------
    * animation scale-down-center
    * ----------------------------------------
    */
    @-webkit-keyframes scale-down-center {
    0% {
        opacity: 0;
        -webkit-transform: scale(1.5) translateY(-30px);
                transform: scale(1.5) translateY(-30px);
    }
    100% {
        opacity: 1;
        -webkit-transform: scale(1) translateY(0);
                transform: scale(1) translateY(0);
    }
    }
    @keyframes scale-down-center {
    0% {
        opacity: 0;
        -webkit-transform: scale(1.5) translateY(-30px);
                transform: scale(1.5) translateY(-30px);
    }
    100% {
        opacity: 1;
        -webkit-transform: scale(1) translateY(0);
                transform: scale(1) translateY(0);
    }
    }
	
	
	.scale-up-center {
		-webkit-animation: scale-up-center 0.6s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
		        animation: scale-up-center 0.6s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	}

	/* ----------------------------------------------
	 * Generated by Animista on 2019-1-25 12:35:32
	 * w: http://animista.net, t: @cssanimista
	 * ---------------------------------------------- */
	
	/**
	 * ----------------------------------------
	 * animation scale-up-center
	 * ----------------------------------------
	 */
	@-webkit-keyframes scale-up-center {
	  0% {
	  	opacity: 0;
	    -webkit-transform: scale(0.5);
	            transform: scale(0.5);
	  }
	  100% {
	  	opacity: 1;
	    -webkit-transform: scale(1) translateY(0);
	            transform: scale(1) translateY(0);
	  }
	}
	@keyframes scale-up-center {
	  0% {
	  	opacity: 0;
	    -webkit-transform: scale(0.5);
	            transform: scale(0.5);
	  }
	  100% {
	  	opacity: 1;
	    -webkit-transform: scale(1) translateY(0);
	            transform: scale(1) translateY(0);
	  }
	}


	.canvasPlace{
		position: relative;
		width: 600px;
		height: 520px;
		display: table-cell;
	}
	.placeImg{
		position: absolute;
		width: 600px;
		z-index: 0;
	}
	.toppings{
		position: absolute;
		width: 420px;
		height: 420px;
		left: 43px;
		top: 43px;
		outline: 1px solid black;
		z-index: 1;
	}
	.controllerPlace{
		border: 1px solid rgba(0, 0, 0, 0.1);
		/* background-color: rgba(0, 0, 0, 0.035); */
		width: 600px;
		height: 520px;
		padding: 10px;
		display: table-cell;
	}
	.content-box{
		width: 1200px;
		margin-top: 80px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50px;
	}
	.topping-table{
		width: 400px;
	}
	.topping-table td{
		height: 41px;
	}
	.tableCell{
		display: table-cell;
	}
	.mini-button{
		width: 20px;
		height: 20px;
		padding: auto;
		background-color: grey;
		border-radius: 3px;
		color: white;
		font-weight: bold;
		text-align: center;
		display: inline-block;
	}
	.mini-button:hover{
		background-color: darkgrey;
		cursor: pointer;
	}
	.amount{
		margin-right: 10px;
	}
	.text-label{
		font-weight: bold;
	}
	.dropdown.action{
		margin-bottom: 15px;
	}
	.text-price{
		font-size: 16px;
		color: orangered;
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
				
				<div class="ui icon floating labeled dropdown green button no-action" style="margin-left: 20px;">
					<i class="dropdown icon"></i>
					<span class="text">내 레시피</span>
					<div class="menu">
						<div class="item">겁나 맛있음</div>
						<div class="item">끝내주게 맛있음</div>
				    </div>
				</div>
				
				<button class="ui icon grey button">
					<i class="edit icon"></i>
				</button>
				
				<button class="ui blue button" style="margin-left: 20px;">
					레시피 저장
				</button>
				<button class="ui black button" onclick="toppingReset();">
					초기화
				</button>
			</div>
			
			<br>
			
			<div class="tableCell">
			
				<div class="tableCell" style="width: 400px;">
				
				<table class="ui single line table topping-table">
					<thead>
						<tr>
							<th style="width: 200px;">토핑</th>
							<th style="width: 80px;">수량</th>
							<th style="width: 80px;">가격</th>
							<th style="width: 20px;"></th>
						</tr>
						</thead>
					<tbody>
						<tr>
							<td>새우(100g)</td>
							<td>
								<span class="amount">2</span>
								<div class="mini-button">＋</div>
								<div class="mini-button">－</div>
							</td>
							<td>3,500</td>
							<td>
								<div class="mini-button">×</div>
							</td>
						</tr>
						<tr>
							<td>치즈(150g)</td>
							<td>
								<span class="amount">2</span>
								<div class="mini-button">＋</div>
								<div class="mini-button">－</div>
							</td>
							<td>3,500</td>
							<td>
								<div class="mini-button">×</div>
							</td>
						</tr>
						<tr>
							<td>타이어(50g)</td>
							<td>
								<span class="amount">2</span>
								<div class="mini-button">＋</div>
								<div class="mini-button">－</div>
							</td>
							<td>3,000</td>
							<td>
								<div class="mini-button">×</div>
							</td>
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
					
					<button id="addToppingBtn" class="ui fluid green button" style="margin-top: 30px;">
						토핑 추가
					</button>
				</div>
			</div>
			
			<br>
			
			<div class="tableCell">
				<div style="border-bottom: 1px solid lightgrey;">
					<div style="width: 300px; display: inline-block;">
						<span class="text-label text-price">토핑금액 : </span>
						<span class="text-label text-price">10,000 원</span>
					</div>
					<div style="width: 272px; display: inline-block; text-align: right;">
						<span class="text-label text-price">기본금액 : </span>
						<span class="text-label text-price">10,000 원</span>
					</div>
				</div>
				
				<div>
					<div style="width: 150px; display: inline-block; margin-top: 30px; border-bottom: 1px solid lightgrey;">
						<span class="text-label text-price">총 금액 : </span>
						<span class="text-label text-price">20,000 원</span>
					</div>
					
					<div style="width: 422px; display: inline-block; text-align: right;">
						<button class="ui orange button" style="width: 150px;">
							장바구니에 담기
						</button>
					</div>
				</div>
			</div>
		</div>
		
		<h3>장바구니</h3>
		<table class="ui celled table">
			<thead>
				<tr>
					<th></th>
					<th>주문제품</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="mini-button">×</div>
					</td>
					<td>
						토핑 설정 이름(default: 내맘대로 피자1), 사이즈: L, 도우: 나폴리, 엣지: 치즈 크러스트, 소스: 토마토 소스<br>
						 - 올리브(60g) 5개, 페퍼로니(8piece) 5개, 치즈(150g) 5개
					</td>
					<td>1</td>
					<td>20,000</td>
				</tr>
			</tbody>
		</table>
		
		<div class="ui container center aligned">
			<button class="ui blue button" style="width: 150px;" onclick="location.href='order.cor'">
				주문하기
			</button>
		</div>
	</div>
	<button onclick="cheese();">치즈 추가</button>
	
	
	<!-- 토핑 추가 모달 -->
	<div class="ui longer modal" id="toppingModal" style="top: 40px;">
		<div class="header">토핑 추가</div>
		<div class="content">
			<div class="ui grid">
				<div class="eight wide column">
					<h4>토핑 목록</h4>
					<table class="ui single line table" id="toppingAllList">
						<thead>
							<tr>
								<th style="width: 40%;">토핑</th>
								<th style="width: 10%;">사이즈</th>
								<th style="width: 20%;">중량(g)</th>
								<th style="width: 30%;">가격(원)</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				
				</div>
				
				
				<div class="eight wide column">
					<h4>토핑 추가</h4>
					<table class="ui single line table" id="toppingSelectList">
						<thead>
							<tr>
								<th style="width: 40%;">토핑</th>
								<th style="width: 10%;">사이즈</th>
								<th style="width: 20%;">중량(g)</th>
								<th style="width: 30%;">가격(원)</th>
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
	
	
	<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
	<script src="/pmfp/resources/customer/js/jquery.cookie-1.4.1.min.js"></script>
	<script>
		$('.ui.dropdown.no-action').dropdown({action: 'hide'});
		$('.ui.dropdown.action').dropdown();
		
		var mateMap;
		var basicMenuList;
		var toppingList;
		var sizeList;
		
		$(function(){
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
					console.log(mateMap);
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
					
					
				}, error: function(data){
					console.log("데이터 불러오기 실패");
				}
			});
		});
		
		//옵션 & 토핑 세팅 초기화
		function toppingReset(){
			$("#toppings").empty();
			$('.ui.dropdown').dropdown('restore defaults');
		}
		
		//도우, 사이즈, 소스 선택시 이미지 추가
		$('#dough').change(function(){
			if($('#dough').val() != "" && $('#doughSize').val() != "" && $('#doughImg').length == 0){
				dough();
				if($('#doughSauce').val() != ""){
					setTimeout(function(){sauce();}, 700);
				}
			}
		});
		$('#doughSize').change(function(){
			if($('#dough').val() != "" && $('#doughSize').val() != "" && $('#doughImg').length == 0){
				dough();
				if($('#doughSauce').val() != ""){
					setTimeout(function(){sauce();}, 700);
				}
			}
		});
		$('#doughSauce').change(function(){
			if($('#doughSauce').val() != "" && $('#doughImg').length > 0 && $('#doughSauceImg').length == 0){
				sauce();
			}
		});
		
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
					var toppings = [];
					
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
							toppings.push(mate);
						}
					};
					
					var pizzaSetting = {
							dough:dough,
							size: doughSize,
							sauce:sauce,
							edge:edge,
							toppings: toppings
					}
					
					console.log(pizzaSetting);
					
					$.cookie.json = true;
					$.cookie("pizzaSetting", pizzaSetting, {expires:1, path:"/"});
					
					console.log($.cookie("pizzaSetting"));
					break;
				}
			}
		}
		
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
					$tr.append($("<input type='hidden' class='materialNo' value='"+toppingList[i].materialNo+"'>"));
					$tr.append($("<td>").text(toppingList[i].materialName));
					$tr.append($("<td>").text(toppingList[i].materialSize));
					$tr.append($("<td>").text(toppingList[i].materialWeight));
					$tr.append($("<td>").text(toppingList[i].materialSellprice));
					
					$toppingAllList.append($tr);
				}
			}
		}
		
		//토핑 추가
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
			} else if($toppingSelectList.children().length >= 6) {
				alert("토핑은 최대 6개까지 선택 가능합니다.");
			}
		}
		
		//토핑 제거
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
			
		}
		
		//도우 이미지
		function dough(){
			var $dough = $("<img id='doughImg'>");
			$dough.attr("src", "resources/customer/images/order/dough.png");
			$dough.addClass("scale-down-center");
			$dough.css({"position":"absolute", "z-index":"2", "width":"420px", "height":"420px"});
			
			$("#toppings").append($dough);
		}
		
		//소스 이미지
		function sauce(){
			var $sauce = $("<img id='doughSauceImg'>");
			$sauce.attr("src", "resources/customer/images/order/tomato_sauce.png");
			$sauce.addClass("scale-up-center");
			$sauce.css({"position":"absolute", "z-index":"3", "width":"420px", "height":"420px"});
			
			$("#toppings").append($sauce);
		}
		
		//치즈 이미지
		function cheese(){
			var $cheese = $("<img id='doughCheeseImg'>");
			$cheese.attr("src", "resources/customer/images/order/cheese.png");
			$cheese.addClass("scale-up-center");
			$cheese.css({"position":"absolute", "z-index":"4", "width":"420px", "height":"420px"});
			
			$("#toppings").append($cheese);
		}
	</script>
</body>
</html>