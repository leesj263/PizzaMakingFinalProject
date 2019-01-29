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
	<form action="" method="post">
		<div id="joindiv" class="joindiv"><br>
			<h1>Create account</h1>

			<div class="mar">
				<table class="table">
					<tr>
						<td colspan="2"><div class="ui input" style="width: 100%">
								<input type="text" placeholder="이름">
							</div></td>
					</tr>
					<tr>
						<td><div class="ui input">
								<input type="text" placeholder="아이디">
							</div></td>
						<td align="center">
							<button class="ui yellow basic button" style="width: 100%">아이디
								중복확인</button>
						</td>
					</tr>
					<tr>
						<td colspan="2"><div class="ui input" style="width: 100%">
								<input type="text" placeholder="비밀번호">
							</div></td>
					</tr>
					<tr>
						<td colspan="2"><div class="ui input" style="width: 100%">
								<input type="text" placeholder="비밀번호 확인">
							</div></td>
					</tr>
					<tr>
						<td><div class="ui input" style="width: 100%">
								<input type="text" placeholder="이메일">
							</div></td>
						<td align="center">
							<button class="ui yellow basic button" style="width: 100%">인증번호
								발송</button>
						</td>
					</tr>
					<tr>
						<td><div class="ui input" style="width: 100%">
								<input type="text" placeholder="인증번호를 확인해주세요">
							</div></td>
						<td align="center">
							<button class="ui yellow basic button" style="width: 100%">인증
								확인</button>
						</td>
					</tr>
					<!-- 이메일 전화번호 -->
					<tr> 
					<TD align="center"><input class="ui yellow button"
						style="width: 100%" type="submit" class="joinbtn" value="계정만들기"></TD>
					<TD align="center"><input type="reset" style="width: 100%"
						class="ui yellow button" onclick="close1();" class="joinbtn"
						value="닫기"></TD>
					</tr>
				</table>
			</div>
		</div>
	</form>

	<!-- ---------------로그인=------------------ -->
	<form action="" method="post"">
		<div id="loginDiv" class="loginDiv"><br>
			<h1>login</h1>

			<div class="mar">
				<table class="table">
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="아이디" id="memberId"> 
								<i class="user outline icon"></i>
							</div></td>
						<td rowspan="2">
							<button class="ui yellow basic button" style="width: 100%; height:78px">로그인</button>
							
						</td>
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="비밀번호"> 
								<i class="heart outline icon"></i>
							</div></td>
					</tr>
					<tr	style="width:50px">
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="ui yellow button" style="width: 100%">카카오 로그인</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="ui green  button" style="width: 100%">네이버 로그인</button>
						</td>
					</tr>
					<tr	style="width:50px">
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><small>*아직 피자학원 회원이 아니세요?ㅠㅠ </small></td>
						<td>
							<button class="ui yellow basic button" style="width: 100%">회원가입하기</button>
						</td>
					</tr>
					<tr>
						<td><small>*아이디와 비밀번호를 잊으셨난용 </small></td>
						<td>
							<button class="ui yellow basic button" style="width: 100%"><samll>아이디/비밀번호찾기</samll></button>
						</td>
					</tr>
					
					
				</table>
			</div>
		</div>
	</form>

	
	<script>
		var joindiv = document.all.joindiv;
		var loginDiv = document.all.loginDiv;

		function join() {
			joindiv.style.visibility = "visible";
			loginDiv.style="hide";
			$('#menu').removeClass('visible');
			console.log("회원가입");
		}


		function login() {
			loginDiv.style.visibility = "visible";
			joindiv.style="hide";
			$('#memberId').focus();
			$('#menu').removeClass('visible');
			console.log("로그인");
		}
	</script>
	


</body>

</html>
