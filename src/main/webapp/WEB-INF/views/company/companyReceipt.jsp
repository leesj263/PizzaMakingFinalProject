<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<button onclick="sendMsg()" type="button" class="btn btn-primary"
						style="width: 150px">명세서 확인</button>
					<button onclick="location.href = 'selectAllMaterialList.com'"
						type="button" class="btn btn-secondary" style="width: 150px">취소</button>
				</div>
			</div>

		</div>
	</div>
	<!-- <form name='form' method='post' action='http://www.skysms.co.kr/apiSend/sendApi_UTF8.php'>
		<input type='hidden' name='sUserid' value='kan47'>
		회원 UserId, 필수입력정보 9원문자 회원가입 시 발급
		<input type='hidden' name='authKey'
			value='5Uo7qX5vrt1nV7DBh8TQFujP3G433qUR'>
		회원 인증키, 필수입력정보 9원문자 회원가입,연동신청  후 발급
		<input type='hidden' name='sendMsg' value='제대로 가나?'>
		전송할 메세지 내용, 필수입력정보
		<input type='hidden' name='destNum' value='01095902959'>
		받는분 휴대폰번호, 필수입력정보 대량전송의 경우 |로 구분하여 입력해주시기 바랍니다. 01000000000|01000000001|01000000002
		<input type='hidden' name='callNum' value='01095902959'>
		보내는분 전화번호, 필수입력정보
		<input type='hidden' name='sMode' value='Test'>
		실제전송과 테스트전송을 구분하는 변수, 필수입력정보, 테스트전송(Test) or 실전송(Real) 기본값 : Test 
		<input type='hidden' name='sendDate' value=''>
		전송시간설정(예약), 선택옵션 입력정보, 값이없거나 지난 시간의 경우 즉시발송 형식을 지켜주시기 바랍니다.
		<input type='hidden' name='returnURL' value=''>
		전송 후 이동할 사이트 URL, 선택옵션 입력정보, 결과코드,완료건수,실패건수,남은건수등을 받아볼수 있습니다.
		<input type='hidden' name='customVal' value=''>
		사용자정의 변수, 선택옵션 입력정보, 회원님께서 임의로 지정한 변수를 사용할수 있습니다. 변수명^값|변수명^값
		<input type='hidden' name='sType' value='SMS'>
		짧은문자와 장문문자를 구분하는 변수, 선택입력정보, 짧은문자(SMS) or 장문문자(LMS) 기본값 : SMS
		<input type='hidden' name='sSubject' value=''>
		sType의 값이 LMS일 경우만 사용, 장문문자의 제목, 최대길이 한글20자이내설정, 기본값:장문메세지
	</form> -->
	
	<form method="post" id="smsForm">
    <ul>
      <li>보낼사람 : <input type="text" name="from"/></li>
      <li>내용 : <textarea name="text"></textarea></li>
      <li><input type="button" onclick="sendSMS('sendExampleMsg.com')" value="전송하기" /></li>
    </ul>
  </form>

  <script>
    function sendSMS(pageName){

    	console.log("문자를 전송합니다.");
    	$("#smsForm").attr("action", pageName);
    	$("#smsForm").submit();
    }
  </script>
	<script type="text/javascript">
		function sendMsg() {
			//location.href = "sendExampleMsg.com";
			/* $.ajax({
				url : "https://rest.coolsms.co.kr/messages/v4/send",
				Headers : {
					Authorization : HMAC-SHA256 apiKey=NCSGX2TG8G6ONABL, 
					date=2018-07-04T00:06:38Z, 
					salt=jqskl8jj6d3xwj, 
					signature=7ceff00b74f9c242e8593c3be851d3431a00739c61d53f45e23e38d5fa6aa70e
				}
				data : {
					sUserid : "kan47",
					authKey : "5Uo7qX5vrt1nV7DBh8TQFujP3G433qUR",
					sendMsg : "제대로 가나?",
					destNum : "01095902959",
					callNum : "01095902959",
					sMode : "Test",
					sType : "SMS"
					},
				type : "post",
				success : function(data){
					console.log(data);
				},
				error : function(data){
					console.log(data);
				}
			}); */
			
			document.form.submit();
			//$("form[name='form']").submit();
			
		}
	</script>
</body>
</html>