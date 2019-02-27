<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="common/header.jsp"/>
<style>
	table{
		text-align:center;
	}
	thead{
		border-top: 2px solid #dee2e6;
	}
</style>

<section>
	<div class="right-panel">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-8">
						<table class="table">
							<thead>
								<tr>
									<th>주문현황</th>
									<th>주문횟수</th>
									<th>주문금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<c:set var="date" value="<%=new java.util.Date() %>"/>
										<fmt:formatDate value="${date}" type="date" pattern="yyyy-MM-dd hh:mm"/> 현재
									</td>
									<td>${fn:length(salesList)}</td>
									<td id="totalPrice"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-8">
						<button class="btn btn-sm btn-warning" onclick="location.href='statistics.ad'"disabled>시간별 매출</button>
						<button class="btn btn-sm btn-info" onclick="location.href='statistics.ad'">전체 매출 보기</button>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-10">
						<div class="card">
							<div class="card-body">
								<h4 class="mb-3" id="chartBefore"></h4>
								<canvas id="sales-chart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	function format(date) {
		var d=new Date(date), 
		month= (d.getMonth() + 1), 
		day=d.getDate(), 
		year=d.getFullYear(),
		hour=d.getHours();
		if (month<10) month="0"+month;
		if (day<10) day='0'+day;
		if(hour<10) hour='0'+hour;
		
		return year+'-'+month+'-'+day+' '+hour;
	}
	
	(function($) {

		var salesListsize = "${fn:length(salesList)}";
		var salesList = "${salesList}".toString();
		//console.log(salesListsize);
		//console.log(salesList);
		if(salesListsize==0){
			salesList="[AdminSales [salesNo=39, comNo=4, comName=왕십리, salesInputDate=2019-02-28, salesDate=2019-02-28 23:59:28, salesCate=1, expenseNo=0, orderNo=32, salesPrice=0]]";
		}
		var salesPriceArr = [];
		var salesDateArr = [];

		salesList = salesList.substring(1, salesList.lastIndexOf("]"));
		var salesArr = salesList.split('AdminSales');
		salesArr.splice(0, 1);
		//console.log(salesArr);

		var salesArrList1 = new Array(salesListsize);
		var salesArrList = new Array(salesListsize);

		//이차원 배열로 List 잘라내기
		for (var i = 0; i < salesListsize; i++) {
			salesArr[i] = salesArr[i].split(']');
			salesArrList1[i] = salesArr[i][0].split(' [')[1];
			salesArrList[i] = salesArrList1[i].toString().split(', ');
		}

		console.log(salesArrList.length); 

		if(salesArrList.length>0){
			for (var i = 0; i < salesArrList.length; i++) {
				salesDateArr[i] = salesArrList[i][4].split('=')[1];
				salesPriceArr[i] = salesArrList[i][8].split('=')[1];
			}
		}

		console.log(salesDateArr);
		console.log(salesPriceArr);

		//데이터 테이블 시작일 선택하기 
		var basicDate = [];
		basicDate = JSON.parse(JSON.stringify(salesDateArr));
		salesDateArr.sort();
		var FirstSortDate = salesDateArr[0];
		var LastSortDate = salesDateArr[salesListsize - 1];
		salesDateArr = basicDate;

		var firstDate=new Date(FirstSortDate);
		var lastDate=new Date(LastSortDate);

		//console.log(lastDate);
		//console.log(firstDate);

		//x축 List 구하기
		var dayList = [];
		var monthList=[];
		var yearList=[];
		var times=0;
		var startDate = new Date(FirstSortDate);
		startDate.setHours(0);
		var endDate = new Date(LastSortDate);
		if(salesListsize==0){
			startDate=new Date();
			startDate.setHours(0);
			endDate=new Date();
			endDate.setHours(24);
		}
		endDate.setHours(23);
		var lineDate=new Date(startDate);
		
		//console.log(startDate);
		//console.log(endDate);
		//console.log(lineDate);
		
		var salesList=[];
		
		while(format(lineDate)!=format(endDate)){
			dayList[times]=format(lineDate).substring(5)+"시";
			salesList[times]=0;
			
			for(var i=0;i<salesDateArr.length;i++){	
				if(salesDateArr[i].substring(0,13)==format(lineDate)){
					salesList[times]+=Number(salesPriceArr[i]);
				}
			}
			times++;
			lineDate.setHours((lineDate.getHours()+1));
		}
		
		dayList[times]=format(endDate).substring(5)+"시";
		salesList[times]=0;
		
		for(var i=0;i<salesDateArr.length;i++){	
			if(salesDateArr[i].substring(0,13)==format(lineDate)){
				salesList[times]+=Number(salesPriceArr[i]);
			}
		}
		
		console.log(dayList);
		console.log(salesList);
		var total=0;
		for(var i=0;i<salesPriceArr.length;i++){
			total+=Number(salesPriceArr[i]);
		}
		
		$("#totalPrice").text(total);

		var ctx = $("#sales-chart");
		ctx.height=150;
		var myChart=new Chart(ctx, {
			type : 'line',
			data : {
				labels : dayList,
				type : 'line',
				defaultFontFamily : 'Montserrat',
				datasets : [ {
					label : "고객 주문",
					data : salesList, 
					backgroundColor : 'transparent',
					borderColor : '#FFBA32',
					borderWidth : 3,
					pointStyle : 'circle',
					pointRadius : 5,
					pointBorderColor : 'transparent',
					pointBackgroundColor : '#FFBA32',
				} ]
			},
			options : {
				responsive : true,
				tooltips : {
					mode : 'index',
					titleFontSize : 12,
					titleFontColor : '#000',
					bodyFontColor : '#000',
					backgroundColor : '#fff',
					titleFontFamily : 'Montserrat',
					bodyFontFamily : 'Montserrat',
					cornerRadius : 3,
					intersect : false,
				},
				legend : {
					display : false,
					labels : {
						usePointStyle : true,
						fontFamily : 'Montserrat',
					},
				},
				scales : {
					xAxes : [ {
						display : true,
						gridLines : {
							display : true,
							drawBorder : true
						},
						scaleLabel : {
							display : true,
							labelString : 'Time'
						}
					} ],
					yAxes : [ {
						display : true,
						gridLines : {
							display : true,
							drawBorder : true
						},
						scaleLabel : {
							display : true,
							labelString : 'Price'
						}
					} ]
				},
				title : {
					display : false,
					text : 'Normal Legend'
				}
			}
		});
		
	})(jQuery);
</script>
<jsp:include page="common/footer.jsp"/>
