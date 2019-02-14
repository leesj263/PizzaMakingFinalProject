<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		for (i = 1; i < 20; i++) { //10이라는 수는 줄수보다 1 더한값을 적어주세요//
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
		<!-- <div class="ui basic buttons">
			<div class="ui button">
				<a href="../customer/faq/faqPayOrder.jsp">인터넷주문</a>
			</div>

			<div class="ui button">결제/쿠폰</div>
			<div class="ui button">회원정보</div>
			<div class="ui button">기타</div>
		</div> -->
		
	</div>


	<br>
	<br>
	<table width="600" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td colspan="" height="1" bgcolor="f4f4f4"></td>
		</tr>
		<c:forEach items="${faqOrder}" var ="faq">
			<tr align="center">
			<td width="10" height="23">
			<h1>Q${faq.rownum} 
			<%-- <c:choose>
			<c:when test="${faq.boardCateg==1}">결제</c:when>
			<c:when test="${faq.boardCateg==2}">주문</c:when>
			<c:when test="${faq.boardCateg==3}">공유/후기/질문답변</c:when>
			<c:otherwise>이벤트</c:otherwise>
			</c:choose> --%>
			</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(${faq.rownum})"><h3>${faq.boardTitle}</h3></td>
		</tr>
		<tr id="block${faq.rownum}" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- ${faq.boardContent}</h4></td>
		</tr>
		<tr></tr>
		</c:forEach>
		<!-- <tr align="center">
			<td width="5" height="23"><h1>Q1</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(1)"><h3>온라인 상에서 주문취소를 할 수 없나요?</h3></td>
		</tr>
		<tr id="block1" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 주문 취소는 콜센터(1577-0077)를 통해서만
					가능합니다. 매장에 취소 가능여부를 확인 후 콜센터로 문의하시기 바랍니다.</h4></td>
		</tr>
		<tr></tr>
		<tr align="center">
			<td width="5" height="23"><h1>Q2</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(2)"><h3>회원으로만 주문이 가능한가요?</h3></td>
		</tr>
		<tr id="block2" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-비회원으로도 주문은 가능합니다. 단, 회원 할인 혜택 및
					각종 이벤트 안내/ 참여는 셀프피자제작소 회원인 경우에게만 제공됩니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q3</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(3)"><h3>매장 상태에 따른 주문불가는 무엇인가요?</h3></td>
		</tr>
		<tr id="block3" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 주문하신 제품의 재고가 떨어졌거나, 배달 사원 부족, 주문
					폭주 혹은 매장의 불가피한 사정으로 인해 주문이 어려울 경우, 주문 불가 팝업이 뜨면서 온라인 주문을 하실 수 없습니다.
					결품된 메뉴 팝업이 뜰 경우에는 주문 제품을 변경하여 주문해주시고, 기타 사항 발생시에는 매장이나
					콜센터(1577-0077)로 전화하시어 매장 상태를 다시 한번 확인하신 후 주문 해주세요.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q4</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(4)"><h3>익일 예약 주문도 가능한가요?</h3></td>
		</tr>
		<tr id="block4" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-당일 예약주문만 가능합니다. (이벤트 또는 행사 진행시에는
					원활한 주문접수 및 배달진행을 위해 당일 예약주문도 불가능할 수 있습니다.)</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q5</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(5)"><h3>몇 시부터 주문이 가능한가요?</h3></td>
		</tr>
		<tr id="block5" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-셀프피자제작소는 오전 11시부터 10시까지 온라인 및 모바일
					주문이 가능합니다. (마감시간은 매장에 따라 상이할 수 있습니다.)</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q6</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(6)"><h3>그 동안 주문한 내역은 어디서 확인하나요?</h3></td>
		</tr>
		<tr id="block6" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-마이 페이지 > 주문내역을 통해 확인하실 수 있습니다.
단, 비회원 주문을 이용하셨을 경우 주문내역에서 확인되지 않으니 온라인 고객만족팀 080-500-5588 로 문의 주시기 바랍니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q7</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(7)"><h3>온라인으로 피자는 몇 판까지 주문 할 수 있나요?</h3></td>
		</tr>
		<tr id="block7" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>온라인 주문으로는 피자는 5판까지 주문이 가능합니다. 그 이상
					주문시에는 콜센터(1577-0077) 또는 인근 매장주문을 이용하여 주시기 바랍니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q8</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(8)"><h3>비회원으로 주문한 경우 주문/배송조회는 어디에서 할 수
					있나요?</h3></td>
		</tr>


		<tr id="block8" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-[비회원 주문조회]에서 가능합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q9</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(9)"><h3>주위에 배달가능한 매장이 없다고 나와요</h3></td>
		</tr>


		<tr id="block9" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-최상의 상태로 배달해 드리기 위해 구역이 책정되어 있습니다.
					따라서 배달시간이 오래 걸리는 지역일 때 배달불가라고 표시됩니다. 인근 매장에서 포장 주문으로 이용해 주세요.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q10</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(10)"><h3>주문 한 메뉴를 변경하거나 취소해야 할 경우에는
					어떻게 하나요?</h3></td>
		</tr>


		<tr id="block10" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-모든 제품이 주문 접수와 동시에 제조가 시작되어 주문 취소가
					어려울 수 있습니다. 주문취소 희망시 주문접수 후 3분 이내에 취소 가능여부를 주문매장으로 직접 확인 해주셔야 하며,
					매장을 통해 취소 가능함을 확인하신 경우 배달주문전화(1577-0077, 오전 11시~오후 10시 30분)로 취소신청을
					반드시 접수하셔야 합니다. ※ 주문매장 전화번호는 주문완료페이지 또는 [마이페이지 > 내주문내역]에서 확인이 가능합니다.</h4></td>
		</tr>
		<tr align="center">
			<td width="30" height="23"><h1>Q11</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(11)"><h3>배달 주문 이용 시 주문조건이 있나요?</h3></td>
		</tr>


		<tr id="block11" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-배달주문은 샐러드 메뉴 제외한 결제금액이 14,000원
					이상시에 이용 가능합니다. 주문 가능시간은 오전 11시부터 오후 10시까지입니다. (일부 매장은 매장 사정에 따라
					주문시간이 달라질 수 있습니다.)</h4></td>
		</tr>

 -->


	</table>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
</html>