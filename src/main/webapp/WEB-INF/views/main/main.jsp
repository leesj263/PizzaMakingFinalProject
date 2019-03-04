<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀프 피자 제작소</title>
</head>

<!-- 네이버 로그인 -->
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
			<button class="ui yellow button" onclick="location.href='pizzaMaking.cor'">주문하러 가기</button>
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

	 <script type="text/javascript">
				var naver_id_login = new naver_id_login("hleKffrO_Usz21Fz5hyM","http://localhost:8008/pmfp");
				// 접근 토큰 값 출력
				alert(naver_id_login.oauthParams.access_token);
				// 네이버 사용자 프로필 조회
				naver_id_login.get_naver_userprofile("naverSignInCallback()");
				// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
				function naverSignInCallback() {
					alert(naver_id_login.getProfileData('email'));
					alert(naver_id_login.getProfileData('nickname'));
					alert(naver_id_login.getProfileData('age'));
					console.log("나오닝");
				}
	</script> 
	


</body>

</html>
