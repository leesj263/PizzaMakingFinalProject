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
	.col-lg-10{
		position : relative;
		left : 7%
	}
	
	#salesListBtn{
		position : relative;
		left : 72%
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



					<div class="col-lg-10">
						<div class="card">
							<div class="card-body">
								<h4 class="mb-3" style= "display : inline;">매출관리</h4>
								<select id = "switchSales" style= "float : right; width : 150px; height : 30px; border-radius : 5px">
                                       	<option value = "day" selected onclick = "day()">일별</option>
                                       	<option value = "month" onclick = "month()">월별</option>
                                       	<option value = "year" onclick = "year()">연도별</option>
	                            </select>
								<canvas id="lineChart"></canvas>
							</div>
						</div>



					</div>

				</div>
				<!-- .animated -->
				<button id = "salesListBtn" onclick = "location.href='selectCompanySalesList.com?comNo=${sessionScope.loginUser.comNo }'" type="button" class="btn btn-primary" style = "width : 150px">매출 내역</button>
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
		
		console.log("splitArrPlusPrice : " + splitArrPlusPrice);
		console.log("splitArrPlusDate : " + splitArrPlusDate);
		console.log("splitArrMinusPrice : " + splitArrMinusPrice);
		console.log("splitArrMinusDate : " + splitArrMinusDate);
		
		
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
		
		
	 	console.log("splitArrPlusPrice : " + splitArrPlusPrice);
		console.log("splitArrPlusDate : " + splitArrPlusDate);
		console.log("splitArrMinusPrice : " + splitArrMinusPrice);
		console.log("splitArrMinusDate : " + splitArrMinusDate);
		
		
		
		

		var basicDate = [];
		basicDate = JSON.parse(JSON.stringify(splitArrPlusDate));
		splitArrPlusDate.sort();
		var FirstSortDate = splitArrPlusDate[0];
		var arrSize = splitArrPlusDate.length;
		var LastSortDate = splitArrPlusDate[arrSize-1];
		splitArrPlusDate = basicDate;
		
		
		var basicDate2 = [];
		basicDate2 =JSON.parse(JSON.stringify(splitArrMinusDate));
		splitArrMinusDate.sort();
		var FirstSortDate2 = splitArrMinusDate[0];
		var arrSize2 = splitArrMinusDate.length;
		var LastSortDate2 = splitArrMinusDate[arrSize2-1];
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
		
	
		
		var daily = [];
		var yearDate = parseInt(firstDate.substring(0, 4));
		var monthDateStart = parseInt(firstDate.substring(5, 7));
		var monthDateFinish = parseInt(lastDate.substring(5, 7));
		var dayDateStart = parseInt(firstDate.substring(8, 10));
		var dayDateFinish = parseInt(lastDate.substring(8, 10));
		var k = 0;
		
		console.log("monthDateStart : " + monthDateStart);
		console.log("monthDateFinish : " + monthDateFinish);
		console.log("dayDateStart : " + dayDateStart);
		console.log("dayDateFinish : " + dayDateFinish);
		
		var monthLastDay = ( new Date( 2019, monthDateStart, 0) ).getDate();
		console.log("monthLastDay : " + monthLastDay);
		
		while(true){
			if(monthDateStart != monthDateFinish){
				while(true){
					var monthLastDay = ( new Date( 2019, monthDateStart, 0) ).getDate();
					daily[k] = yearDate + "-" + monthDateStart + "-" + dayDateStart;
					dayDateStart++;
					k++;
					if(dayDateStart == (monthLastDay+1)){
						dayDateStart = 1;
						break;
					}
				}
			}
			
			
			if(monthDateStart == monthDateFinish){
				for(var i = 0; i < dayDateFinish ; i++){
					if(dayDateStart == (dayDateFinish+1)){
						break;
					}else{
						daily[k] = yearDate + "-" + monthDateStart + "-" + dayDateStart;
						dayDateStart++;
						k++;
					}
				}
				break;
			} 
			monthDateStart++;
		}
		
		console.log("daily : " + daily);

		console.log("splitArrPlusPrice : " + splitArrPlusPrice);
		console.log("splitArrMinusPrice : " + splitArrMinusPrice);
		
		var dailyPrice = [];
		var fixPlusDate = [];
		var fixMinusDate = [];
		var fixPlusPrice = [];
		var fixMinusPrice = [];
		
		for(var i = 0; i < daily.length ; i++){
			fixPlusPrice[i] = 0;
			fixMinusPrice[i] = 0;
		}
		
		
		for(var i = 0; i< basicDate.length ; i++){
			fixPlusDate[i] = basicDate[i].substring(0,4) + "-" + parseInt(basicDate[i].substring(5,7)) + "-" + parseInt(basicDate[i].substring(8,10));
		}
		
		for(var i = 0; i< basicDate2.length ; i++){
			fixMinusDate[i] = basicDate2[i].substring(0,4) + "-" + parseInt(basicDate2[i].substring(5,7)) + "-" + parseInt(basicDate2[i].substring(8,10));
		}
		
		
		
		for(var i = 0; i < daily.length ; i++){
			for(var j = 0; j < fixPlusDate.length; j++){
				if(daily[i] == fixPlusDate[j]){
					fixPlusPrice[i] += parseInt(splitArrPlusPrice[j]);
				}else{
					fixPlusPrice[i] += 0;
				}
			}
			
			for(var j = 0; j < fixMinusDate.length; j++){
				if(daily[i] == fixMinusDate[j]){
					fixMinusPrice[i] += parseInt(splitArrMinusPrice[j]);
				}else{
					fixMinusPrice[i] += 0;
				}
			}
		}
		
		
		console.log("fixPlusDate : " + fixPlusDate);
		console.log("fixMinusDate : " + fixMinusDate);
		
		
		console.log("fixPlusPrice : " + fixPlusPrice);
		console.log("fixMinusPrice : " + fixMinusPrice);
		
		
		
		
		
		
		
		
		
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
		                    data: fixMinusPrice
		                            },
		                {
		                    label: "수입",
		                    borderColor: "rgba(0, 123, 255, 0.9)",
		                    borderWidth: "1",
		                    backgroundColor: "rgba(0, 123, 255, 0.5)",
		                    pointHighlightStroke: "rgba(26,179,148,1)",
		                    data: fixPlusPrice
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
		
		

		   
		
		
		$("#switchSales").change(function(){
			$("#lineChart").remove();
			$("#switchSales").after("<canvas id='lineChart'></canvas>");

			
			
		    var selectVal =  $(this).val();
		    console.log("selectVal : " + selectVal);
		    var k = 0;
		    var changeDay = [];
		    var changeMinusPrice = [0];
		    var changePlusPrice = [0];
		    
		    if(selectVal == "day"){
		    	changeDay = daily;
		    	changeMinusPrice = fixMinusPrice;
		    	changePlusPrice = fixPlusPrice;
		    }
		    
		    
		    if(selectVal == "month"){
		    	console.log("daily : " + daily);
		    	console.log("daily.length : " + daily.length);
		    	console.log("daily[0].split('-')[1] : " + daily[0].split('-')[1]);
		    	
		    	for(var i = 0; i < daily.length ; i++){
		    		if(daily[i].split('-')[1] == daily[i+1].split('-')[1]){
		    			changeDay[k] = daily[i].split('-')[0] + "-" + daily[i].split('-')[1];
		    			changeMinusPrice[k] += parseInt(fixMinusPrice[i]);
		    			changePlusPrice[k] += parseInt(fixPlusPrice[i]);
		    			if((i+2) == daily.length){
		    				changeMinusPrice[k] += parseInt(fixMinusPrice[i+1]);
			    			changePlusPrice[k] += parseInt(fixPlusPrice[i+1]);
		    				break;
		    			}
		    		}else{
		    			changeDay[k] = daily[i].split('-')[0] + "-" + daily[i].split('-')[1];
		    			changeMinusPrice[k] += parseInt(fixMinusPrice[i]);
		    			changePlusPrice[k] += parseInt(fixPlusPrice[i]);
		    			k++;
		    			changeMinusPrice[k] = 0;
		    			changePlusPrice[k] = 0;
		    		}
		    	}
		    	console.log("changeDay : " + changeDay);
		    	console.log("changeMinusPrice : " + changeMinusPrice);
		    	console.log("changePlusPrice : " + changePlusPrice);

		    	
		    }
		    
		    if(selectVal == "year"){
		    	for(var i = 0; i < daily.length ; i++){
		    		if(daily[i].split('-')[0] == daily[i+1].split('-')[0]){
		    			changeDay[k] = daily[i].split('-')[0];
		    			changeMinusPrice[k] += parseInt(fixMinusPrice[i]);
		    			changePlusPrice[k] += parseInt(fixPlusPrice[i]);
		    			if((i+2) == daily.length){
		    				changeMinusPrice[k] += parseInt(fixMinusPrice[i+1]);
			    			changePlusPrice[k] += parseInt(fixPlusPrice[i+1]);
		    				break;
		    			}
		    		}else{
		    			changeDay[k] = daily[i].split('-')[0] + "-" + daily[i].split('-')[1];
		    			changeMinusPrice[k] += parseInt(fixMinusPrice[i]);
		    			changePlusPrice[k] += parseInt(fixPlusPrice[i]);
		    			k++;
		    			changeMinusPrice[k] = 0;
		    			changePlusPrice[k] = 0;
		    		}
		    	}
		    }
		    
		    ctx = document.getElementById( "lineChart" );
		    ctx.height = 150;
		    myChart = new Chart( ctx, {
		        type: 'line',
		        data: {
		            labels: changeDay,
		            datasets: [
		                {
		                    label: "지출",
		                    borderColor: "rgba(0,0,0,.09)",
		                    borderWidth: "1",
		                    backgroundColor: "rgba(0,0,0,.07)",
		                    data: changeMinusPrice
		                            },
		                {
		                    label: "수입",
		                    borderColor: "rgba(0, 123, 255, 0.9)",
		                    borderWidth: "1",
		                    backgroundColor: "rgba(0, 123, 255, 0.5)",
		                    pointHighlightStroke: "rgba(26,179,148,1)",
		                    data: changePlusPrice
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
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		});//select변동시 동작하는 함수
		
		
		
		
	});//시작시 동작하는 스크립트부분
    
	 
	 
	


	</script>
	
		
	<script
		src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<%-- <script
		src="${contextPath }/resources/companyCss/assets/js/init-scripts/chart-js/chartjs-init2.js?after"></script> --%>
</body>
</html>