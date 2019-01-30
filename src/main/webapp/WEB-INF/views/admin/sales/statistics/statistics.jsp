<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp"/>

<section>
	<div class="right-panel">
		<p>statistics.jsp</p>
		<div class="card">
			<div class="card-body">
				<h4 class="mb-3">Bar chart</h4>
				<canvas id="barChart"></canvas>
				<script>
					(function($) {
						//bar chart
					    var ctx = $("#barChart");
					    //    ctx.height = 200;
					    var myChart = new Chart( ctx, {
					        type: 'bar',
					        data: {
					            labels: [ "January", "February", "March", "April", "May", "June", "July" ],
					            datasets: [
					                {
					                    label: "My First dataset",
					                    data: [ 65, 59, 99, 81, 56, 55, 99 ],
					                    borderColor: "rgba(0, 123, 255, 0.9)",
					                    borderWidth: "0",
					                    backgroundColor: "rgba(0, 123, 255, 0.5)"
					                            },
					                {
					                    label: "My Second dataset",
					                    data: [ 28, 48, 40, 19, 86, 27, 10 ],
					                    borderColor: "rgba(0,0,0,0.09)",
					                    borderWidth: "0",
					                    backgroundColor: "rgba(0,0,0,0.07)"
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