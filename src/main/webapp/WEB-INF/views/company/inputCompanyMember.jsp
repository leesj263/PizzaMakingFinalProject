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
	<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>

<style>
	#inputForm{
		position : relative;
		left : 25%;
	}
</style>
<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	
	 <div id="right-panel" class="right-panel">

        <jsp:include page="companyHeader.jsp"></jsp:include>
       
        <div class="content mt-3">
            <div class="animated fadeIn">

                <div class="row">

                    <div id = "inputForm" class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>지점 직원 추가</strong> <small> 직원 정보 입력</small>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label">직급</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-briefcase"></i></div>
                                       <!--  <input  type = "text" name = "rank" class="form-control" > -->
                                       <select id = "rankSelect" style= "width : 30%; border-radius : 5px">
                                       	<option value = "">직급</option>
                                       	<option value = "manager">점장</option>
                                       	<option value = "cook">요리사</option>
                                       	<option value = "delivery">배달원</option>
                                       	<option value = "partTime">아르바이트</option>
                                       </select>
                                    </div>
                                    <small class="form-text text-muted">ex. 점장, 요리사, 배달원, 아르바이트</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">이름</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-male"></i></div>
                                        <input type = "text" name = "name" class="form-control">
                                    </div>
                                        <small class="form-text text-muted">ex. 홍길동</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">번호</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <input type = "tel" name = "phone" class="form-control">
                                    </div>
                                    <small class="form-text text-muted">ex. 010-1234-5678</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">주소</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-home"></i></div>
                                        <input type = "text" name = "address" class="form-control">
                                    </div>
                                    <small class="form-text text-muted">ex. 서울시 서초구 방배1동 123가길 45 101호</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">입사일</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <input type = "date" name = "date" class="form-control">
                                    </div>
                                    <small class="form-text text-muted">ex. 2019-01-27</small>
                                </div>
                                <button id = "employeeAddBtn" type="button" class="btn btn-primary" onclick = "inputEmployeeInfo()"><i class="fa fa-sign-in"></i>&nbsp; 입력</button>
                       			<button id = "backBtn" type="button" class="btn btn-secondary" onclick = "location.href = 'movePage.com?movePage=CompanyEmployeeList'"><i class="fa fa-mail-reply"></i>&nbsp; 취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        
        
     </div>
     
     <script>
     	function inputEmployeeInfo(){
     		/* console.log($("input[name='rank']").val());
     		console.log($("input[name='name']").val());
     		console.log($("input[name='phone']").val());
     		console.log($("input[name='address']").val());
     		console.log($("input[name='date']").val()); */
     		
     		//여기서 나중에 업체번호도 보내기
     		var inputRank = $("#rankSelect").val();
     		var inputName = $("input[name='name']").val();
     		var inputPhone = $("input[name='phone']").val();
     		var inputAddress = $("input[name='address']").val();
     		var inputDate = $("input[name='date']").val();
     		var comNo = "${sessionScope.loginUser.comNo }";
     		
     		$.ajax({
     			url : "inputEmployeeInfo.com",
     			data : {
     				comNo : comNo,
     				inputRank : inputRank,
     				inputName : inputName,
     				inputPhone : inputPhone,
     				inputAddress : inputAddress,
     				inputDate : inputDate},
     			type : "get",
     			success : function(data){
     				location.href = "selectEmployeeList.com?comNo=${sessionScope.loginUser.comNo }";
     			},
     			error : function(data){
     				console.log(data);
     			}
     		});
     	}
     </script>
</body>
</html>