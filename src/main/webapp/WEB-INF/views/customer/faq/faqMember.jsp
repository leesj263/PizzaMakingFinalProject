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
				onClick="clickblock(1)"><h3>인증번호 문자가 오지 않아요.</h3></td>
		</tr>
		<tr id="block1" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 메일수신이 스팸 메시지로 처리 된 건 아닌지 확인해보세요.
					스팸 메시지에도 확인 되지 않는다면 080-500-5588로 연락 주시기 바랍니다.</h4></td>
		</tr>
		<tr></tr>
		<tr align="center">
			<td width="5" height="23"><h1>Q2</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(2)"><h3>가입하려는 e-mail 주소가 이미 등록된 e-mail
					주소라고 나와요.</h3></td>
		</tr>
		<tr id="block2" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-가입하고자 하는 e-mail 주소가 이미 과거에 가입한
					기록이 있다면 동일한 e-mail 주소로 신규 가입은 불가하며 새로운 e-mail 주소로 가입하거나 또는 등록된
					e-mail 정보로 로그인하여 사용하시기 바랍니다. 단, 새로운 e-mail 주소로 가입 시 이전 정보와 통합은
					불가합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q3</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(3)"><h3>로그인이 안됩니다.</h3></td>
		</tr>
		<tr id="block3" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>- 아이디를 e-mail 주소 전체로 입력해보세요.
					비밀번호까지 정상적으로 입력 했음에도 안 된다면 080-500-5588 으로 연락 주시기 바랍니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q4</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(4)"><h3>아이디와 비밀번호를 모르겠어요.</h3></td>
		</tr>
		<tr id="block4" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-우선 아이디/비밀번호 찾기를 먼저 시도 해주세요. 생년월일
					및 휴대폰 번호는 등록된 정보로 검색해주세요. 그럼에도 검색되지 않는다면 080-500-5588 으로 연락 주시기
					바랍니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q5</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(5)"><h3>휴면상태 라고 나와요.</h3></td>
		</tr>
		<tr id="block5" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-1년 동안 홈페이지를 로그인하지 않은 경우 고객정보 보호를
					위해 휴면 계정으로 전환됩니다. 휴면계정은 복원이 가능하며 080-500-5588 로 전화 주시기 바랍니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q6</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(6)"><h3>등록된 제 정보를 변경하고 싶어요.</h3></td>
		</tr>
		<tr id="block6" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-E-mail , 생년월일, 이름 변경은
					080-500-5588 으로 전화 주시기 바라며 이외의 정보는 홈페이지 로그인 후 [마이 페이지] → [회원정보
					수정]에서 직접 변경 가능 합니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q7</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(7)"><h3>회원 탈퇴 방법을 알려주세요.</h3></td>
		</tr>
		<tr id="block7" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>회원 탈퇴는 홈페이지 로그인후 상단에 [마이 페이지] →
					[회원정보 수정]에서 하단에 [탈퇴] 를 클릭하여 진행하면 됩니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q8</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(8)"><h3>탈퇴 후 재가입은 가능한가요?</h3></td>
		</tr>
		<tr id="block8" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-네, 회원 탈퇴 후 재가입이 가능합니다. 단, 재가입 시
					기존ID는 사용이 불가능하며 신규ID로만 가입이 가능합니다. 기존 아이디로 사용하셨던 회원정보, 주문내역, 쿠폰은
					복원되지 않습니다.</h4></td>
		</tr>

		<tr align="center">
			<td width="30" height="23"><h1>Q9</h1></td>
			<td width="370" align="left" style="CURSOR: hand"
				onClick="clickblock(9)"><h3>아이디를 변경하고 싶어요.</h3></td>
		</tr>


		<tr id="block9" style="display: none">
			<td></td>
			<td bgcolor="F7F7F7"><h4>-아이디 변경을 원하실 경우 회원 탈퇴 후 새로운 아이디로
					재가입을 해주셔야 합니다. 기존 아이디로 사용하셨던 주문내역, 쿠폰은 복원되지 않습니다.</h4></td>
		</tr>


	</table>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
</html>