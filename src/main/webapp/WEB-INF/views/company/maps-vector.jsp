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
                            <li><a href="#">Map</a></li>
                            <li class="active">Vector map</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>World</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Algeria</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap2" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Argentina</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap3" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Brazil</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap4" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>France</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap5" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Germany</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap6" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Greece</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap7" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Russia</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap10" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Tunisia</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap11" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Europe</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap12" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>USA</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap13" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Turkey</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap14" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Inactive Regions</h4>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap15" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->



                </div>
                <!-- /# row -->


            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->



    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/jquery.vmap.min.js"></script>

    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.algeria.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.argentina.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.brazil.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.france.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.germany.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.greece.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.iran.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.iraq.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.russia.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.tunisia.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.europe.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.usa.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.turkey.js"></script>
    <!-- scripit init-->
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/vector-map/vector.init.js"></script>




</body>

</html>
