<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>
	.stockBtn{
		position : relative;
		left : 64%;
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
                
                
                
                
                	 <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">남은 재고량</h4>
                                <canvas id="remainStockChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->
                    
                     <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">소모량</h4>
                                <canvas id="consumptionChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->
                	
                	
                	
                </div>
                <div class = "stockBtn">
                 	<button onclick = "location.href = 'movePage.com?movePage=companyReceipt'" type="button" class="btn btn-secondary"><i class="fa fa-won"></i>&nbsp; 요금 명세서</button>
                 	<button onclick = "location.href = 'orderStrok.com'" type="button" class="btn btn-secondary"><i class="fa fa-truck"></i>&nbsp; 재고 주문</button>
                 	<button onclick = "location.href = 'movePage.com?movePage=orderStockList'" type="button" class="btn btn-secondary"><i class="fa fa-archive"></i>&nbsp; 재고 주문내역</button>
                 </div>
            </div>
            
         </div>
        
        
    </div>
    
    <script src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/chart-js/chartjs-init.js"></script>
    
    
    
</body>
</html>