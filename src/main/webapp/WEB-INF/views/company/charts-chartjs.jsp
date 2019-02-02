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

</head>

<body>
   <jsp:include page="companyMenubar.jsp"></jsp:include>

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <jsp:include page="companyHeader.jsp"></jsp:include>

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Dashboard</a></li>
                            <li><a href="#">Charts</a></li>
                            <li class="active">Chartjs</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Yearly Sales </h4>
                                <canvas id="sales-chart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Team Commits </h4>
                                <canvas id="team-chart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Bar chart </h4>
                                <canvas id="barChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Rader chart </h4>
                                <canvas id="radarChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Line Chart </h4>
                                <canvas id="lineChart"></canvas>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mb-3">Doughut Chart </h4>
                                    <canvas id="doughutChart"></canvas>
                                </div>
                            </div>
                        </div><!-- /# column -->

                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Pie Chart </h4>
                                <canvas id="pieChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->


                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Polar Chart </h4>
                                <canvas id="polarChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Single Bar Chart </h4>
                                <canvas id="singelBarChart"></canvas>
                            </div>
                        </div>
                    </div><!-- /# column -->




                </div>

            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->

	<script src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/chart-js/chartjs-init.js"></script>
</body>

</html>
