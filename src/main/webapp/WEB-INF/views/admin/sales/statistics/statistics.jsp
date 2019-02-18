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
				<h4 class="mb-3">전체 매출</h4>
				<canvas id="barChart"></canvas>
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

					})(jQuery);
				
				</script>
			</div>
		</div>
	</div>
		
</section>
<jsp:include page="../../common/footer.jsp"/>