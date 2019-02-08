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
		for (i = 1; i < 9; i++) { //10이라는 수는 줄수보다 1 더한값을 적어주세요//
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
			<div class="ui button">가맹점문의 및 기타</div>
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
				onClick="clickblock(1)"><h3>본사에서 입지선정도 해주나요?</h3></td>
		</tr>
		<tr id="block1" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 셀프피자제작소는 기본적으로 입점 가능한 입지조건 규정을
					운영하고 있으며 본사 기준에 의한 절차 후 입지 선정도 해드립니다.</h4></td>
		</tr>
		<tr></tr>
		<tr align="center">
			<td width="5" height="23"><h1>Q2</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(2)"><h3>가맹계약후 오픈까지 얼마나 걸리나요?</h3></td>
		</tr>
		<tr id="block2" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-가맹계약이 후 오픈 까지는 인테리어공사 3주~4주 및 오픈
					할 매장에서의 교육 2주를 포함하여 5주~6주 정도 소요됩니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q3</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(3)"><h3>교육시간은 얼마나 걸리나요?</h3></td>
		</tr>
		<tr id="block3" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 론교육과 매장 교육 등을 포함하여 총 7주~8주 정도(오픈
					할 매장 교육 포함) 소요되며, 점주 외 2인 이상 교육을 실시합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q4</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(4)"><h3>가맹점 관련하여 전화로 상담을 하고 싶습니다.</h3></td>
		</tr>
		<tr id="block4" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-전화 문의는 본사 점포개발팀 02-596-3300
					(ARS에서 셀프피자제작소 선택후 1번) 으로 주시면 자세하게 상담 받으실 수 있습니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q5</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(5)"><h3>매장 가맹 문의를 하고 싶습니다. 어떻게 해야 하나요?</h3></td>
		</tr>
		<tr id="block5" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-q&a 게시판에 글을 남겨주시면 담당 점포개발팀에서 확인 후
					메일이나 전화로 답변을 드립니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q6</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(6)"><h3>오픈 후 가맹점 사후 관리는 어떻게 하나요?</h3></td>
		</tr>
		<tr id="block6" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-본사 슈퍼바이저들의 정기적인 방문을 통해 각 점포의 매출
					향상과 안정적인 운영을 도와드리고 있습니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q7</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(7)"><h3>주문진행이 원활하지 않을 때 어떻게 하나요?</h3></td>
		</tr>
		<tr id="block7" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-피자셀프제작소 홈페이지는 익스플로어 8 이상 버전에 최적화
					되어있습니다. 크롬 및 사파리 등 다른 OS 환경에서는 사용이 원활하지 않을 수 있습니다. 메뉴가 정상적으로 표시되지
					않을시, 익스플로어 버전확인 및 호환성 보기 체크 해주시기 바랍니다. 익스플로러: [도구] – [호환성보기설정] –
					[추가]</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q8</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(8)"><h3>주소 및 이름이 깨져나올 땐 어떻게 하나요?(?또는
					특수문자)</h3></td>
		</tr>
		<tr id="block8" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-글자 깨짐 현상 발생 시, 아래와 같이 인코딩 타입을
					수정하시기 바랍니다. 익스플로러 메뉴의 [보기] - [인코딩] - [유니코드UTF-8] 선택 화면 중 이미지/텍스트가
					없는 곳에서 마우스 오른쪽 버튼 클릭 [인코딩] – [유니코드UTF-8] 선택</h4></td>
		</tr>

		

	</table>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
</html>