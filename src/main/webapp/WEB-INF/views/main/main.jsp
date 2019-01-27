<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀프 피자 제작소</title>


</head>


<body>


	<%--  <jsp:include page="${contextPath}/WEB-INF/views/main/menubar.jsp"/> --%>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>


	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<header>
				<h1>셀프 피자 제작소</h1>
			</header>
			<!-- <a href="#main" class="button big scrolly">주문하러 가기</a> -->
			<button class="ui yellow button">주문하러 가기</button>
		</div>
	</section>

	<!-- Main -->
	<div id="main">

		<!-- Section -->
		<section class="wrapper style1">
			<div class="inner">
				<!-- 2 Columns -->
				<div class="flex flex-2">
					<div class="col col1">
						<div class="image round fit">
							<a href="generic.html" class="link"><img
								src="images/pic01.jpg" alt="" /></a>
						</div>
					</div>
					<div class="col col2">
						<h3>셀프 피자 제작소 소식</h3>
						<p>Etiam posuere hendrerit arcu, ac blandit nulla. Sed congue
							malesuada nibh, a varius odio vehicula aliquet. Aliquam
							consequat, nunc quis sollicitudin aliquet, enim magna cursus
							auctor lacinia nunc ex blandit augue. Ut vitae neque fermentum,
							luctus elit fermentum, porta augue. Nullam ultricies, turpis at
							fermentum iaculis, nunc justo dictum dui, non aliquet erat nibh
							non ex.</p>
						<p>Sed congue malesuada nibh, a varius odio vehicula aliquet.
							Aliquam consequat, nunc quis sollicitudin aliquet, enim magna
							cursus auctor lacinia nunc ex blandit augue. Ut vitae neque
							fermentum, luctus elit fermentum, porta augue. Nullam ultricies,
							turpis at fermentum iaculis, nunc justo dictum dui, non aliquet
							erat nibh non ex.</p>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Footer -->
	<footer id="footer">
		<div class="copyright">
			&copy; Untitled. All rights reserved. Design: <a
				href="https://templated.co">TEMPLATED</a>. Images: <a
				href="https://unsplash.com">Unsplash.</a>
		</div>
	</footer>

	<!-- ---------------회궝가입=------------------ -->
	<form action="" method="post" onsubmit="return joindate();">
		<div id="joindiv" class="joindiv">
			<h1>Create account</h1>

			<div class="mar">
				<table class="table">
					<tr>
						<td colspan="2"><input type="text" class="mm" id="name"
							placeholder="이름"></td>
					</tr>
					<tr>
						<td><input type="text" class="mm" id="id" placeholder="아이디">
						</td>
						<td align="center">
							<button class="ui yellow basic button" style="width: 100%">아이디 중복확인</button>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" class="mm" id="pass1"
							placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" class="mm" id="pass2"
							placeholder="비밀번호 확인"></td>
					</tr>
					<tr>
						<td><input type="text" class="mm" id="email"
							placeholder="이메일"></td>
						<td align="center">
							<button class="ui yellow basic button" style="width: 100%">인증번호 발송</button>
						</td>
					</tr>
					<tr>
						<td><input class="form-control" type="text" class="mm"
							id="certification" placeholder="인증번호를 입력해주세요"></td>
						<td align="center">
							<button class="ui yellow basic button" style="width: 100%">인증 확인</button>
						</td>
					</tr>
					<!-- 이메일 전화번호 -->
<!-- 					<tr> -->
						<TD align="center"><input class="ui yellow button" style="width: 100%"
							type="submit" class="joinbtn" value="계정만들기"></TD>
						<TD align="center"><input type="reset" style="width: 100%"
							class="ui yellow button" onclick="close1();" class="joinbtn"
							value="닫기"></TD>
					</tr>
				</table>
			</div>
		</div>
	</form>

	<script>
		var joindiv = document.all.joindiv;

		function join() {
			joindiv.style.visibility = "visible";
			console.log("회원가입");
		}
	</script>



</body>

</html>
