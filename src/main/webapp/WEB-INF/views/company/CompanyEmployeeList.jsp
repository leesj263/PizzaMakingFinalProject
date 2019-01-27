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
<style>

	#employeeAddBtn{
		position : relative;
		left : 900px
	}
	#backBtn{
		position : relative;
		left : 930px
	}

    
</style>
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
                            <div class="card-header">
                                <strong class="card-title">업체 직원 관리</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered" style = "table-layout : fixed; word-wrap : break-word;">
                                    <thead>
                                        <tr>
                                        	<th></th>
                                            <th>번호</th>
                                            <th>직급</th>
                                            <th>이름</th>
                                            <th>번호</th>
                                            <th>주소</th>
                                            <th>입사일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                        	<td><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></td>
                                            <td>1</td>
                                            <td>점장</td>
                                            <td>황민규</td>
                                            <td>010-8857-3325</td>
                                            <td>방배3동 고가도로 212가길 18 301호</td>
                                            <td>2017.01.21</td>
                                        </tr>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                      		<td><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></td>
                                            <td>2</td>
                                            <td>요리사</td>
                                            <td>이석주</td>
                                            <td>010-4267-3325</td>
                                            <td>동작 2동 사이도로 117나길 5 5동 201호</td>
                                            <td>2018.01.21</td>
                                        </tr>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                        	<td><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></td>
                                            <td>3</td>
                                            <td>배달원</td>
                                            <td>김예솔</td>
                                            <td>010-7467-5795</td>
                                            <td>사당1동 남부순환로 212가길 18 502호</td>
                                            <td>2018.01.21</td>
                                        </tr>
                                        <tr class = "adminMessageTr" style = "cursor : pointer;">
                                        	<td><input type = "checkbox" name= "checkComMember" style = "width : 20px; height : 20px"></td>
                                            <td>4</td>
                                            <td>배달원</td>
                                            <td>유솔이</td>
                                            <td>010-6658-2545</td>
                                            <td>서초 2동 사이도로 117나길 5 5동 201호</td>
                                            <td>2018.01.21</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <button id = "employeeAddBtn" type="button" class="btn btn-primary" onclick = "location.href = 'movePage.com?movePage=inputCompanyMember'"><i class="fa fa-sign-in"></i>&nbsp; 입력하기</button>
                        <button id = "backBtn" type="button" class="btn btn-secondary"><i class="fa fa-sign-out"></i>&nbsp; 삭제하기</button>
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