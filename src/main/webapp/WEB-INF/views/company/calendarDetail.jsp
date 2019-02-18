<!doctype html>
<%@page import="com.kh.pmfp.company.model.vo.CompanyBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@   taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




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
	.col-lg-8{
		position : relative;
		left : 15%;
	}
</style>
<script>
	temp = 0;
</script>
</head>
<body>

	<jsp:include page="companyMenubar.jsp"></jsp:include>

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>
		
	<!-- 	
		 -->
		
		
		<div class="col-lg-8">
			<div class="card">
				<div class="card-header">
					<strong>${ date }</strong> - 일정목록</em>
				</div>
				<div class="card-body card-block">
				<c:forEach items = "${list}" var = "value">
					<div class="has-success form-group"  calNo = "${value.calendarNo}">
							<label for="inputSuccess2i" class=" form-control-label" >등록된 일정 : &nbsp;&nbsp;</label><span>
							${value.calendarContent }</span><br>
							<button style = "position : relative; top : 5px" type="button" class="btn btn-danger" id = "${value.calendarNo}" onclick = "deleteCalendar(this)">삭제</button> 
							<button style = "position : relative; top : 5px" type="button" class="btn btn-warning" onclick = "modifyCalendar(this)">수정</button>
					</div>
					<br>
				</c:forEach>
				
					<div class="has-warning form-group">
						<label  for="inputWarning2i" class=" form-control-label">일정 등록 : &nbsp;&nbsp;</label><input style = "width : 100%;" type="text" id="inputWarning2i"
							class="form-control-warning form-control">
							<button style = "position : relative; top : 5px" type="button" class="btn btn-primary" onclick = "insertCalendar()">등록</button>
					</div>
					

				</div>
						<button type="button" class="btn btn-secondary" onclick = "location.href = 'goMain.com?memberNo=${sessionScope.loginUser.memberNo }'"><i class="fa fa-mail-reply"></i>돌아가기</button>
				
			</div>
			
		</div>
	</div>
<script>
	function insertCalendar(){
		var text = $("input[type='text']").val();
		var date = "${date}";
		var list = "${list}";
		var listSize = "${fn:length(list)}";
		console.log("text : " + text);
		console.log("date : " + date);
		console.log("listSize : " + listSize);
		//memberCode로 회사별 달력을 구분함, 임의로 memberNo를 100으로 입력
		var memberNo = "${sessionScope.loginUser.memberNo }";
		
		$.ajax({
			url : "insertCalendarData.com",
			data : {text : text,
				date : date,
				listSize : listSize,
				memberNo : memberNo},
			type : "get",
			success : function(data){
				location.href = "calendarDetail.com?id="+date+ "&memberNo=${sessionScope.loginUser.memberNo }";
				console.log(date);
			},
			error : function(data){
				console.log(date);
			}
		});
	}
	
	function modifyCalendar(btn){
		if(temp == 0){
			var date = "${date}";
			$(btn).parent().children("span").remove();
			$(btn).parent().children("label").append("<input id ='reflectModifyId' type = 'text'/>");
			
			$(btn).after("<button style = 'position : relative; top : 5px' type='button' class='btn btn-secondary' onclick = 'cancelModify()'>취소</button>&nbsp;&nbsp;");
			$(btn).after("<button style = 'position : relative; top : 5px' type='button' class='btn btn-primary'   onclick = 'reflectModify(this)'>등록</button>&nbsp;&nbsp;");
			$(btn).parent().children("button").eq(0).remove();
			$(btn).remove();
			temp = 1;
		}else{
			swal("수정중인 작업이 있습니다!");
		}
		
		
	}
	
	function cancelModify(){
		location.href = "calendarDetail.com?id=${ date }&memberNo=${sessionScope.loginUser.memberNo }";
	}
	
	function reflectModify(btn){
		var date = "${date}";
		var content = $("#reflectModifyId").val();
		console.log($("#reflectModifyId").val());
		var calendarNo = $(btn).parent().attr("calNo");
		console.log("calendarNo : " + calendarNo);
		var memberNo = "${sessionScope.loginUser.memberNo }";
		
		$.ajax({
			url : "reflectModify.com",
			data : {
				date : date,
				content : content,
				calendarNo : calendarNo,
				memberNo : memberNo
			},
			type : "get",
			success : function(data){
				location.href = "calendarDetail.com?id="+date+ "&memberNo=${sessionScope.loginUser.memberNo }";
				console.log(data);
			},
			error : function(data){
				console.log(data);
			}
		});
		
		
		
	}
	
	function deleteCalendar(btn){
		var date = "${date}";
		console.log("date : " + date);
		var list = "${list}";
		var listSize = "${fn:length(list)}";
		console.log("listSize : " + listSize);
		var calendarNo = $(btn).attr("id");
		console.log("calendarNo : " + calendarNo);
		var memberNo = "${sessionScope.loginUser.memberNo }";
		
		$.ajax({
			url : "deleteCalendarData.com",
			data : {
				date : date,
				listSize : listSize,
				calendarNo : calendarNo,
				memberNo : memberNo
			},
			type : "get",
			success : function(data){
				location.href = "calendarDetail.com?id="+date + "&memberNo=${sessionScope.loginUser.memberNo }";
				console.log(data);
			},
			error : function(data){
				console.log(data);
			}
		});
		
	}
</script>
	<script
		src="${contextPath }/resources/companyCss/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>
</body>
</html>