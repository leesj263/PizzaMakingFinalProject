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
<style>
	#calendar td:hover{
		background : lightgray !important; 
	}
</style>
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
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        
	<div class="content mt-3" >
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">본사 메세지</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered" style = "table-layout : fixed; word-wrap : break-word;">
                                    <thead>
                                        <tr>
                                            <th style = "width : 10%">번호</th>
                                            <th style = "width : 10%">분류</th>
                                            <th style = "width : 20%">제목</th>
                                            <th style = "width : 45%">내용</th>
                                            <th style = "width : 15%">게시일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>공지</td>
                                            <td>업체페이지 구조조정안내</td>
                                            <td style = "overflow:hidden; text-overflow: ellipsis;">11월부터 업체 페이지의 전체적인 구조 수정이 있습니다</td>
                                            <td>2019.01.21</td>
                                        </tr>
                                        <tr>
                                        	<td>2</td>
                                            <td>경고</td>
                                            <td>사당지점 경고안내</td>
                                            <td style = "overflow:hidden; text-overflow: ellipsis;">배달원의 태도문제로 인한 지속적인 불만접수가 있습니다. 직원에 대한 교육 부탁드립니다.</td>
                                            <td>2019.01.23</td>
                                        </tr>
                                      	<tr>
                                      		<td>3</td>
                                            <td>이벤트</td>
                                            <td>룰렛이벤트 안내</td>
                                            <td style = "overflow:hidden; text-overflow: ellipsis;">1월부터 룰렛이벤트를 실시합니다. 이벤트 기간은 2월 1일부터 2월 15일까지입니다. 각 지점 점주분들께서는 이점 유의해주시기 바랍니다,</td>
                                            <td>2019.01.25</td>
                                      	</tr>
                                      	<tr>
                                      		<td>4</td>
                                            <td>이벤트</td>
                                            <td>기프티콘 쿠폰 이벤트 안내</td>
                                            <td style = "overflow:hidden; text-overflow: ellipsis;">2019년 베스트판매자로 선정시 10,000원 기프티콘 지급 이벤트를 진행중입니다. 이에 대한 자세한 문의는 본사전화문의를 통해 숙지바랍니다.</td>
                                            <td>2019.01.26</td>
                                      	</tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        
        
        
        <div class="content mt-3" >
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">업체 달력</strong>
                            </div>
                            <div class="card-body">
                                <table id="calendar" border = "1px"  align="center" style="border-color : black;width : 95%; height : 500px; background : white">
							    	<tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
								        <td align = "center" onclick="prevCalendar()"><i class="fa fa-arrow-left" ></i></td>
								        <td align="center" id="tbCalendarYM" colspan="5">
								        yyyy년 m월</td>
								        <td align = "center" onclick="nextCalendar()"><i class="fa fa-arrow-right" ></i></td>
								    </tr>
								    <tr style = "background : #F2F2F2">
								        <td align="center"><font color ="#F79DC2">일</td>
								        <td align="center">월</td>
								        <td align="center">화</td>
								        <td align="center">수</td>
								        <td align="center">목</td>
								        <td align="center">금</td>
								        <td align="center"><font color ="skyblue">토</td>
								    </tr> 
								</table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
	

    </div><!-- /#right-panel -->
	
	
	
    <!-- Right Panel -->

<script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); //달력 cell 만들어 출력 
        }
 
        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();//달력 cell 만들어 출력
        }
        function buildCalendar(){//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
            //열을 지워줌
            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
             }
             var row = null;
             row = tbCalendar.insertRow();
             //테이블에 새로운 열 삽입//즉, 초기화
             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
             for (i=0; i<doMonth.getDay(); i++) {
             /*이번달의 day만큼 돌림*/
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
             }
            /*달력 출력*/
             for (i=1; i<=lastDate.getDate(); i++) { 
             //1일부터 마지막 일까지 돌림
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cell.innerHTML =  
                  "<table width = '100%'>"+
                 	 "<tr>"+
                  		"<td rowspan = '4'>"+ i +"</td>"+
                 	 "</tr>"+
                 	 "<tr>"+
                 		 "<td align = 'right'></td>"+
                 	 "</tr>"+
                 	 "<tr>"+
	            		 "<td align = 'right'></td>"+
	            	 "</tr>"+
	            	 "<tr>"+
		         		 "<td align = 'right'></td>"+
		         	 "</tr>"+
                  "</table>";
                  //cell.style.background = "lightgray";//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
              if (cnt % 7 == 1) {/*일요일 계산*/
                  //1주일이 7일 이므로 일요일 구하기
                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                cell.innerHTML = 
                "<table width = '100%'>"+
	            	 "<tr>"+
	             		"<td rowspan = '4'>"+ "<font color=#F79DC2>" + i +"</td>"+
	            	 "</tr>"+
	            	 "<tr>"+
	            		 "<td align = 'right'></td>"+
	            	 "</tr>"+
	            	 "<tr>"+
	           		 	"<td align = 'right'></td>"+
		           	 "</tr>"+
		           	 "<tr>"+
		         		 "<td align = 'right'></td>"+
		         	 "</tr>"+
	             "</table>";
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = 
                  "<table width = '100%'>"+
	              	 "<tr>"+
	               		"<td rowspan = '4'>"+ "<font color=skyblue>" + i +"</td>"+
	              	 "</tr>"+
	              	 "<tr>"+
	              		 "<td align = 'right'></td>"+
	              	 "</tr>"+
	              	 "<tr>"+
		            		 "<td align = 'right'></td>"+
	            	 "</tr>"+
	            	 "<tr>"+
		         		 "<td align = 'right'></td>"+
		         	 "</tr>"+
	               "</table>";
                  //7번째의 cell에만 색칠
                  row = calendar.insertRow();
                   //토요일 다음에 올 셀을 추가
              }
              /*오늘의 날짜에 노란색 칠하기*/
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
               }
             }
        }
    </script>
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
    <script language="javascript" type="text/javascript">
    buildCalendar();//
	</script>


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
