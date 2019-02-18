<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<style>
.stockBtn {
	position: relative;
	left: 64%;
}
</style>
<script>
mater = [];
</script>
</head>

<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>
		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">




					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="mb-3">남은 재고량</h4>
								<canvas id="remainStockChart"></canvas>
							</div>
						</div>
					</div>
					<!-- /# column -->

					<%-- <div class="col-lg-6">
						<div class="card">
							<div class="card-body">
								<h4 class="mb-3">소모량</h4>
								<canvas id="consumptionChart"></canvas>
							</div>
						</div>
					</div>
					<!-- /# column -->
 --%>


				</div>
				<div class="stockBtn">
					<button onclick="location.href = 'selectReceiptList.com?comNo=${sessionScope.loginUser.comNo }'"
						type="button" class="btn btn-secondary">
						<i class="fa fa-won"></i>&nbsp; 요금 명세서
					</button>
					<button onclick="location.href = 'orderStrok.com'" type="button"
						class="btn btn-secondary">
						<i class="fa fa-truck"></i>&nbsp; 재고 주문
					</button>
					<button onclick="location.href = 'selectOrderStockList.com?comNo=${sessionScope.loginUser.comNo }'"
						type="button" class="btn btn-secondary">
						<i class="fa fa-archive"></i>&nbsp; 재고 주문내역
					</button>
				</div>
			</div>

		</div>
		


	</div>


	<script>
	 // single bar chart
	$(function(){
		var listSize = "${fn:length(list)}";
		//console.log(listSize);
		var labelDataArr;
		labelDataArr = '${list}';
		/* for(var i = 0; i< listSize; i++){
			labelDataArr[i] = "<c:out value='${list[i].materialName}'/>";
		} */
		//console.log(typeof labelDataArr);
		//console.log(labelDataArr);
		var splitArr = labelDataArr.split(',');
		//console.log(typeof splitArr)
		var arrIndex = 4;
		var splitArr2 = [];
		for(var i = 0; i < (listSize/2); i++){
			//console.log(splitArr[arrIndex]);
			splitArr2[i] = splitArr[arrIndex];
			arrIndex = arrIndex + 10;
		} 
		
		//var mater = splitArr2[0].split('=')[1];

		for(var i = 0; i < splitArr2.length ; i++){
			mater[i] = splitArr2[i].split('=')[1];
		}
		
		for(var i = 0; i < splitArr2.length ; i++){
			mater[i] = mater[i].split("]")[0];
		}
		//console.log(mater);
		
		
		var arrIndex2 = 3;
		var splitWeight2 = [];
		for(var i = 0; i < (listSize/2); i++){
			//console.log(splitArr[arrIndex]);
			splitWeight2[i] = splitArr[arrIndex2];
			arrIndex2 = arrIndex2 + 10;
		} 

		var weightList = [];
		for(var i = 0; i < splitWeight2.length ; i++){
			weightList[i] = splitWeight2[i].split('=')[1];
		}
		console.log(weightList);
		
		/* for(var i = 0; i < splitWeight2.length ; i++){
			mater[i] = mater[i].split("]")[0];
		} */
		
		
		
		
		
		
		
		
		
		
		
		var ctx = document.getElementById( "remainStockChart" );
	    ctx.height = 150;
	    console.log(mater);
	    var myChart = new Chart( ctx, {
	        type: 'bar',
	        data: {
	            labels: mater,
	            datasets: [
	                {
	                    label: "남아있는 재고 개수",
	                    data: weightList,
	                    borderColor: "rgba(0, 123, 255, 0.9)",
	                    borderWidth: "0",
	                    backgroundColor: "rgba(0, 123, 255, 0.5)"
	                            }
	                        ]
	        },
	        options: {
	            scales: {
	                yAxes: [ {
	                    ticks: {
	                        beginAtZero: true
	                    }
	                                } ]
	            }
	        }
	    } );
		
	});
	
		
    

    // single bar chart
   /*  var ctx2 = document.getElementById( "consumptionChart" );
    ctx2.height = 150;
    var myChart = new Chart( ctx2, {
        type: 'bar',
        data: {
            labels: [ "Sun", "Mon", "Tu", "Wed", "Th", "Fri", "Sat" ],
            datasets: [
                {
                    label: "소모된 재고 개수",
                    data: [ 40, 55, 75, 81, 56, 55, 40 ],
                    borderColor: "rgba(0, 123, 255, 0.9)",
                    borderWidth: "0",
                    backgroundColor: "rgba(0, 123, 255, 0.5)"
                            }
                        ]
        },
        options: {
            scales: {
                yAxes: [ {
                    ticks: {
                        beginAtZero: true
                    }
                                } ]
            }
        }
    } ); */
	</script>


	<script
		src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js?ver=1"></script>
	<%-- <script
		src="${contextPath }/resources/companyCss/assets/js/init-scripts/chart-js/chartjs-init.js?ver=1"></script> --%>



</body>
</html>