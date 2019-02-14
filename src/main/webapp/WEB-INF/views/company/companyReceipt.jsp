<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<script>
	allPrice = 0;
</script>
</head>

<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<strong class="card-title">요금 명세서</strong>
				</div>
				<div class="card-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">토핑</th>
								<th scope="col">중량</th>
								<th scope="col">신청자</th>
								<th scope="col">신청날짜</th>
								<th scope="col">가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="value">
								<tr>
									<td>${ value.materialName }</td>
									<td>${ value.materialWeight }KG</td>
									<td>황민규</td>
									<!-- 나중에 로그인 되면 로그인세션에서 받아오기 -->
									<td>${ value.orderMDate }</td>
									<td class="materialPriceTd">${ value.materialPrice }</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="4" style="text-align: right; font-size: 1.3em"><b>결제
										예정 금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td style="color: red"><b style="font-size: 1.3em"
									id="resultPlace"></b>원</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>

		<script>
			$(function() {
				$(".materialPriceTd").each(function() {
					allPrice += parseInt($(this).text());
				});
				$("#resultPlace").append(allPrice);
			});
		</script>


		<div class="content mt-3">

			<div class="col-lg-8" style="background: lightgray;">
				<img
					src="${contextPath }/resources/companyCss/images/Smartphone-Message-icon.png"
					style="width: 50px; height: 50px">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				명세서 확인 클릭시 명세서가 스마트폰으로 전송됩니다!
			</div>
			<div class="col-lg-4">
				<div align="right">
					<button type="button" class="btn btn-primary" style="width: 150px"
						data-toggle="modal" data-target="#smallmodal">명세서 확인</button>
					<button onclick="location.href = 'selectAllMaterialList.com'"
						type="button" class="btn btn-secondary" style="width: 150px">취소</button>
				</div>
			</div>

		</div>
	</div>





	<div class="modal fade" id="smallmodal" tabindex="-1" role="dialog"
		aria-labelledby="smallmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="smallmodalLabel">스마트폰 번호 입력</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" id="smsForm">
						번호입력 : <input type="text" name="from" style="border-radius: 5px" />
						<input type = "hidden" name="text" value = '
						[피자학교]업체 재고 결제 내역안내
						안녕하세요, 점주님의 이번달 주문내역과 결제내역을 안내해드립니다!점주님께서는 이번달 말일까지  해당 계좌로 입금부탁드립니다
						(국민은행  936801-01-883641 김미정)
						▣결제예정품목
						<c:forEach items="${list}" var="value">
							◆재료 : ${ value.materialName }(${ value.materialWeight }KG), 
							◆주문일자 : ${ value.orderMDate }, 
							◆재료 가격  : ${ value.materialPrice }, 
						</c:forEach>'/>
						<!-- 명세서 내역 입력  -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="sendSMS('sendExampleMsg.com')" value="전송하기">전송</button>
				</div>
			</div>
		</div>
	</div>


	<script>
    function sendSMS(pageName){
		//전송해야되는 명세서 내용을 text에 담아 전송
		var text = $("input:hidden[name='text']").val();
		$("input:hidden[name='text']").val(text + " 총 금액 : " + allPrice);
		var listSize = "${fn:length(list)}";
		var labelDataArr;
		labelDataArr = '${list}';
		
		//console.log(labelDataArr);
		console.log($("input:hidden[name='text']").val());
		
    	console.log("문자를 전송합니다.");
    	$("#smsForm").attr("action", pageName);
    	$("#smsForm").submit();
    }
  </script>

</body>
</html>