<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	
    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">
	
	
    <link rel="stylesheet" href="${contextPath }/resources/companyCss/vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/companyCss/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/companyCss/vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="${contextPath }/resources/companyCss/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/companyCss/vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${contextPath }/resources/companyCss/vendors/jqvmap/dist/jqvmap.min.css">


    <link rel="stylesheet" href="${contextPath }/resources/companyCss/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <script src="${contextPath }/resources/companyCss/vendors/jquery/dist/jquery.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/main.js"></script>


    <script src="${contextPath }/resources/companyCss/vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/dashboard.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/widgets.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
</head>

<body>


    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="movePage.com?movePage=companyMain"><img style = "width : 20%" src="${contextPath }/resources/companyCss/images/pizzaLogo.png" alt="Logo">셀프 피자 제작소</a>
                
                <a class="navbar-brand hidden" href="movePage.com?movePage=companyMain"><img src="${contextPath }/resources/companyCss/images/pizzaLogo.png" alt="Logo"></a>
                
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="movePage.com?movePage=companyMain"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                    <h3 class="menu-title">UI elements</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Components</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-puzzle-piece"></i><a href="movePage.com?movePage=ui-buttons">Buttons</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="movePage.com?movePage=ui-badges">Badges</a></li>
                            <li><i class="fa fa-bars"></i><a href="movePage.com?movePage=ui-tabs">Tabs</a></li>
                            <li><i class="fa fa-share-square-o"></i><a href="movePage.com?movePage=ui-social-buttons">Social Buttons</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="movePage.com?movePage=ui-cards">Cards</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="movePage.com?movePage=ui-alerts">Alerts</a></li>
                            <li><i class="fa fa-spinner"></i><a href="movePage.com?movePage=ui-progressbar">Progress Bars</a></li>
                            <li><i class="fa fa-fire"></i><a href="movePage.com?movePage=ui-modals">Modals</a></li>
                            <li><i class="fa fa-book"></i><a href="movePage.com?movePage=ui-switches">Switches</a></li>
                            <li><i class="fa fa-th"></i><a href="movePage.com?movePage=ui-grids">Grids</a></li>
                            <li><i class="fa fa-file-word-o"></i><a href="movePage.com?movePage=ui-typgraphy">Typography</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Tables</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="movePage.com?movePage=tables-basic">Basic Table</a></li>
                            <li><i class="fa fa-table"></i><a href="movePage.com?movePage=tables-data">Data Table</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="movePage.com?movePage=forms-basic">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="movePage.com?movePage=forms-advanced">Advanced Form</a></li>
                        </ul>
                    </li>

                    <h3 class="menu-title">Icons</h3><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="movePage.com?movePage=font-fontawesome">Font Awesome</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="movePage.com?movePage=font-themify">Themefy Icons</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="movePage.com?movePage=widgets"> <i class="menu-icon ti-email"></i>Widgets </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="movePage.com?movePage=charts-chartjs">Chart JS</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="movePage.com?movePage=charts-flot">Flot Chart</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="movePage.com?movePage=charts-peity">Peity Chart</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="movePage.com?movePage=maps-gmap">Google Maps</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="movePage.com?movePage=maps-vector">Vector Maps</a></li>
                        </ul>
                    </li>
                    <h3 class="menu-title">Extras</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="movePage.com?movePage=page-login">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="movePage.com?movePage=page-register">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="movePage.com?movePage=pages-forget">Forget Pass</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="movePage.com?movePage=DetailAdminMessage">본사메세지 상세보기</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->


</body>
</html>