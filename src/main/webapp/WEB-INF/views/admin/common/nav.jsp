<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="apple-touch-icon" href="${contextPath }/resources/admin/images/apple-icon.png">
    <link rel="shortcut icon" href="${contextPath }/resources/admin/images/favicon.ico">

    <link rel="stylesheet" href="${contextPath }/resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/admin/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/admin/vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="${contextPath }/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/admin/vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${contextPath }/resources/admin/vendors/jqvmap/dist/jqvmap.min.css">

    <link rel="stylesheet" href="${contextPath }/resources/admin/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Right Panel -->

   <!--  <div id="right-panel" class="right-panel"> -->

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    
                </div>
                
                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            	메	뉴
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i> My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa-user"></i> Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa-cog"></i> Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power-off"></i> Logout</a>
                        </div>
                    </div>



                </div>
            </div>
	<!-- </div> -->
	
    <script src="${contextPath }/resources/admin/vendors/jquery/dist/jquery.min.js"></script>
    <script src="${contextPath }/resources/admin/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath }/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath }/resources/admin/assets/js/main.js"></script>


    <script src="${contextPath }/resources/admin/vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="${contextPath }/resources/admin/assets/js/dashboard.js"></script>
    <script src="${contextPath }/resources/admin/assets/js/widgets.js"></script>
    <script src="${contextPath }/resources/admin/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="${contextPath }/resources/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="${contextPath }/resources/admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>

