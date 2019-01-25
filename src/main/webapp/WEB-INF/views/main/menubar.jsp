<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀프 피자 제작소</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/pmfp/resources/main/assets/css/main.css" />


<!-- 시멘틱 UI -->
<link rel="stylesheet" type="text/css" href="/pmfp/resources/main/assets/js/semantic/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>


</head>


<body>
	<header id="header">
		<div class="logo"><a href="main.t"><span>Self Pizza Shop</span></a></div>
		<a href="#menu">메뉴</a>
	</header>

	
	<nav id="menu">
		<ul class="links">
			<li><a href="main.t">홈</a></li>
			<li><a href="#">주문하기</a></li>
			<li><a href="#">이벤트</a></li>
			
			<li id="menuList1"><a>게시판</a>
				<ul id="down1" style="display:none">
					<li><a href="#" >토핑공유</a></li><br>
					<li><a href="#">후기</a></li>
				</ul>
			</li>
			
			<li><a id="menuList2">고객센터</a>
				<ul id="down2" style="display:none">
					<li><a href="qna.t">공지사항</a></li><br>  <!-- 이건 그냥 테스트용으로 만든거! 지워도됨  : 솔 -->
					<li><a href="#">Q&A</a></li>
				</ul>
			</li>
			
		
		</ul>
		<br><br>
		&nbsp;&nbsp;
		<button class="ui yellow basic button">로그인</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="ui yellow basic button">회원가입</button>
		
	</nav>
	
	
	<script>
		//메뉴 드롭다운
		$("#menuList1").click(function(){
			if($("#down1").css("display") == "none"){
				$("#down1").show();
			} else {
				$("#down1").hide();
			}
		});
		
		$("#menuList2").click(function(){
			if($("#down2").css("display") == "none"){
				$("#down2").show();
			} else {
				$("#down2").hide();
			}
		});
	</script>
	
	
	
	
	<!-- Scripts -->
		<script src="/pmfp/resources/main/assets/js/jquery.min.js"></script>
		<script src="/pmfp/resources/main/assets/js/jquery.scrolly.min.js"></script>
		<script src="/pmfp/resources/main/assets/js/jquery.scrollex.min.js"></script>
		<script src="/pmfp/resources/main/assets/js/skel.min.js"></script>
		<script src="/pmfp/resources/main/assets/js/util.js"></script>
		<script src="/pmfp/resources/main/assets/js/main.js"></script>
	
	
	</body>
</html>
