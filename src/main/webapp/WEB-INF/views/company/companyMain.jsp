<!doctype html>
<%@page import="com.kh.pmfp.company.model.vo.CompanyBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@   taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!-- ${sessionScope.loginUser.comNo }  -->

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
    <script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	#calendar td:hover{
		background : lightgray !important; 
	}
	
	.adminMessageTr:hover{
		background : lightgray !important; 
	}
	td {
		table-layout: fixed;

	}
	table{
		table-layout: fixed;

 	  
	}
</style>
<script>
	idDate = "";
	temp = 0;
</script>
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
                                            <th style = "width : 10%">게시글<br>번호</th>
                                            <th style = "width : 10%">분류</th>
                                            <th style = "width : 20%">제목</th>
                                            <th style = "width : 45%">내용</th>
                                            <th style = "width : 15%">게시일</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <%-- <c:out value="${adminMessage[1]}"></c:out> --%>
                                    <c:forEach items = "${adminMessage}" var = "value">
                                    	<tr class = "adminMessageTr" onclick = "location.href = 'detailAdminMessage.com?boardNo=${value.boardNo}'" style = "cursor : pointer;">
                                            <td>${value.boardNo}</td>
                                            <c:if test="${value.boardCateG == 1 }">
                                            	<td>안내</td>
                                            </c:if>
                                            <c:if test="${value.boardCateG == 2 }">
                                           	 	<td>공지</td>
                                            </c:if>
                                            <c:if test="${value.boardCateG == 3 }">
                                            	<td>경고</td>
                                            </c:if>
                                            <c:if test="${value.boardCateG == 4 }">
                                            	<td>이벤트</td>
                                            </c:if>
                                            <%-- <td>${value.boardCateG}</td> --%>
                                            <td>${value.boardTitle}</td>
                                            <td style = "overflow:hidden; text-overflow: ellipsis;">
                                            
                                            <c:set var="contentLength" value="${value.boardContent}" />
                                          
                                            ${ fn:substring( contentLength, 0, 30)}...
                                           
                                            </td>
                                            <td>${value.boardDate}</td>
                                        </tr>
                                    	</c:forEach>
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
                                <table id="calendar" border = "1px"  align="center" style="border-color : black;width : 95%; height : 600px; background : white">
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
 
        function test(){
        	
			var memberCalendarList = "${memberCalendar}";
			
			//console.log(memberCalendarList);
			
			
			var memberCalendarData = memberCalendarList.split(',');
			var listSize = memberCalendarData.length/5;
			var memberCalendarDataCateG = [];
			var memberCalendarDataContent = [];
			var memberCalendarDataDate = [];
			
			var arrIndexCateG = 1;
			var arrIndexContent = 2;
			var arrIndexDate = 3;
			
			for(var i = 0; i < listSize; i++){
				memberCalendarDataCateG[i] = memberCalendarData[arrIndexCateG];
				arrIndexCateG = arrIndexCateG + 5;
			} 
			
			for(var i = 0; i < listSize; i++){
				memberCalendarDataContent[i] = memberCalendarData[arrIndexContent];
				arrIndexContent = arrIndexContent + 5;
			} 
			
			for(var i = 0; i < listSize; i++){
				memberCalendarDataDate[i] = memberCalendarData[arrIndexDate];
				arrIndexDate = arrIndexDate + 5;
			}
			
			/* console.log("listSize : " + listSize);
			console.log("arrIndexCateG : " + arrIndexCateG);
			console.log("arrIndexContent : " + arrIndexContent);
			console.log("arrIndexDate : " + arrIndexDate); */
			
			/* console.log("memberCalendarData : " + memberCalendarData);
			console.log("memberCalendarDataCateG : " + memberCalendarDataCateG);
			console.log("memberCalendarDataContent : " + memberCalendarDataContent);
			console.log("memberCalendarDataDate : " + memberCalendarDataDate); */
			
			var calendarCateG= [];
			var calendarContent= [];
			var calendarDate= [];
			
			for(var i = 0; i < memberCalendarDataCateG.length ; i++){
				calendarCateG[i] = memberCalendarDataCateG[i].split('=')[1];
			}
			
			for(var i = 0; i < memberCalendarDataContent.length ; i++){
				calendarContent[i] = memberCalendarDataContent[i].split('=')[1];
			}
			
			for(var i = 0; i < memberCalendarDataDate.length ; i++){
				calendarDate[i] = memberCalendarDataDate[i].split('=')[1];
			}
			
			/* console.log("calendarCateG : " + calendarCateG);
			console.log("calendarContent : " + calendarContent);
			console.log("calendarDate : " + calendarDate); */
			
			
			for(var i = 0; i < calendarDate.length ; i++){
				calendarDate[i] = calendarDate[i].split('-')[0]+ "-" + parseInt(calendarDate[i].split('-')[1]) + "-" +parseInt(calendarDate[i].split('-')[2]);
			}
			
			console.log("calendarCateG : " + calendarCateG);
			console.log("calendarContent : " + calendarContent);
			console.log("calendarDate : " + calendarDate);
			
			
			var nowDate = new Date();
			nowDate = nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" +nowDate.getDate();
			console.log("nowDate : " + nowDate);
			var nowContent = "";
			
			for(var i = 0; i < calendarDate.length ; i++){
				$("#"+calendarDate[i]).css({"table-layout" : "fixed"});
				$("#"+calendarDate[i] + " #" + calendarCateG[i]).css({"font-size" : "0.6em", "padding" : "0px", "margin" : "0px", "border" : "0", "max-height" : "2px"}).text(calendarContent[i]);		
				//$("#"+calendarDate[i] + " #" + calendarCateG[i]).parent().css({"padding" : "0px", "margin" : "0px", "border" : "0","max-height" : "2px"});
				if(nowDate == calendarDate[i]){
					nowContent += calendarCateG[i] + " : " + calendarContent[i] + "\n";
					
				}
			}
			
			if(nowContent != "" && temp == 0){
				swal("금일 일정 안내\n"+nowContent);
				temp = 1;
			}
			
			
			
			
			/* for(var i = 0; i < splitArr2.length ; i++){
				mater[i] = mater[i].split("]")[0];
			}  */
			
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
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            var tbCalendar = document.getElementById("calendar");
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
            idDate = today.getFullYear() + "-" + (today.getMonth() + 1);

            while (tbCalendar.rows.length > 2) {

                  tbCalendar.deleteRow(tbCalendar.rows.length-1);

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
                  cell = row.insertCell();
                  cell.innerHTML =  
                  "<table width = '100%' height = '90px' onclick = 'calendarTd(this)' id = '"+ idDate + "-" + i + "'>"+
                 	 "<tr >"+
                  		"<td  rowspan = '4' width = '15%'>"+ i +"</td>"+
                 	 "</tr>"+
                 	 "<tr>"+
                 		 "<td  align = 'right' id = '1'></td>"+
                 	 "</tr>"+
                 	 "<tr>"+
	            		 "<td  align = 'right' id = '2'></td>"+
	            	 "</tr>"+
	            	 "<tr>"+
		         		 "<td  align = 'right' id = '3'></td>"+
		         	 "</tr>"+
                  "</table>";

                  cnt = cnt + 1;
              if (cnt % 7 == 1) {

                cell.innerHTML = 
                "<table width = '100%' height = '90px' onclick = 'calendarTd(this)' id = '"+ idDate + "-" + i + "'>"+
	            	 "<tr >"+
	             		"<td  rowspan = '4' width = '15%'>"+ "<font color=#F79DC2>" + i +"</td>"+
	            	 "</tr>"+
	            	 "<tr>"+
	            		 "<td  align = 'right' id = '1'></td>"+
	            	 "</tr>"+
	            	 "<tr>"+
	           		 	"<td  align = 'right'  id = '2'></td>"+
		           	 "</tr>"+
		           	 "<tr>"+
		         		 "<td  align = 'right' id = '3'></td>"+
		         	 "</tr>"+
	             "</table>";
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = 
                  "<table width = '100%' height = '90px' onclick = 'calendarTd(this)' id = '"+ idDate + "-" + i + "'>"+
	              	 "<tr >"+
	               		"<td  rowspan = '4' width = '15%'>"+ "<font color=skyblue>" + i +"</td>"+
	              	 "</tr>"+
	              	 "<tr>"+
	              		 "<td  align = 'right'  id = '1'></td>"+
	              	 "</tr>"+
	              	 "<tr>"+
		            	"<td   align = 'right'  id = '2'></td>"+
	            	 "</tr>"+
	            	 "<tr>"+
		         		 "<td  align = 'right' id = '3'></td>"+
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
             test();
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
	
	
	<script>
		
		
			
		function calendarTd(btn){
			console.log($(btn).attr("id"));
			
			location.href = "calendarDetail.com?id="+$(btn).attr("id") + "&memberNo=${sessionScope.loginUser.memberNo }";
		}
		
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
