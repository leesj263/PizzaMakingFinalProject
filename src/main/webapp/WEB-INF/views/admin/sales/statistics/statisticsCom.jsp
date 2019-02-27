 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="comSize" value="${sellerList.size()}"/>
<%
int comSize=(Integer)pageContext.getAttribute("comSize"); 
%>
<jsp:include page="../../common/header.jsp" />
<style>
#timeSelect {
	float: right;
	border: 3px solid #F7D358;
	border-radius: 5px;
}
#comSelect{
	float: left;
	border: 3px solid #F7D358;
	border-radius: 5px;
}
div.modal-body{
	padding:20px 75px;
}
#comNoList{
	width:150px;
}
</style>
<section>
	<div class="right-panel">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-8">
						<button class="btn btn-sm btn-outline-warning" onclick="location.href='statistics.ad'">전체매출</button>
						&nbsp;&nbsp;
						<button class="btn btn-sm btn-primary" onclick="location.href='statisitcsCom.ad?comNo=1'" disabled>업체매출</button>
						&nbsp;&nbsp;
						<button class="btn btn-sm btn-outline-danger" onclick="location.href='statisticsMat.ad?mCate=1'">토핑매출</button>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-8">
									<button id="comSelect" class="btn btn-sm btn-outline-warning" value="${selectSeller.comNo}" type="button" data-toggle="modal" data-target="#smallmodal">
										<c:choose><c:when test="${selectSeller.comNo>0 }">${selectSeller.comName }점</c:when><c:when test="${selectComNo==0 }">전체</c:when></c:choose>
									</button>
								</div>
								<div class="col-md-4">
									<select id="timeSelect" class="form-class">
										<option value="yearly" onclick="yearly()">연간 매출</option>
										<option value="monthly" onclick="monthly()">월간 매출</option>
										<option value="daily" onclick="daily()" selected>일간 매출</option>
									</select>
								</div>
							</div>
							<h4 class="mb-3" id="chartBefore"></h4>
							<canvas id="sales-chart"></canvas>
							<h4 class="mb-3" id="chartExpense"></h4>
							<canvas id="line-chart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="smallmodal" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="smallmodalLabel">업체 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<select id="comNoList" name="comNoList" size="8">
						<option value="0" <c:if test="${selectComNo==0 }">selected</c:if>>전체</option>
						<c:forEach var="seller" items="${sellerList }">
							<option value="${seller.comNo }" <c:if test="${seller.comNo==selectComNo}">selected</c:if>>${seller.comName }점</option>
						</c:forEach>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-warning" onclick="goComStat()">선택</button>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

	function format(date) {
		var d = new Date(date), 
		month =  (d.getMonth() + 1), 
		day =  d.getDate(), 
		year = d.getFullYear();
		if (month<10) month="0"+month;
		if (day<10) day='0'+day;
		
		return year+'-'+month+'-'+day;
	}
	
	function formatM(date) {
		var d = new Date(date), 
		month =  (d.getMonth() + 1), 
		year = d.getFullYear();
		if (month<10) month="0"+month;
		
		return year+'-'+month;
	}
	
	function formatY(date) {
		var d = new Date(date);
		year = d.getFullYear();
		
		return year;
	}
	
	function getRandomColor(){
		var letters = '0123456789ABCDEF'.split('');
		var color = '#';
		for (var i = 0; i < 6; i++) {
			color += letters[Math.floor(Math.random() * 16)];
		}
		return color;
	}
	$("#comSelect").change(function(){
		var selectVal =  $(this).val();
		console.log("selectVal : " + selectVal);
	});
	
	function goComStat(){
		var comNo=$("select[name='comNoList']").val();
		console.log(comNo);
		location.href='statisitcsCom.ad?comNo='+comNo;
	}
	
	(function($) {
		
		if(${selectComNo==0}){
			
			if(${salesList.size()==0} && ${expenseList.size()==0}){
				alert("매출 내역이 없습니다. 이전 통계로 돌아갑니다.");
				history.back();
			}else{
				if(${salesList.size()>0}){				
					var salesListsize = "${fn:length(salesList)}";
					var salesList = "${salesList}".toString();
				}else{
					var salesListsize = 1;
					var salesList = "[AdminSales [salesNo=0, comNo=0, comName=null, salesInputDate=2019-02-21, salesDate=2019-02-21, salesCate=1, expenseNo=0, orderNo=0, salesPrice=0]]";
				}
				if(${expenseList.size()>0}){				
					var expenseListsize = "${fn:length(expenseList)}";
					var expenseList = "${expenseList}".toString();
				}else{
					var expenseListsize = 1;
					var expenseList = "[AdminSales [salesNo=0, comNo=0, comName=null, salesInputDate=2019-02-21, salesDate=2019-02-21, salesCate=0, expenseNo=0, orderNo=0, salesPrice=0]]";
				}
				
				var sellerListsize="${fn:length(sellerList)}";
				//console.log(salesListsize+"/"+expenseListsize);
				//console.log(salesList);
				//console.log(sellerListsize);
				
				var salesPriceArr=[];
				var salesDateArr=[];
				var salesComArr=[];
				var expensePriceArr=[];
				var expenseDateArr=[];
				var expenseComArr=[];
				
				var comNameArr=[];
				var sellerList="${sellerList}";
				salesList = salesList.substring(1, salesList.lastIndexOf("]"));
				var salesArr = salesList.split('AdminSales');
				salesArr.splice(0, 1);
				expenseList = expenseList.substring(1, expenseList.lastIndexOf("]"));
				var expenseArr = expenseList.split('AdminSales');
				expenseArr.splice(0, 1);
				sellerList=sellerList.substring(1, sellerList.lastIndexOf("]"));
				var sellerArr=sellerList.split('AdminSeller');
				sellerArr.splice(0,1);
			
				var sellerArrList=new Array(sellerListsize);
				var sellerArrList1=new Array(sellerListsize);
				for (var i = 0; i < sellerListsize; i++) {
					sellerArr[i]=sellerArr[i].split(']');
					sellerArrList1[i]=sellerArr[i][0].split(' [')[1];
					sellerArrList[i]=sellerArrList1[i].toString().split(', ');
					comNameArr[i]=sellerArrList[i][10].split('=')[1];
				}
				
				//console.log(salesArr);
				//console.log(expenseArr);
				
				var salesArrList1=new Array(salesListsize);
				var salesArrList=new Array(salesListsize);
		
				var expenseList1=new Array(expenseListsize);
				var expenseList=new Array(expenseListsize);
		
				//이차원 배열로 List 잘라내기
				for (var i = 0; i < salesListsize; i++) {
					salesArr[i]=salesArr[i].split(']');
					salesArrList1[i]=salesArr[i][0].split(' [')[1];
					salesArrList[i]=salesArrList1[i].toString().split(', ');
				}
		
				for (var i = 0; i < expenseListsize; i++) {
					expenseArr[i]=expenseArr[i].split(']');
					expenseList1[i]=expenseArr[i][0].split(' [')[1];
					expenseList[i]=expenseList1[i].toString().split(', ');
				}
		
				//console.log("ArrList")
				console.log(salesArrList); 
				console.log(expenseList); 
				
				for (var i = 0; i < salesArrList.length; i++) {
					if(salesArrList[i][3]==null){
						salesDateArr[i]=[format(new Date())];
						salesPriceArr[i]=[0];
						salesComArr[i]=[0];
					}
					else{
						salesDateArr[i]=salesArrList[i][3].split('=')[1];
						salesPriceArr[i]=salesArrList[i][8].split('=')[1];
						salesComArr[i]=salesArrList[i][1].split('=')[1];
					}
				}
		
				//console.log("salesExpenseList");
				
				//console.log(salesDateArr);
				//console.log(salesPriceArr);
				//console.log(salesComArr);
				
				for (var i = 0; i < expenseList.length; i++) {
					if(expenseList[i][3]==null){
						expenseDateArr[i]=[format(new Date())];
						expensePriceArr[i]=[0];
						expenseComArr[i]=[0];
					}
					else{
						expenseDateArr[i] = expenseList[i][3].split('=')[1];
						expensePriceArr[i] = expenseList[i][8].split('=')[1];
						expenseComArr[i] = expenseList[i][1].split('=')[1];
					}
				}
				
				//console.log(expenseDateArr);
				//console.log(expensePriceArr);
				//console.log(expenseComArr);
		
				//데이터 테이블 시작일 선택하기 
				var basicDate = [];
				basicDate = JSON.parse(JSON.stringify(salesDateArr));
				salesDateArr.sort();
				var FirstSortDate = salesDateArr[0];
				var LastSortDate = salesDateArr[salesListsize - 1];
				salesDateArr = basicDate;
		
				var basicDate2 = [];
				basicDate2 = JSON.parse(JSON.stringify(expenseDateArr));
				expenseDateArr.sort();
				var FirstSortDate2 = expenseDateArr[0];
				var LastSortDate2 = expenseDateArr[expenseListsize - 1];
				expenseDateArr = basicDate2;
		
				var firstDate;
				var lastDate;
				
				//console.log(basicDate);
				//console.log(basicDate2);
			
				//console.log(lastDate);
				//console.log(firstDate);
				
				//x축 List 구하기
				var dayList = [];
				var monthList=[];
				var yearList=[];
				var times=0;
				var times2=0;
				var startDate = new Date(FirstSortDate);
				var endDate = new Date(LastSortDate);
				var lineDate=new Date(FirstSortDate);
				
				var dayList2 = [];
				var monthList2=[];
				var yearList2=[];
				var times2=0;
				var startDate2 = new Date(FirstSortDate2);
				var endDate2 = new Date(LastSortDate2);
				var lineDate2=new Date(FirstSortDate2);
				
				//console.log(startDate);
				//console.log(endDate);
				
				//console.log(startDate2);
				//console.log(endDate2);
					
				//y축 구하기
				var expenseList=new Array(sellerListsize);
				var salesList=new Array(sellerListsize);
				var expenseMonth=new Array(sellerListsize);
				var salesMonth=new Array(sellerListsize);
				var expenseYear=new Array(sellerListsize);
				var salesYear=new Array(sellerListsize);
				
				var expenseList2=new Array(sellerListsize);
				var salesList2=new Array(sellerListsize);
				var expenseMonth2=new Array(sellerListsize);
				var salesMonth2=new Array(sellerListsize);
				var expenseYear2=new Array(sellerListsize);
				var salesYear2=new Array(sellerListsize);
				
				//console.log(salesDateArr);
				//console.log(salesComArr);
				//console.log(salesPriceArr);
				//console.log("ㅡㅐㅜ소")
				
				for(var j=0;j<sellerListsize;j++){
					 
					salesList[j]=new Array();
					startDate = new Date(FirstSortDate);
					endDate = new Date(LastSortDate);
					lineDate=new Date(FirstSortDate);
					times=0;
					
					while(format(lineDate)!=format(endDate)){
						salesList[j][times]=0;
						dayList[times]=format(lineDate);
						
						for(var i=0;i<salesDateArr.length;i++){	
							if(salesDateArr[i]==format(lineDate)){
								if(salesComArr[i]-1==(j)){
									salesList[j][times]+=Number(salesPriceArr[i]);
								}
							}
						}
						times++;
						lineDate.setDate((lineDate.getDate()+1));
					}
				}
				
				for(var j=0;j<sellerListsize;j++){
					dayList[times]=format(endDate);
					salesList[j][times]=0;
					
					for(var i=0;i<salesDateArr.length;i++){	
						if(salesDateArr[i]==format(lineDate)){
							if(salesComArr[i]-1==(j)){
								salesList[j][times]+=Number(salesPriceArr[i]);
							}
						}
					}
				}
				
				//console.log(dayList);
				//console.log(salesList);
				//여기까지 판매 데이터 
				
				
				for(var j=0;j<sellerListsize;j++){
					
					expenseList2[j]=new Array();
					startDate2 = new Date(FirstSortDate2);
					endDate2 = new Date(LastSortDate2);
					lineDate2=new Date(FirstSortDate2);
					times2=0;
					
					while(format(lineDate2)!=format(endDate2)){
						dayList2[times2]=format(lineDate2);
						expenseList2[j][times2]=0;
						
						for(var i=0;i<expenseDateArr.length;i++){	
							if(expenseDateArr[i]==format(lineDate2)){
								if(expenseComArr[i]-1==(j)){
									expenseList2[j][times]+=Number(expensePriceArr[i]);
								}
							}
							
						}
						
						times2++;
						lineDate2.setDate((lineDate2.getDate()+1));
					}
				}
				
				for(var j=0;j<sellerListsize;j++){
					
					dayList2[times2]=format(endDate2);
					expenseList2[j][times2]=0;
					
					for(var i=0;i<expenseDateArr.length;i++){	
						if(expenseDateArr[i]==format(lineDate2)){
							if(expenseComArr[i]-1==(j)){
								expenseList2[j][times2]+=Number(expensePriceArr[i]);
							}
						}
					}
				}
				
				//console.log(dayList2);
				//console.log(expenseList2);
				//console.log(salesList2);
				
				//console.log(sellerListsize);
				
				var colorList=[];
				
				for(var i=0;i<<%=comSize%>;i++){
					colorList[i]=getRandomColor();
				}
				
				var ctx = $("#sales-chart");
				ctx.height=150;
				var myChart=new Chart(ctx, {
					type : 'line',
					data : {
						labels : dayList,
						type : 'line',
						defaultFontFamily : 'Montserrat',
						datasets : [ 
					<%for(int i=0;i<comSize;i++){%>		
							{
							label : comNameArr[<%=i%>]+'점',
							data : salesList[<%=i%>],
							backgroundColor : 'transparent',
							borderColor : colorList[<%=i%>],
							borderWidth : 2,
							pointStyle : 'circle',
							pointRadius : 3,
							pointBorderColor : 'transparent',
							pointBackgroundColor : colorList[<%=i%>],
						}, 
					<%}%>
						]
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
									labelString : 'Date'
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
									labelString : 'price'
								}
							} ]
						},
						title : {
							display : false,
							text : 'Normal Legend'
						}
					}
				}); 
					
				var ctx = $("#line-chart");
				ctx.height=150;
				var myChart2=new Chart(ctx, {
					type : 'line',
					data : {
						labels : dayList2,
						type : 'line',
						defaultFontFamily : 'Montserrat',
						datasets : [ 
					<%for(int i=0;i<6;i++){%>		
							{
							label :  comNameArr[<%=i%>]+'점',
							data : expenseList2[<%=i%>],
							backgroundColor : 'transparent',
							borderColor : colorList[<%=i%>],
							borderWidth : 2,
							pointStyle : 'circle',
							pointRadius : 3,
							pointBorderColor : 'transparent',
							pointBackgroundColor : colorList[<%=i%>],
						}, 
					<%}%>
					]
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
									labelString : 'Date'
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
									labelString : 'price'
								}
							} ]
						},
						title : {
							display : false,
							text : 'Normal Legend'
						}
					}
				}); 
				
				$("#timeSelect").change(function(){
					$("#sales-chart").remove();
					$("#line-chart").remove();
					$("#chartBefore").after("<canvas id='sales-chart'></canvas>");
					$("#chartExpense").after("<canvas id='line-chart'></canvas>");
					
					var selectVal =  $(this).val();
					console.log("selectVal : " + selectVal);
					
					var k = 0;
					var changeDay = [];
					var changeDay2=[];
					var changeExpensePrice2 = [];
					var changeSalesPrice = [];
					    
					if(selectVal=="daily"){
						changeDay=dayList;
						changeDay2=dayList2;
						changeExpensePrice2=expenseList2;
						changeSalesPrice=salesList;
						console.log(dayList2);
						console.log(expenseList2);
					}
					
				    if(selectVal=="monthly"){
				    	
				    	times=0;
				    	times2=0;
				    	startDate = new Date(FirstSortDate);
						endDate = new Date(LastSortDate);
						lineDate=new Date(FirstSortDate);
						startDate2 = new Date(FirstSortDate2);
						endDate2 = new Date(LastSortDate2);
						lineDate2=new Date(FirstSortDate2);
						
						var monthList=[];
						var monthList2=[];
						
						//console.log(salesDateArr);
						//console.log(salesComArr);
						//console.log(salesPriceArr);
						
						for(var j=0;j<sellerListsize;j++){
							
							times=0;
							startDate = new Date(FirstSortDate);
							endDate = new Date(LastSortDate);
							lineDate=new Date(FirstSortDate);
							salesMonth[j]=new Array();
							
							while(formatM(lineDate)!=formatM(endDate)){
								
								salesMonth[j][times]=0;
								monthList[times]=formatM(lineDate);
								
								for(var i=0;i<salesDateArr.length;i++){	
									if(salesDateArr[i].substring(0, 7)==formatM(lineDate)){
										if(salesComArr[i]-1==(j)){
											salesMonth[j][times]+=Number(salesPriceArr[i]);
										}
									}
								}
								
								times++;
								lineDate.setMonth((lineDate.getMonth()+1));
							}
						}
						
						for(var j=0;j<sellerListsize;j++){
							
							monthList[times]=formatM(endDate);
							salesMonth[j][times]=0;
							
							for(var i=0;i<salesDateArr.length;i++){	
								if(salesDateArr[i].substring(0, 7)==formatM(lineDate)){
									if(salesComArr[i]-1==(j)){
										salesMonth[j][times]+=Number(salesPriceArr[i]);
									}
								}
							}
						}
						
						//console.log(monthList);
						//console.log(salesMonth);
						//여기까지 판매 데이터 
						
						for(var j=0;j<sellerListsize;j++){
							times2=0;
							startDate2=new Date(FirstSortDate2);
							endDate2=new Date(LastSortDate2);
							lineDate2=new Date(FirstSortDate2);
							expenseMonth2[j]=new Array();
							
							while(formatM(lineDate2)!=formatM(endDate2)){
								monthList2[times2]=formatM(lineDate2);
								expenseMonth2[times2]=0;
								console.log(monthList2);
								for(var i=0;i<expenseDateArr.length;i++){	
									if(expenseDateArr[i].substring(0, 7)==formatM(lineDate)){
										if(expenseComArr[i]-1==(j)){
											expenseMonth2[j][times]+=Number(expensePriceArr[i]);
										}
									}
									
								}
								
								times2++;
								lineDate2.setMonth((lineDate.getMonth()+1));
							}
							
						}
						
						for(var j=0;j<sellerListsize;j++){
							
							monthList2[times2]=formatM(endDate2);
							expenseMonth2[j][times2]=0;
							
							for(var i=0;i<expenseDateArr.length;i++){	
								if(expenseDateArr[i]==format(lineDate2)){
									if(expenseComArr[i]-1==(j)){
										expenseMonth2[j][times2]+=Number(expensePriceArr[i]);
									}
								}
							}
						}
						
						console.log(monthList);
						console.log(salesMonth);
						
						console.log(monthList2);
						console.log(expenseMonth2);
						
				    	changeDay=monthList;
				    	changeDay2=monthList2;
				    	changeExpensePrice2=expenseMonth2;
				    	changeSalesPrice=salesMonth;
				    	
				    }
				    
				    if(selectVal == "yearly"){
				    	
				    	times=0;
						times2=0;
				    	startDate = new Date(FirstSortDate);
						endDate = new Date(LastSortDate);
						lineDate=new Date(FirstSortDate);
				    	startDate2 = new Date(FirstSortDate2);
						endDate2 = new Date(LastSortDate2);
						lineDate2=new Date(FirstSortDate2);
						
						
						for(var j=0;j<sellerListsize;j++){
							
							times=0;
							startDate = new Date(FirstSortDate);
							endDate = new Date(LastSortDate);
							lineDate=new Date(FirstSortDate);
							
							salesYear[j]=new Array();
							
							while(formatY(lineDate2)!=formatY(endDate2)){
						
								yearList[times]=formatY(lineDate);
								salesYear[j][times]=0;
								
								for(var i=0;i<salesDateArr.length;i++){	
									if(salesDateArr[i].substring(0, 4)==formatY(lineDate)){
										if(salesComArr[i]-1==(j)){
											salesYear[j][times]+=Number(salesPriceArr[i]);
										}
									}
								}
								console.log(salesYear[j]);
								times++;
								lineDate.setYear((lineDate.getFullYear()+1));
							}
						}
						
						for(var j=0;j<sellerListsize;j++){
							yearList[times]=formatY(endDate);
							salesYear[j][times]=0;
							
							for(var i=0;i<salesDateArr.length;i++){	
								if(salesDateArr[i].substring(0, 4)==formatY(lineDate)){
									if(salesComArr[i]-1==(j)){
										salesYear[j][times]+=Number(salesPriceArr[i]);
									}
								}
							}
						}		
					
						//여기까지 판매 
						
						for(var j=0;j<sellerListsize;j++){
							times2=0;
							startDate2=new Date(FirstSortDate2);
							endDate2=new Date(LastSortDate2);
							lineDate2=new Date(FirstSortDate2);
							expenseYear2[j]=new Array();
							
							while(formatY(lineDate2)!=formatY(endDate2)){
								yearList2[times2]=formatY(lineDate2);
								expenseYear2[times2]=0;
								
								for(var i=0;i<expenseDateArr.length;i++){	
									if(expenseDateArr[i].substring(0, 7)==formatM(lineDate)){
										if(expenseComArr[i]-1==(j)){
											expenseYear2[j][times]+=Number(expensePriceArr[i]);
										}
									}
								}
								
								times2++;
								lineDate2.setYear((lineDate2.getFullYear()+1));
							}
						}
						
						for(var j=0;j<sellerListsize;j++){
							
							yearList2[times2]=formatY(endDate2);
							expenseYear2[j][times2]=0;
							
							for(var i=0;i<expenseDateArr.length;i++){	
								if(expenseDateArr[i]==format(lineDate2)){
									if(expenseComArr[i]-1==(j)){
										expenseYear2[j][times2]+=Number(expensePriceArr[i]);
									}
								}
							}
						}
						
						console.log(yearList);
						console.log(salesYear);
				    	
						console.log(yearList2);
						console.log(expenseYear2);
						
				    	changeDay=yearList;
				    	changeDay2=yearList2;
				    	changeSalesPrice=salesYear;
				    	changeExpensePrice2=expenseYear2;
				    	
					}
				 
					
				    var ctx = $("#sales-chart");
					ctx.height = 150;
					var myChart=new Chart(ctx, {
						type : 'line',
						data : {
							labels : changeDay,
							type : 'line',
							defaultFontFamily : 'Montserrat',
							datasets :[
						<%for(int i=0;i<comSize;i++){%>		
								{
								label :  comNameArr[<%=i%>]+'점',
								data : changeSalesPrice[<%=i%>],
								backgroundColor : 'transparent',
								borderColor : colorList[<%=i%>],
								borderWidth : 3,
								pointStyle : 'circle',
								pointRadius : 5,
								pointBorderColor : 'transparent',
								pointBackgroundColor : colorList[<%=i%>],
							}, 
						<%}%>
							]
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
										labelString : 'Date'
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
										labelString : 'price'
									}
								} ]
							},
							title : {
								display : false,
								text : 'Normal Legend'
							}
						}
					});
					
					var ctx = $("#line-chart");
					ctx.height=150;
					var myChart2=new Chart(ctx, {
						type : 'line',
						data : {
							labels : changeDay2,
							type : 'line',
							defaultFontFamily : 'Montserrat',
							datasets : [ 
						<%for(int i=0;i<6;i++){%>		
								{
								label :  comNameArr[<%=i%>]+'점',
								data : changeExpensePrice2[<%=i%>],
								backgroundColor : 'transparent',
								borderColor : colorList[<%=i%>],
								borderWidth : 2,
								pointStyle : 'circle',
								pointRadius : 3,
								pointBorderColor : 'transparent',
								pointBackgroundColor : colorList[<%=i%>],
							}, 
						<%}%>
						]
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
										labelString : 'Date'
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
										labelString : 'price'
									}
								} ]
							},
							title : {
								display : false,
								text : 'Normal Legend'
							}
						}
					}); 
				});
			}
		}else{
			
			if(${salesList.size()==0} && ${expenseList.size()==0}){
				alert("매출 내역이 없습니다. 이전 통계로 돌아갑니다.");
				history.back();
			}else{
				if(${salesList.size()>0}){				
					var salesListsize = "${fn:length(salesList)}";
					var salesList = "${salesList}".toString();
				}else{
					var salesListsize = 1;
					var salesList = "[AdminSales [salesNo=0, comNo=0, comName=null, salesInputDate=2019-02-16, salesDate=2019-02-16, salesCate=1, expenseNo=0, orderNo=0, salesPrice=0]]";
				}
				if(${expenseList.size()>0}){				
					var expenseListsize = "${fn:length(expenseList)}";
					var expenseList = "${expenseList}".toString();
				}else{
					var expenseListsize = 1;
					var expenseList = "[AdminSales [salesNo=0, comNo=0, comName=null, salesInputDate=2019-02-16, salesDate=2019-02-16, salesCate=0, expenseNo=0, orderNo=0, salesPrice=0]]";
				}
				
				
				//console.log(salesListsize+"/"+expenseListsize);
				//console.log(salesList);
	
				var salesPriceArr = [];
				var salesDateArr = [];
				var expensePriceArr = [];
				var expenseDateArr = [];
		
				salesList = salesList.substring(1, salesList.lastIndexOf("]"));
				var salesArr = salesList.split('AdminSales');
				salesArr.splice(0, 1);
				expenseList = expenseList.substring(1, expenseList.lastIndexOf("]"));
				var expenseArr = expenseList.split('AdminSales');
				expenseArr.splice(0, 1);
		
				//console.log(salesArr);
				//console.log(expenseArr);
		
				var salesArrList1 = new Array(salesListsize);
				var salesArrList = new Array(salesListsize);
		
				var expenseList1 = new Array(expenseListsize);
				var expenseList = new Array(expenseListsize);
		
				//이차원 배열로 List 잘라내기
				for (var i = 0; i < salesListsize; i++) {
					salesArr[i] = salesArr[i].split(']');
					salesArrList1[i] = salesArr[i][0].split(' [')[1];
					salesArrList[i] = salesArrList1[i].toString().split(', ');
				}
		
				for (var i = 0; i < expenseListsize; i++) {
					expenseArr[i] = expenseArr[i].split(']');
					expenseList1[i] = expenseArr[i][0].split(' [')[1];
					expenseList[i] = expenseList1[i].toString().split(', ');
				}
		
				console.log("ArrList")
				console.log(salesArrList); 
				console.log(expenseList); 
				
				for (var i = 0; i < salesArrList.length; i++) {
					if(salesArrList[i][3]==null){
						salesDateArr[i]=[format(new Date())];
						salesPriceArr[i]=[0];
					}
					else{
						salesDateArr[i] = salesArrList[i][3].split('=')[1];
						salesPriceArr[i] = salesArrList[i][8].split('=')[1];
					}
				}
		
				//console.log(salesDateArr);
				//console.log(salesPriceArr);
		
				for (var i = 0; i < expenseList.length; i++) {
					if(expenseList[i][3]==null){
						expenseDateArr[i]=[format(new Date())];
						expensePriceArr[i]=[0];
					}
					else{
						expenseDateArr[i] = expenseList[i][3].split('=')[1];
						expensePriceArr[i] = expenseList[i][8].split('=')[1];
					}
				}
				console.log("salesExpenseList")
				console.log(expenseDateArr);
				console.log(expensePriceArr);
		
				//데이터 테이블 시작일 선택하기 
				var basicDate = [];
				basicDate = JSON.parse(JSON.stringify(salesDateArr));
				salesDateArr.sort();
				var FirstSortDate = salesDateArr[0];
				var LastSortDate = salesDateArr[salesListsize - 1];
				salesDateArr = basicDate;
		
				var basicDate2 = [];
				basicDate2 = JSON.parse(JSON.stringify(expenseDateArr));
				expenseDateArr.sort();
				var FirstSortDate2 = expenseDateArr[0];
				var LastSortDate2 = expenseDateArr[expenseListsize - 1];
				expenseDateArr = basicDate2;
		
				var firstDate;
				var lastDate;
		
				if (FirstSortDate > FirstSortDate2) {
					firstDate = FirstSortDate2;
				} else {
					firstDate = FirstSortDate;
				}
		
				if (LastSortDate > LastSortDate2) {
					lastDate = LastSortDate;
				} else {
					lastDate = LastSortDate2;
				}
		
				//console.log(lastDate);
				//console.log(firstDate);
		
				//x축 List 구하기
				var dayList = [];
				var monthList=[];
				var yearList=[];
				var times=0;
				var startDate = new Date(firstDate);
				var endDate = new Date(lastDate);
				var lineDate=new Date(firstDate);
				
				//console.log(startDate);
				//console.log(endDate);
						
				var expenseList=[];
				var salesList=[];
				var expenseMonth=[];
				var salesMonth=[];
				var expenseYear=[];
				var salesYear=[];
				
				while(format(lineDate)!=format(endDate)){
					dayList[times]=format(lineDate);
					expenseList[times]=0;
					salesList[times]=0;
					for(var i=0;i<expenseDateArr.length;i++){	
						if(expenseDateArr[i]==format(lineDate)){
							expenseList[times]+=Number(expensePriceArr[i]);
						}
					}
					for(var i=0;i<salesDateArr.length;i++){	
						if(salesDateArr[i]==format(lineDate)){
							salesList[times]+=Number(salesPriceArr[i]);
						}
					}
					times++;
					lineDate.setDate((lineDate.getDate()+1));
				}
				
				dayList[times]=format(endDate);
				expenseList[times]=0;
				salesList[times]=0;
				for(var i=0;i<expenseDateArr.length;i++){	
					if(expenseDateArr[i]==format(lineDate)){
						expenseList[times]+=Number(expensePriceArr[i]);
					}
				}
				for(var i=0;i<salesDateArr.length;i++){	
					if(salesDateArr[i]==format(lineDate)){
						salesList[times]+=Number(salesPriceArr[i]);
					}
				}
				
				//console.log(dayList);
				
				console.log(expenseList);
				console.log(salesList);
				
		
				var ctx = $("#sales-chart");
				ctx.height=150;
				var myChart=new Chart(ctx, {
					type : 'line',
					data : {
						labels : dayList,
						type : 'line',
						defaultFontFamily : 'Montserrat',
						datasets : [ {
							label : "업체 재고 주문",
							data : expenseList,
							backgroundColor : 'transparent',
							borderColor : 'rgba(220,53,69,0.75)',
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : 'rgba(220,53,69,0.75)',
						}, {
							label : "고객 주문",
							data : salesList, 
							backgroundColor : 'transparent',
							borderColor : 'rgba(40,167,69,0.75)',
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : 'rgba(40,167,69,0.75)',
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
									labelString : 'Date'
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
									labelString : 'price'
								}
							} ]
						},
						title : {
							display : false,
							text : 'Normal Legend'
						}
					}
				});
			
			}
			
			$("#timeSelect").change(function(){
				
				$("#sales-chart").remove();
				$("#chartBefore").after("<canvas id='sales-chart'></canvas>");
				
				var selectVal =  $(this).val();
				console.log("selectVal : " + selectVal);
				
				var k = 0;
				var changeDay = [];
				var changeExpensePrice = [];
				var changeSalesPrice = [];
				    
				if(selectVal=="daily"){
					changeDay=dayList;
					changeExpensePrice=expenseList;
					changeSalesPrice=salesList;
				}
				
				 
			    if(selectVal=="monthly"){
			    	times=0;
			    	startDate = new Date(firstDate);
					endDate = new Date(lastDate);
					lineDate=new Date(firstDate);
					
					while(formatM(lineDate)!=formatM(endDate)){
						monthList[times]=formatM(lineDate);
						expenseMonth[times]=0;
						salesMonth[times]=0;
						
						for(var i=0;i<expenseDateArr.length;i++){	
							if(expenseDateArr[i].substring(0, 7)==formatM(lineDate)){
								expenseMonth[times]+=Number(expensePriceArr[i]);
							}
						}
						for(var i=0;i<salesDateArr.length;i++){	
							if(salesDateArr[i].substring(0, 7)==formatM(lineDate)){
								salesMonth[times]+=Number(salesPriceArr[i]);
							}
						}
						times++;
						lineDate.setMonth((lineDate.getMonth()+1));
					}
					
					
					monthList[times]=formatM(endDate);
					expenseMonth[times]=0;
					salesMonth[times]=0;
					
					for(var i=0;i<expenseDateArr.length;i++){	
						if(expenseDateArr[i].substring(0, 7)==formatM(lineDate)){
							expenseMonth[times]+=Number(expensePriceArr[i]);
						}
					}
					for(var i=0;i<salesDateArr.length;i++){	
						if(salesDateArr[i].substring(0, 7)==formatM(lineDate)){
							salesMonth[times]+=Number(salesPriceArr[i]);
						}
					}
				
					console.log(monthList);
					console.log(expenseMonth);
					console.log(salesMonth);
					
			    	changeDay=monthList;
			    	changeExpensePrice=expenseMonth;
			    	changeSalesPrice=salesMonth;
			    	
			    }
			    
			    if(selectVal == "yearly"){
			    	
			    	times=0;
			    	startDate = new Date(firstDate);
					endDate = new Date(lastDate);
					lineDate=new Date(firstDate);
					
					console.log(formatY(endDate));
					while(formatY(lineDate)!=formatY(endDate)){
						yearList[times]=formatY(lineDate);
						expenseYear[times]=0;
						salesYear[times]=0;
						
						for(var i=0;i<expenseDateArr.length;i++){	
							if(expenseDateArr[i].substring(0, 4)==formatY(lineDate)){
								expenseYear[times]+=Number(expensePriceArr[i]);
							}
						}
						for(var i=0;i<salesDateArr.length;i++){	
							if(salesDateArr[i].substring(0, 4)==formatY(lineDate)){
								salesYear[times]+=Number(salesPriceArr[i]);
							}
						}
						times++;
						lineDate.setYear((lineDate.getFullYear()+1));
					}
					
					
					yearList[times]=formatY(endDate);
					expenseYear[times]=0;
					salesYear[times]=0;
					
					for(var i=0;i<expenseDateArr.length;i++){	
						if(expenseDateArr[i].substring(0, 4)==formatY(lineDate)){
							expenseYear[times]+=Number(expensePriceArr[i]);
						}
					}
					for(var i=0;i<salesDateArr.length;i++){	
						if(salesDateArr[i].substring(0, 4)==formatY(lineDate)){
							salesYear[times]+=Number(salesPriceArr[i]);
						}
					}
				
					console.log(yearList);
					console.log(expenseYear);
					console.log(salesYear);
			    	
			    	changeDay=yearList;
			    	changeExpensePrice=expenseYear;
			    	changeSalesPrice=salesYear;
			    	
			    }
			    
			    var ctx = $("#sales-chart");
				ctx.height = 150;
				var myChart = new Chart(ctx, {
					type : 'line',
					data : {
						labels : changeDay,
						type : 'line',
						defaultFontFamily : 'Montserrat',
						datasets : [ {
							label : "업체 재고 주문",
							data : changeExpensePrice,
							backgroundColor : 'transparent',
							borderColor : 'rgba(220,53,69,0.75)',
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : 'rgba(220,53,69,0.75)',
						}, {
							label : "고객 주문",
							data : changeSalesPrice, 
							backgroundColor : 'transparent',
							borderColor : 'rgba(40,167,69,0.75)',
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : 'rgba(40,167,69,0.75)',
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
									labelString : 'Date'
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
									labelString : 'price'
								}
							} ]
						},
						title : {
							display : false,
							text : 'Normal Legend'
						}
					}
				});
			    
			});
		}
		
	})(jQuery);
</script>
<jsp:include page="../../common/footer.jsp" />