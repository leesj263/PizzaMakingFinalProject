<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp"/>

<section>
	<div class="right-panel">
		<p>statistics.jsp</p>
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-8"></div>
					<div class="col-md-4">
						<button class="btn btn-sm btn-warning" disable>전체매출</button>
						<button class="btn btn-sm btn-outline-primary">업체매출</button>
						<button class="btn btn-sm btn-outline-danger">토핑매출</button>
					</div>
				</div>
				<h4 class="mb-3">전체 매출</h4><!-- 
				<canvas id="barChart"></canvas> -->
				<h4 class="mb-3">일간 매출</h4>
				<canvas id="sales-chart"></canvas>
				<script>
					(function($) {
						//bar chart
					    var ctx = $("#barChart");
					    //    ctx.height = 200;
					    var myChart = new Chart( ctx, {
					        type: 'bar',
					        data: {
					            labels: [ "January", "February", "March", "April", "May", "June", "July", "August", "September" ],
					            datasets: [
					                {
					                    label: "고객 주문 매출",
					                    data: [ 65, 59, 99, 81, 56, 55, 99 ],
					                    borderColor: "rgba(0, 123, 255, 0.9)",
					                    borderWidth: "0",
					                    backgroundColor: "rgba(0, 123, 255, 0.5)"
					                            },
					                {
					                    label: "업체 주문 매출",
					                    data: [ 28, 48, 40, 19, 86, 27, 10, 50, 61, 30 ],
					                    borderColor: "rgb(150,107,255)",
					                    borderWidth: "0",
					                    backgroundColor: "rgb(208,189,255)"
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
					    
						 var ctx = document.getElementById( "sales-chart" );
						    ctx.height = 150;
						    var myChart = new Chart( ctx, {
						        type: 'line',
						        data: {
						            labels: [ "2010", "2011", "2012", "2013", "2014", "2015", "2016" ],
						            type: 'line',
						            defaultFontFamily: 'Montserrat',
						            datasets: [ {
						                label: "Foods",
						                data: [ 0, 30, 10, 120, 50, 63, 10 ],
						                backgroundColor: 'transparent',
						                borderColor: 'rgba(220,53,69,0.75)',
						                borderWidth: 3,
						                pointStyle: 'circle',
						                pointRadius: 5,
						                pointBorderColor: 'transparent',
						                pointBackgroundColor: 'rgba(220,53,69,0.75)',
						                    }, {
						                label: "Electronics",
						                data: [ 0, 50, 40, 80, 40, 79, 120 ],
						                backgroundColor: 'transparent',
						                borderColor: 'rgba(40,167,69,0.75)',
						                borderWidth: 3,
						                pointStyle: 'circle',
						                pointRadius: 5,
						                pointBorderColor: 'transparent',
						                pointBackgroundColor: 'rgba(40,167,69,0.75)',
						                    } ]
						        },
						        options: {
						            responsive: true,

						            tooltips: {
						                mode: 'index',
						                titleFontSize: 12,
						                titleFontColor: '#000',
						                bodyFontColor: '#000',
						                backgroundColor: '#fff',
						                titleFontFamily: 'Montserrat',
						                bodyFontFamily: 'Montserrat',
						                cornerRadius: 3,
						                intersect: false,
						            },
						            legend: {
						                display: false,
						                labels: {
						                    usePointStyle: true,
						                    fontFamily: 'Montserrat',
						                },
						            },
						            scales: {
						                xAxes: [ {
						                    display: true,
						                    gridLines: {
						                        display: false,
						                        drawBorder: false
						                    },
						                    scaleLabel: {
						                        display: false,
						                        labelString: 'Month'
						                    }
						                        } ],
						                yAxes: [ {
						                    display: true,
						                    gridLines: {
						                        display: false,
						                        drawBorder: false
						                    },
						                    scaleLabel: {
						                        display: true,
						                        labelString: 'Value'
						                    }
						                        } ]
						            },
						            title: {
						                display: false,
						                text: 'Normal Legend'
						            }
						        }
						    } );

					})(jQuery);
				</script>
			</div>
		</div>
	</div>
		
</section>
<jsp:include page="../../common/footer.jsp"/>