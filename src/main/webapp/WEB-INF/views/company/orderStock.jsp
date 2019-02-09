<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<style>
.card text-white bg-flat-color-1 {
	position: relative;
	left: -10%
}
</style>

<script>
	tableId = 1;
	allPrice = 0;
</script>

</head>

<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>


		<div class="content mt-3">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="col-lg-3">토핑선택</h4>


							<br>
							<div class="col-lg-3">
								<select id = "materialSelect"  style= "width : 150px; height : 30px; border-radius : 5px">
									<c:forEach items = "${list}" var = "value" varStatus = "status">
										<option value = "${ value.materialNo }" weight = "${ value.materialWeight }" sellPrice = "${ value.materialSellPrice }">${ value.materialName }</option>
									</c:forEach>
	                            </select>
							</div>
							

							<br> <br> <br>


							<h4 class="col-lg-3">중량선택</h4>


							<br>

							<div class="col-lg-3">
								<select id = "materialWeight" style= "width : 150px; height : 30px; border-radius : 5px">
                                       	<option value = "1">1kg</option>
                                       	<option value = "3">3kg</option>
                                       	<option value = "5">5kg</option>
                                       	<option value = "7">7kg</option>
                                       	<option value = "10">10kg</option>
                                       	<option value = "15">15kg</option>
                                       	<option value = "20">20kg</option>
	                            </select>
							</div>



							<br> <br> <br> <br>
							<div class="col-lg-3">
								<button type="button" class="btn btn-secondary" onclick = "addOrderMaterial()">
									<i class="fa fa-shopping-cart"></i>&nbsp; 추가하기
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /# column -->







				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">선택 품목</strong>
						</div>
						<div class="card-body">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">#</th>
										<th scope="col">토핑</th>
										<th scope="col">중량</th>
										<th scope="col">가격</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody id = "orderStockTable">
									<!-- 신청 재료 리스트 삽입 공간  -->
								</tbody>
							</table>

						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h4 class="col-lg-3" style = "font-size : 1.2em">총금액 : <div style = "color : red; display : inline; font-size : 1.2em" id = "allPricePlace"></div></h4>
				<hr>
					<div align = "right">
					<button onclick = "applyStock()" type="button" class="btn btn-primary" style = "width : 150px">신청</button>
					<button onclick = "location.href = 'movePage.com?movePage=companyStock'" type="button" class="btn btn-secondary" style = "width : 150px">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /# column -->

	</div>



	</div>
	
	<script>
	function addOrderMaterial(){
		console.log($("#materialSelect").val());
		var materialSelect = $("#materialSelect").val();
		console.log($("#materialWeight").val());
		var materialSelectWeight = $("#materialWeight").val();
		console.log($("#materialSelect option:selected").text());
		var materialName = $("#materialSelect option:selected").text();
		
		console.log("weight : " +$("#materialSelect option:selected").attr("weight"));
		var materialWeight = $("#materialSelect option:selected").attr("weight");
		console.log("sellPrice : " + $("#materialSelect option:selected").attr("sellPrice"));
		var materialSellPrice = $("#materialSelect option:selected").attr("sellPrice");
		
		var gramPrice = Math.round(materialSellPrice/ materialWeight);
		console.log(gramPrice);
		
		var materialPrice = gramPrice * (materialSelectWeight*1000);
		
		
		$("#orderStockTable").append("<tr id = " + materialSelect + "><th scope='row'>" + tableId + 
				"</th><td>"+ materialName+ "</td><td>" + materialSelectWeight + "kg</td><td>" + materialPrice +
				"</td><td><button type='button' class='btn btn-secondary btn-sm' onclick = 'removeOrderStockTr(this)'>-</button></td></tr>");
		
		tableId++;
		allPrice += parseInt(materialPrice);
		
		$("#allPricePlace").text("");
		$("#allPricePlace").append(allPrice);
	}
	
	function removeOrderStockTr(tr){
		//$(tr).remove();
		$(tr).parent().parent().remove();
	}
	
	function applyStock(){
		//$("#orderStockTable").children("tr").eq(1).css("background" , "black");
		var trLength = $("#orderStockTable").children("tr").length;
		//console.log($("#orderStockTable").children("tr").length);
		
		/* var objects = new Array();
		for(var i = 0; i < trLength ; i++){
			var object = new Object();
			
			object.comNo = 2;
			//임시로 넣어둔 회사번호
			object.materialNo = $("#orderStockTable").children("tr").eq(i).attr("id");
			object.materialName =$("#orderStockTable").children("tr").eq(i).text();
			object.materialWeight =$("#orderStockTable").children("tr").eq(i).text();
			object.materialPrice =$("#orderStockTable").children("tr").eq(i).text();
			
			objects.push(object);
		}
		console.log(objects); */
		 
			var arr = new Array();
			for(var i = 0; i < trLength ; i++){
				var data = "";
				
				data += 2 ;
				data += ",";
				//임시로 넣어둔 회사번호
				data += $("#orderStockTable").children("tr").eq(i).attr("id");
				data += ",";
				data += $("#orderStockTable").children("tr").eq(i).children("td").eq(0).text();
				data += ",";
				data += $("#orderStockTable").children("tr").eq(i).children("td").eq(1).text();
				data += ",";
				data += $("#orderStockTable").children("tr").eq(i).children("td").eq(2).text();
				arr.push(data);
		}
			
		console.log("data : " + data);
		console.log("arr : " + arr);
			
		$.ajax({
			url : "applyStock.com",
			data : {arr : arr},
			type : "get",
			traditional : true,
			success : function(data){
				console.log(data);
				location.href = "movePage.com?movePage=companyStock";
			},
			error : function(data){
				console.log(data);
			}
			
		});
	}
</script>

	<script
		src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<script src="${contextPath }/resources/companyCss/assets/js/widgets.js"></script>
</body>
</html>