<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<title>Insert title here</title>
<!-- 테이블메뉴 스크립트 시작-->
<script language="javascript">
	function clickblock(num) {
		/* console.log($("<tr>")); */
		for (i = 1; i < 10; i++) { //10이라는 수는 줄수보다 1 더한값을 적어주세요//
			var left_menu = eval("block" + i + ".style");
			if (num == i) {
				if (left_menu.display == "") {
					left_menu.display = "none";
				} else {
					left_menu.display = "";
					/*  $("#block1").show(); */
				}
			} else {
				left_menu.display = "none";
			}
		}
	}
</script>
<!-- 테이블 메뉴 스크립트 끝-->
</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1>
		<b>FAQ</b>
	</h1>
	<br>


	<div align="center">

		<div class="ui basic buttons">
			<div class="ui button">
				<a href="../customer/faq/faqPayOrder.jsp">인터넷주문</a>
			</div>

			<div class="ui button">결제/쿠폰</div>
			<div class="ui button">회원정보</div>
			<div class="ui button">기타</div>
		</div>
	</div>


	<br>
	<br>
	<table width="600" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td colspan="" height="1" bgcolor="f4f4f4"></td>
		</tr>

		<tr align="center">
			<td width="5" height="23"><h1>Q1</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(1)"><h3>결제 수단에는 어떤 것들이 있으며 어떻게 결제해야
					하나요?</h3></td>
		</tr>
		<tr id="block1" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 카카오페이가 가능합니다.</h4></td>
		</tr>
		<tr></tr>
		<tr align="center">
			<td width="5" height="23"><h1>Q2</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(2)"><h3>주문을 완료 했는데 결제 수단을 변경하고 싶어요.</h3></td>
		</tr>
		<tr id="block2" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-결제수단의 변경은 배달 출발전일 경우 상담원을 통해 변경
					가능합니다. 단, 주문완료 후 쿠폰 및 할인적용을 위해 결제수단 변경을 요청 하실 경우 주문내역에 따라 불가할 수
					있습니다. 고객만족센터(080-500-5588, 오전10시 30분~오후10시 30분)로 문의해주세요.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q3</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(3)"><h3>내가 가지고 있는 쿠폰은 어디서 확인할 수 있나요?</h3></td>
		</tr>
		<tr id="block3" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 홈페이지 로그인하고 메뉴 - 마이페이지 - 쿠폰을 클릭하여
					확인하면 됩니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q4</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(4)"><h3>쿠폰 적용은 어떻게 하나요?</h3></td>
		</tr>
		<tr id="block4" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-주문/결제하기 페이지에서 4.할인적용의 쿠폰버튼을 클릭하여
					제품에 적용 가능한 마이쿠폰을 선택하거나 하단의 쿠폰번호 입력란에 할인쿠폰번호를 입력하여 적용합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q5</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(5)"><h3>쿠폰이 여러 장 있는데 한꺼번에 사용 가능하나요?</h3></td>
		</tr>
		<tr id="block5" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-기본적으로 1주문당 1개의 쿠폰만 사용 가능하며 할인이
					적용된 행사메뉴 , 세트메뉴 등에는 중복 할인이 불가합니다. 그러나 일부 중복 가능한 쿠폰일 경우 쿠폰 가이드에 따라
					중복 적용이 가능할 수 있습니다. 자세한 문의 사항은 온라인 고객 만족팀 080-500-5588 로 연락 주시기
					바랍니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q6</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(6)"><h3>1577-0077콜센터로 주문시 카드 / 휴대폰 결제가
					가능한가요?</h3></td>
		</tr>
		<tr id="block6" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-카드결제는 가능합니다만, 휴대폰 결제는 온라인/모바일
					주문시에만 가능합니다. (매장에 따라 일부카드는 사용이 제한될 수 있습니다.)</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q7</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(7)"><h3>쿠폰에 차액을 지불하고 피자 사이즈 또는 종류를 변경할
					수 있나요?</h3></td>
		</tr>
		<tr id="block7" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>쿠폰에 기재된 제품으로만 교환받으실 수 있습니다. 다른 상품,
					엣지 및 사이즈는 변경이 불가합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q8</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(8)"><h3>쿠폰 배달 주문 시, 유의해야 할 사항이 있나요?</h3></td>
		</tr>


		<tr id="block8" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-피자 포함 주문의 경우 배달에 제한이 없으나, 피자 미포함
					주문의 경우 결제금액이 12,000원 이상시에 배달주문이 가능합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q9</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(9)"><h3>결제내역 영수증을 출력하고 싶습니다.</h3></td>
		</tr>


		<tr id="block9" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-주문을 완료하신 후에 My Page > 주문/배송조회로
					이동합니다. 주문 번호를 클릭하신 후 주문 상세 페이지의 영수증 출력을 클릭하시면 해당 주문의 영수증을 출력할 수
					있습니다.</h4></td>
		</tr>

		




	</table>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
</html>