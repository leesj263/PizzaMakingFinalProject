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
                <a class="navbar-brand" href="goMain.com?memberNo=${sessionScope.loginUser.memberNo }"><img style = "width : 20%" src="${contextPath }/resources/companyCss/images/pizzaLogo.png" alt="Logo">셀프 피자 제작소</a>
                
                <a class="navbar-brand hidden" href="goMain.com?memberNo=${sessionScope.loginUser.memberNo }"><img src="${contextPath }/resources/companyCss/images/pizzaLogo.png" alt="Logo"></a>
                
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="goMain.com?memberNo=${sessionScope.loginUser.memberNo }"> <i class="menu-icon fa fa-home"></i>메인페이지 </a>
                    </li>
                    <h3 class="menu-title">ORDER</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cutlery"></i>주문목록</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-mobile-phone"></i><a href="orderWaiting.com?comNo=${sessionScope.loginUser.comNo }">주문 대기중 목록</a></li>
                            <li><i class="menu-icon fa fa-spinner"></i><a href="orderMaking.com?comNo=${sessionScope.loginUser.comNo }">제조중 목록</a></li>
                            <li><i class="menu-icon fa fa-truck"></i><a href="orderDelivering.com?comNo=${sessionScope.loginUser.comNo }">배달중 목록</a></li>
                            <li><i class="menu-icon fa fa-thumbs-o-up"></i><a href="orderComplete.com?comNo=${sessionScope.loginUser.comNo }">배달완료 목록</a></li>
                            <li><i class="menu-icon fa fa-trash-o"></i><a href="orderRefuseList.com?comNo=${sessionScope.loginUser.comNo }">거절&삭제 목록</a></li>

                        </ul>
                    </li>
                   

                    <h3 class="menu-title">RESOURCE</h3><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-group"></i>직원관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-bars"></i><a href="selectEmployeeList.com?comNo=${sessionScope.loginUser.comNo }">직원 목록</a></li>
                            <li><i class="menu-icon fa fa-edit"></i><a href="movePage.com?movePage=inputCompanyMember">직원 정보 입력</a></li>
                        </ul>
                    </li>
                   <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>재고관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="selectAllMaterialList.com?comNo=${sessionScope.loginUser.comNo }">재고 내역</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="orderStrok.com">재고 신청</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="selectOrderStockList.com?comNo=${sessionScope.loginUser.comNo }">신청 내역</a></li>
                            <li><i class="menu-icon fa fa-credit-card"></i><a href="selectReceiptList.com?comNo=${sessionScope.loginUser.comNo }">결제 예정 품목</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-krw"></i>매출관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="selectAllCompanySales.com?comNo=${sessionScope.loginUser.comNo }">매출 내역</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="selectCompanySalesList.com?comNo=${sessionScope.loginUser.comNo }">매출 목록 리스트</a></li>
                        </ul>
                    </li>

                    <h3 class="menu-title">Extras</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-comments"></i>업체 후기</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="selectCompanyReview.com?comNo=${sessionScope.loginUser.comNo }">업체 후기 작성</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->


</body>
</html>