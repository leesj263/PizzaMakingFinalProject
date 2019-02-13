<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<style>
	.col-lg-8{
		position : relative;
		left : 15%
	}
	
	#salesListBtn{
		position : relative;
		left : 68%
	}
</style>

</head>
<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>


		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">



					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4 class="mb-3">매출관리</h4>
								<canvas id="lineChart"></canvas>
							</div>
						</div>



					</div>

				</div>
				<!-- .animated -->
				<button id = "salesListBtn" onclick = "location.href = 'movePage.com?movePage=companySalesList'" type="button" class="btn btn-primary" style = "width : 150px">매출 내역</button>
			</div>
			<!-- .content -->
		</div>
	</div>
	
	
	<script>
	 //line chart
	 
	$(function(){
		var listSize = "${fn:length(list)}";
		var salesList = "${list}";
		//console.log(salesList);
		
		var splitArr = salesList.split(',');
		//console.log(typeof splitArr)
		var categoryIndex = 3;
		var plusIndex = 0;
		var minusIndex = 0;
		var splitArrPlusPrice = [];
		var splitArrMinusPrice = [];
		var splitArrPlusDate = [];
		var splitArrMinusDate = [];

		for(var i = 0; i < (listSize); i++){
			if(splitArr[categoryIndex] == " salesCateg=1"){
				splitArrPlusDate[plusIndex] = splitArr[categoryIndex-1];
				splitArrPlusPrice[plusIndex] = splitArr[categoryIndex+3];
				plusIndex++;
			}else{
				splitArrMinusPrice[minusIndex] = splitArr[categoryIndex+3];
				splitArrMinusDate[minusIndex] = splitArr[categoryIndex-1];
				minusIndex++;
			}
			categoryIndex += 7;
		}
		
		
		
		
		for(var i = 0; i < splitArrPlusPrice.length ; i++){
			splitArrPlusPrice[i] = splitArrPlusPrice[i].split('=')[1];
		}
		
		for(var i = 0; i < splitArrPlusDate.length ; i++){
			splitArrPlusDate[i] = splitArrPlusDate[i].split('=')[1];
		}
		
		for(var i = 0; i < splitArrMinusPrice.length ; i++){
			splitArrMinusPrice[i] = splitArrMinusPrice[i].split('=')[1];
		}
		
		for(var i = 0; i < splitArrMinusDate.length ; i++){
			splitArrMinusDate[i] = splitArrMinusDate[i].split('=')[1];
		}
		
	
		
		for(var i = 0; i < splitArrPlusPrice.length ; i++){
			splitArrPlusPrice[i] = splitArrPlusPrice[i].split("]")[0];
		} 
		
		for(var i = 0; i < splitArrMinusPrice.length ; i++){
			splitArrMinusPrice[i] = splitArrMinusPrice[i].split("]")[0];
		} 
		
		
		/* console.log("splitArrPlusPrice : " + splitArrPlusPrice);
		console.log("splitArrPlusDate : " + splitArrPlusDate);
		console.log("splitArrMinusPrice : " + splitArrMinusPrice);
		console.log("splitArrMinusDate : " + splitArrMinusDate); */
		
		var basicDate = splitArrPlusDate;
		splitArrPlusDate.sort();
		var FirstSortDate = splitArrPlusDate[0];
		var arrSize = splitArrPlusDate.length;
		var LastSortDate = splitArrPlusDate[arrSize-1];
		splitArrPlusDate = basicDate;
		
		
		var basicDate2 = splitArrMinusDate;
		splitArrMinusDate.sort();
		var FirstSortDate2 = splitArrMinusDate[0];
		var arrSize2 = splitArrMinusDate.length;
		var LastSortDate2 = splitArrMinusDate[arrSize-1];
		splitArrMinusDate = basicDate2;
		
		var firstDate;
		var lastDate;
		
		if(FirstSortDate > FirstSortDate2){
			firstDate=FirstSortDate2;
		}else{
			firstDate=FirstSortDate;
		}
		
		if(LastSortDate > LastSortDate2){
			lastDate=LastSortDate;
		}else{
			lastDate=LastSortDate2;
		}
		/* console.log("FirstSortDate : " + FirstSortDate);
		console.log("FirstSortDate2 : " + FirstSortDate2);
		
		console.log("splitArrPlusDate : " + splitArrPlusDate);
		console.log("splitArrMinusDate : " + splitArrMinusDate);
		console.log("firstDate : " + firstDate);
		console.log("lastDate : " + lastDate) */
		
		var daily = [];
		var indexDate = firstDate.substring(0, 7);
		console.log("indexDate : " + indexDate);
		var intDate = parseInt(firstDate.substring(8, 10));
		console.log("intDate : " + intDate);
		var lastDateIndex = parseInt(lastDate.substring(8, 10));
		console.log("lastDateIndex : " + lastDateIndex);
		var k = 0;
		while(true){
			if(intDate != lastDateIndex){
				daily[k] = indexDate + "-" + intDate;
				intDate++;
				k++;
			}else{
				daily[k] = indexDate + "-" +lastDateIndex;
				break;
			}
		}
		console.log("daily : " + daily);
		
		
		var ctx = document.getElementById( "lineChart" );
	    ctx.height = 150;
	    var myChart = new Chart( ctx, {
	        type: 'line',
	        data: {
	            labels: daily,
	            datasets: [
	                {
	                    label: "지출",
	                    borderColor: "rgba(0,0,0,.09)",
	                    borderWidth: "1",
	                    backgroundColor: "rgba(0,0,0,.07)",
	                    data: splitArrMinusPrice
	                            },
	                {
	                    label: "수입",
	                    borderColor: "rgba(0, 123, 255, 0.9)",
	                    borderWidth: "1",
	                    backgroundColor: "rgba(0, 123, 255, 0.5)",
	                    pointHighlightStroke: "rgba(26,179,148,1)",
	                    data: splitArrPlusPrice
	                            }
	                        ]
	        },
	        options: {
	            responsive: true,
	            tooltips: {
	                mode: 'index',
	                intersect: false
	            },
	            hover: {
	                mode: 'nearest',
	                intersect: true
	            }

	        }
	    } );
		
	});
    

	</script>
	<script
		src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<%-- <script
		src="${contextPath }/resources/companyCss/assets/js/init-scripts/chart-js/chartjs-init2.js?after"></script> --%>
</body>
</html>