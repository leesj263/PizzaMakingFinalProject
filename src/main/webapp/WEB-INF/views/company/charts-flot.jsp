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
                            <li class="active">Float Chart</li>
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
                                <h4 class="mb-3">Real Chart</h4>
                                <div class="flot-container">
                                    <div id="cpu-load" class="cpu-load"></div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Line Chart</h4>
                                <div class="flot-container">
                                    <div id="flot-line" class="flot-line"></div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /# column -->
                </div><!-- /# row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Pie Chart</h4>
                                <div class="flot-container">
                                    <div id="flot-pie" class="flot-pie-container"></div>
                                </div>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Line Chart</h4>
                                <div class="flot-container">
                                    <div id="chart1" style="width:100%;height:275px;"></div>
                                </div>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->
                </div><!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Bar Chart</h4>
                                <div class="flot-container">
                                    <div id="flotBar" style="width:100%;height:275px;"></div>
                                </div>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-3">Bar Chart</h4>
                                <div class="flot-container">
                                    <div id="flotCurve" style="width:100%;height:275px;"></div>
                                </div>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->
                </div><!-- /# row -->



            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->


    <!--  flot-chart js -->
    <script src="${contextPath }/resources/companyCss/vendors/flot/excanvas.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/flot/jquery.flot.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/flot/jquery.flot.pie.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/flot/jquery.flot.time.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/flot/jquery.flot.stack.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/flot/jquery.flot.resize.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/flot/jquery.flot.crosshair.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/flot-chart/curvedLines.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/flot-chart/flot-tooltip/jquery.flot.tooltip.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/flot-chart/flot-chart-init.js"></script>

</body>

</html>
