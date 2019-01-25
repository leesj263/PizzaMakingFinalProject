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
                            <li class="active">Gmap</li>
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
                            <div class="card-header">
                                <h4>Basic Map</h4>
                            </div>
                            <div class="gmap_unix card-body">
                                <div class="map" id="basic-map"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Fusion Tables layers</h4>
                            </div>
                            <div class="card-body">
                                <div id="map-2" class="map"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->


                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Geometry overlays</h4>
                            </div>
                            <div class="card-body">
                                <div class="map" id="map-3"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Elevation locations</h4>
                            </div>
                            <div class="card-body">
                                <div id="map-4" class="map"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Geolocation</h4>
                            </div>
                            <div class="card-body">
                                <div class="map" id="map-5"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>KML layers</h4>
                            </div>
                            <div class="card-body">
                                <div id="map-6" class="map"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->


                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Layers</h4>
                            </div>
                            <div class="card-body">
                                <div class="map" id="map-7"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>Map events</h4>
                            </div>
                            <div class="card-body">
                                <div class="map" id="map-8"></div>
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


    <!-- Gmaps -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2jlT6C_to6X1mMvR9yRWeRvpIgTXgddM"></script>
    <script src="${contextPath }/resources/companyCss/vendors/gmaps/gmaps.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/gmap/gmap.init.js"></script>

</body>

</html>
