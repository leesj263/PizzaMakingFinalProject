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
    
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./"><img src="${contextPath }/resources/admin/images/logo.PNG" alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="#"> <i class="menu-icon fa fa-dashboard"></i>Dashboard</a>
                    </li>
                    <h3 class="menu-title">Member</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>User</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa fa-bars"></i><a href="#">List</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="#">Details</a></li>
                            <li><i class="fa fa-bars"></i><a href="#">Tabs</a></li>
                            <li><i class="fa fa-share-square-o"></i><a href="#">Social Buttons</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="#">Cards</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="#">Alerts</a></li>
                            <li><i class="fa fa-spinner"></i><a href="#">Progress Bars</a></li>
                            <li><i class="fa fa-fire"></i><a href="#">Modals</a></li>
                            <li><i class="fa fa-book"></i><a href="#">Switches</a></li>
                            <li><i class="fa fa-th"></i><a href="#">Grids</a></li>
                            <li><i class="fa fa-file-word-o"></i><a href="#">Typography</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Seller</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="#">Seller List</a></li>
                            <li><i class="fa fa-spinner"></i><a href="#">Wait Seller List</a></li>
                            <li><i class="fas fa-boxes"></i><a href="#">Seller Order List</a></li>
                            <li><i class="fa fa-spinner"></i><a href="#">Wait Seller List</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="#">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="#">Advanced Form</a></li>
                        </ul>
                    </li>

                    <h3 class="menu-title">Sales</h3><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="#">Font Awesome</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"> <i class="menu-icon fa fa-envelope"></i>Widgets </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="#">Chart JS</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="#">Flot Chart</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="#">Peity Chart</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="#">Google Maps</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="#">Vector Maps</a></li>
                        </ul>
                    </li>
                    <h3 class="menu-title">Board</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="#">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="#">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="#">Forget Pass</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </aside>
    