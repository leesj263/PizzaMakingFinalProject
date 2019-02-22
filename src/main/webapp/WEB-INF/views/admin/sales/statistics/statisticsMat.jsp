<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="matSize" value="${matList.size()}"/>
<%
int matSize=(Integer)pageContext.getAttribute("matSize");
%>
<jsp:include page="../../common/header.jsp" />
<style>
#timeSelect {
	float: right;
	border: 3px solid #F7D358;
	border-radius: 5px;
}

#matSelect {
	float: left;
	border: 3px solid #F7D358;
	border-radius: 5px;
}

div.modal-body {
	padding: 20px 75px;
}

#matNoList {
	width: 150px;
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
						<button class="btn btn-sm btn-outline-primary" onclick="location.href='statisitcsCom.ad?comNo=1'">업체매출</button>
						&nbsp;&nbsp;
						<button class="btn btn-sm btn-danger" onclick="location.href='statisticsMat.ad?materialCate=1'" disabled>토핑매출</button>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-8">
									<button id="matSelect" class="btn btn-sm btn-outline-warning" value="${materialCate }" type="button" data-toggle="modal" data-target="#smallModal">
										<c:if test="${materialCate==1 }">도우</c:if>
										<c:if test="${materialCate==2 }">소스</c:if>
										<c:if test="${materialCate==3 }">엣지</c:if>
										<c:if test="${materialCate==4 }">토핑</c:if>
										<c:if test="${materialCate==5 }">사이드메뉴</c:if>
									</button>
								</div>
								<div class="col-md-4">
									<select id="timeSelect" class="form-class">
										<option value="yearly">연간 매출</option>
										<option value="monthly">월간 매출</option>
										<option value="daily" selected>일간 매출</option>
									</select>
								</div>
							</div>
							<h4 class="mb-3" id="chartBefore"></h4>
							<canvas id="sales-chart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
		aria-labelledby="smallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="smallModalLabel">토핑 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<select id="matNoList" name="matNoList" size="8">
						<option value="1" <c:if test="${materialCate==1 }">selected</c:if>>도우</option>
						<option value="2" <c:if test="${materialCate==2 }">selected</c:if>>소스</option>
						<option value="3" <c:if test="${materialCate==3 }">selected</c:if>>엣지</option>
						<option value="4" <c:if test="${materialCate==4 }">selected</c:if>>토핑</option>
						<option value="5" <c:if test="${materialCate==5 }">selected</c:if>>사이드</option>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="goMatStat()">선택</button>
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
	
	function goMatStat(){
		var selectMat=$("select[name='matNoList']").val();
		console.log(selectMat);
		location.href='statisticsMat.ad?mCate='+selectMat;
	}
	
	function getRandomColor(){
		var letters = '0123456789ABCDEF'.split('');
		var color = '#';
		for (var i = 0; i < 6; i++) {
			color += letters[Math.floor(Math.random() * 16)];
		}
		return color;
	}
	
	(function($){
		var mCate="${materialCate}";
		var matList="${matList}".toString();
		var matListsize="${fn:length(matList)}";
		var colorList=[];
		var matName=[];
		
		if(${salesList.size()==0}){
			alert("매출 내역이 없습니다. 이전 통계로 돌아갑니다.");
			history.back();
		}else{
			
			if(${salesList.size()>0}){				
				var salesListsize="${fn:length(salesList)}";
				var salesList="${salesList}".toString();
			}else{
				var salesListsize=1;
				var salesList="[AdminSales [salesNo=0, comNo=0, comName=null, salesInputDate=2019-02-21, salesDate=2019-02-21, salesCate=1, expenseNo=0, orderNo=0, salesPrice=0]]";
			}
			
			var sellerListsize="${fn:length(sellerList)}";
			
			//console.log(salesListsize);
			//console.log(matList);
			//console.log(mCate);
			//console.log(salesList);
			
			var salesPriceArr=[];
			var salesDateArr=[];
			var salesMatArr=[];
			
			salesList=salesList.substring(1, salesList.lastIndexOf("]"));
			matList=matList.substring(1, matList.lastIndexOf("]"));

			var salesArr=salesList.split('AdminMSales');
			var matArr=matList.split('AdminMaterial');
			
			//console.log(matArr);
			salesArr.splice(0, 1);
			matArr.splice(0, 1);
			
			//console.log(salesList);
			console.log("재료목록");
			console.log(matArr);
			
			var salesArrList1=new Array(salesListsize);
			var salesArrList=new Array(salesListsize);
			
			var matArrList1=new Array(matListsize);
			var matArrList=new Array(matListsize);
			 
			//이차원 배열로 List 잘라내기
			for(var i=0;i<salesListsize;i++) {
				salesArr[i]=salesArr[i].split(']');
				salesArrList1[i]=salesArr[i][0].split(' [')[1];
				salesArrList[i]=salesArrList1[i].toString().split(', ');
			}
			
			for(var i=0;i<matListsize;i++) {
				matArr[i]=matArr[i].split(']');
				matArrList1[i]=matArr[i][0].split(' [')[1];
				matArrList[i]=matArrList1[i].toString().split(', ');
			}
			
			//console.log("ArrList")
			console.log(salesArrList); 
			//console.log(matArrList); 
			
			
			for(var i=0;i<matListsize;i++){
				matName[i]=matArrList[i][2].split('=')[1];
			}
			
			for (var i = 0; i<salesArrList.length; i++) {
				if(salesArrList[i][3]==null){
					salesDateArr[i]=[format(new Date())];
					salesPriceArr[i]=[0];
					salesMatArr[i]=[''];
				}
				else{
					salesDateArr[i]=salesArrList[i][3].split('=')[1];
					salesPriceArr[i]=salesArrList[i][14].split('=')[1];
					salesMatArr[i]=salesArrList[i][11].split('=')[1];
					
				}
			}
	
			//console.log(salesDateArr);
			//console.log(salesPriceArr);
			//console.log(salesMatArr);
			//console.log(matName);
			
			//데이터 테이블 시작일 선택하기 
			var basicDate = [];
			basicDate = JSON.parse(JSON.stringify(salesDateArr));
			salesDateArr.sort();
			var FirstSortDate = salesDateArr[0];
			var LastSortDate = salesDateArr[salesListsize - 1];
			salesDateArr = basicDate;
	
			//x축 List 구하기
			var dayList = [];
			var monthList=[];
			var yearList=[];
			var times=0;
			var startDate = new Date(FirstSortDate);
			var endDate = new Date(LastSortDate);
			var lineDate=new Date(FirstSortDate);
			
			//console.log(startDate);
			//console.log(endDate);
			
			//y축 구하기
			var salesList=new Array(matListsize);
			var salesMonth=new Array(matListsize);
			var salesYear=new Array(matListsize);
			
			console.log(salesDateArr);
			console.log(salesMatArr);
			console.log(salesPriceArr);
			
			console.log(matName[0]==salesMatArr[0]);
			for(var j=0;j<matListsize;j++){
				
				//expenseList[j]=new Array();
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
							if(salesMatArr[i]==matName[j]){
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
						if(salesMatArr[i]==matName[j]){
							salesList[j][times]+=Number(salesPriceArr[i]);
						}
					}
				}
			}
			
			//console.log(dayList);
			//console.log(salesList);
			//여기까지 판매 데이터 
			
			//console.log(sellerListsize);
			
			
			for(var i=0;i<<%=matSize%>;i++){
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
				<%for(int i=0;i<matSize;i++){%>		
						{
						label : matName[<%=i%>],
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
		
		$("#timeSelect").change(function(){
			$("#sales-chart").remove();
			$("#chartBefore").after("<canvas id='sales-chart'></canvas>");
			console.log("remoce");
			var selectVal =  $(this).val();
			console.log("selectVal : " + selectVal);
			
			var k = 0;
			var changeDay = [];
			var changeSalesPrice = [];
			    
			if(selectVal=="daily"){
				changeDay=dayList;
				changeSalesPrice=salesList;
			}
			
		    if(selectVal=="monthly"){
		    	times=0;
		    	startDate = new Date(FirstSortDate);
				endDate = new Date(LastSortDate);
				lineDate=new Date(FirstSortDate);
				
				while(formatM(lineDate)!=formatM(endDate)){
					monthList[times]=formatM(lineDate);
					salesMonth[times]=0;
					
					for(var i=0;i<salesDateArr.length;i++){	
						if(salesDateArr[i].substring(0, 7)==formatM(lineDate)){
							salesMonth[times]+=Number(salesPriceArr[i]);
						}
					}
					
					times++;
					lineDate.setMonth((lineDate.getMonth()+1));
				}
				
				monthList[times]=formatM(endDate);
				salesMonth[times]=0;
				
				for(var i=0;i<salesDateArr.length;i++){	
					if(salesDateArr[i].substring(0, 7)==formatM(lineDate)){
						salesMonth[times]+=Number(salesPriceArr[i]);
					}
				}
			
				console.log(monthList);
				console.log(salesMonth);
				
		    	changeDay=monthList;
		    	changeSalesPrice=salesMonth;
		    	
		    	console.log(changeDay);
				console.log(changeSalesPrice);
				console.log(colorList);
				console.log(matName);
		    }
		    
		    if(selectVal == "yearly"){
		    	
		    	times=0;
		    	startDate = new Date(FirstSortDate);
				endDate = new Date(LastSortDate);
				lineDate=new Date(FirstSortDate);
				
				console.log(formatY(endDate));
				
				while(formatY(lineDate)!=formatY(endDate)){
					yearList[times]=formatY(lineDate);
					salesYear[times]=0;
					
					for(var i=0;i<salesDateArr.length;i++){	
						if(salesDateArr[i].substring(0, 4)==formatY(lineDate)){
							salesYear[times]+=Number(salesPriceArr[i]);
						}
					}
					
					times++;
					lineDate.setYear((lineDate.getFullYear()+1));
				}
				
				yearList[times]=formatY(endDate);
				salesYear[times]=0;
				
				for(var i=0;i<salesDateArr.length;i++){	
					if(salesDateArr[i].substring(0, 4)==formatY(lineDate)){
						salesYear[times]+=Number(salesPriceArr[i]);
					}
				}
			
				console.log(yearList);
				console.log(salesYear);
		    	
		    	changeDay=yearList;
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
					datasets : [ 
						<%for(int i=0;i<matSize;i++){%>		
								{
								label : matName[<%=i%>],
								data : changeSalesPrice[<%=i%>],
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
	})(jQuery);
</script>
<jsp:include page="../../common/footer.jsp" />