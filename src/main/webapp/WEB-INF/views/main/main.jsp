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
	<%@ include file="/WEB-INF/views/main/menubar.jsp" %>
	
	
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
									<a href="generic.html" class="link"><img src="images/pic01.jpg" alt="" /></a>
								</div>
							</div>
							<div class="col col2">
								<h3>셀프 피자 제작소 소식</h3>
								<p>Etiam posuere hendrerit arcu, ac blandit nulla. Sed congue malesuada nibh, a varius odio vehicula aliquet. Aliquam consequat, nunc quis sollicitudin aliquet, enim magna cursus auctor lacinia nunc ex blandit augue. Ut vitae neque fermentum, luctus elit fermentum, porta augue. Nullam ultricies, turpis at fermentum iaculis, nunc justo dictum dui, non aliquet erat nibh non ex.</p>
								<p>Sed congue malesuada nibh, a varius odio vehicula aliquet. Aliquam consequat, nunc quis sollicitudin aliquet, enim magna cursus auctor lacinia nunc ex blandit augue. Ut vitae neque fermentum, luctus elit fermentum, porta augue. Nullam ultricies, turpis at fermentum iaculis, nunc justo dictum dui, non aliquet erat nibh non ex. </p>
							</div>
						</div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<footer id="footer">
			<div class="copyright">
				&copy; Untitled. All rights reserved. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash.</a>
			</div>
		</footer>



		

	</body>
</html>
