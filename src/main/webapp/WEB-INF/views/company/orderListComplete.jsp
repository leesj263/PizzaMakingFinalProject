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
        
        <div class="content mt-3" >
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                        
                        
                        <!-- 화면 전환 탭  -->
                        <div class="row">
					         <div class="col-lg-6">               
					                   <ul class="nav nav-tabs" id="myTab" role="tablist">
					                       <li class="nav-item">
					                           <a class="nav-link " href="movePage.com?movePage=orderListWaitting">대기중</a>
					                       </li>
					                       <li class="nav-item">
					                           <a class="nav-link"href="movePage.com?movePage=orderListMaking">제조중</a>
					                       </li>
					                       <li class="nav-item">
					                           <a class="nav-link"href="movePage.com?movePage=orderListDelivering" >배달중</a>
					                       </li>
					                       <li class="nav-item">
					                           <a class="nav-link active"  style = "background : #F7F7F7"  href="movePage.com?movePage=orderListComplete">배달완료</a>
					                       </li>
					                   </ul>
					       </div>
					      </div>
					      
					      
					      
					      
                            <div class="card-header">
                                <strong class="card-title">배달 완료 목록</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered" style = "table-layout : fixed; word-wrap : break-word;">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>주문고객</th>
                                            <th>고객번호</th>
                                            <th>주소</th>
                                            <th>추가토핑</th>
                                            <th>주문시간</th>
                                            <th>버튼</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                            <td>1</td>
                                            <td>minkyu112</td>
                                            <td>010-9972-5512</td>
                                            <td>방배3동 고가도로 212가길 18 301호</td>
                                            <td>치즈 20g, 새우 80g, 토마토소스</td>
                                            <td>19.01.17 19:03</td>
                                            <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                                        </tr>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                            <td>2</td>
                                            <td>tjnwn123</td>
                                            <td>010-6751-7715</td>
                                            <td>사당1동 남부순환로 212가길 18 502호</td>
                                            <td>불고기 50g, 치즈 80g, 토마토소스</td>
                                            <td>19.01.17 19:01</td>
                                            <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                                        </tr>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                            <td>3</td>
                                            <td>pizzaMan551</td>
                                            <td>010-2491-9905</td>
                                            <td>동작 2동 사이도로 117나길 5 5동 201호</td>
                                            <td>치즈 10g, 페페로니 180g, 데리야끼소스</td>
                                            <td>19.01.17 18:53</td>
                                            <td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        
        
    </div>
    
    
    
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/jszip/dist/jszip.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/pdfmake/build/vfs_fonts.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${contextPath }/resources/companyCss/vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
    <script src="${contextPath }/resources/companyCss/assets/js/init-scripts/data-table/datatables-init.js"></script>
    
    
    
</body>
</html>