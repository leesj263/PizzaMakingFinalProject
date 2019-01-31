<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀프 피자 제작소</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/pmfp/resources/main/assets/css/main.css" />


<!-- 시멘틱 UI -->
<link rel="stylesheet" type="text/css"
	href="/pmfp/resources/main/assets/js/semantic/semantic.min.css">

<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<style>

/* 회원가입 창 */
.joindiv {
	position: absolute;
	top: 20%;
	left: 35%;
	color: black;
	background-color: white;
	border: 1px solid white;
	width: 450px;
	height: 500px;
	opacity: 1;
	visibility: hidden;
	border-radius: 5px; /*둥글겡*/
	z-index: 500;
}

.loginDiv {
	position: absolute;
	top: 20%;
	left: 35%;
	color: black;
	background-color: white;
	border: 1px solid white;
	width: 450px;
	height: 500px;
	opacity: 1;
	visibility: hidden;
	border-radius: 5px; /*둥글겡*/
	z-index: 500;
}

.idPwdSearchDiv {
	position: absolute;
	top: 20%;
	left: 35%;
	color: black;
	background-color: white;
	border: 1px solid white;
	width: 450px;
	height: 500px;
	opacity: 1;
	visibility: hidden;
	border-radius: 5px; /*둥글겡*/
	z-index: 500;
}

h1 {
	text-align: center;
}

/* 입력양식 모두! */
.mar {
	margin: 30px 50px 10px;
}

.mar2 {
	margin: 30px 50px 10px;
}
</style>

</head>


<body>
	
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
 

	<header id="header">
		<div class="logo">
			<a href="main.t"><span>Self Pizza Shop</span></a>
		</div>
		<c:if test="${!empty sessionScope.loginUser}">
		<h5 style="display:inline; color:white"><c:out value="${sessionScope.loginUser.memberName }님 환영합니다"/></h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="mini ui yellow basic button" onclick="location.href='logout.co'">로그아웃</button>
			<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
		</c:if>
		<%-- 
		<c:if test="${!empty sessionScope.loginUser && sessionScope.loginUser.memberCateg==1}">
			<button style="display:none;" id="memberCateg1">랄라</button>
		</c:if>
		
		<c:if test="${!empty sessionScope.loginUser && sessionScope.loginUser.memberCateg==2}">
			<button style="display:none;" id="memberCateg2">랄라</button>
		</c:if> --%>
		<a href="#menu">메뉴</a>
	</header>


	<nav id="menu">
	<c:if test="${!empty sessionScope.loginUser}">
	<h3 align="center"><c:out value="${sessionScope.loginUser.memberName }님 환영합니다"/></h3>
	 </c:if>
		<ul class="links">
			<li><a href="main.t">홈</a></li>
			<li><a href="pizzaMaking.cor">주문하기</a></li>
			<li><a href="#">이벤트</a></li>

			<li id="menuList1"><a>게시판</a>
				<ul id="down1" style="display: none">
					<li><a href="#">토핑공유</a></li>
					<br>
					<li><a href="#">후기</a></li>
				</ul></li>

			<li><a id="menuList2">고객센터</a>
				<ul id="down2" style="display: none">
					<li><a href="qna.t">공지사항</a></li>
					<br>
					<!-- 이건 그냥 테스트용으로 만든거! 지워도됨  : 솔 -->
					<li><a href="#">Q&A</a></li>
				</ul></li>


		</ul>
		<br> <br> &nbsp;&nbsp;
		<c:if test="${empty sessionScope.loginUser}">
		<button class="ui yellow basic button" onclick="login();" id="login">로그인</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="ui yellow basic button" onclick="join();">회원가입</button>
		</c:if>
		
		<c:if test="${!empty sessionScope.loginUser}">
		<div align="center">
		
			<button class="mini ui yellow basic button" onclick="location.href='logout.co'">로그아웃</button>
			<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
		</div>
		</c:if>
	</nav>

	<!-- ---------------회궝가입=------------------ -->

	<div id="joindiv" class="joindiv">
		<br>
		<h1>Create account</h1>

		<div class="mar">
			<table class="table">
				<tr>
					<td>슬라이드</td>
				</tr>
				<tr style="display: none;" id="buisnessman">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="사업자 번호를 입력하세요">
						</div></td>
				</tr>
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
						<button class="ui yellow basic button" style="width: 100%"
							id="Certification">인증 확인</button>
					</td>
				</tr>
				<!-- 이메일 전화번호 -->
				<tr>
					<TD align="center">
						<button class="ui yellow button" onclick="login();"
							style="width: 100%">계정만들기</button>


					</TD>
					<TD align="center">
						<button class="ui yellow button" onclick="closeBtn();"
							style="width: 100%">닫기</button>

					</TD>
				</tr>
			</table>
		</div>
	</div>


	<!-- ---------------로그인=------------------ -->

<form action="login.co" method="post">
	<div id="loginDiv" class="loginDiv">
		<br>
		<h1>login</h1>

		<div class="mar">
			<table class="table">
				<tr>
					<td><div class="ui left icon input">
							<input type="text" placeholder="아이디" id="memberId" name="memberId"> <i
								class="user outline icon"></i>
						</div></td>
					<td rowspan="2">
						<button class="ui yellow basic button"
							style="width: 100%; height: 78px" type="submit" id="loginBtn">로그인</button>

					</td>
				</tr>
				<tr>
					<td><div class="ui left icon input">
							<input type="password" placeholder="비밀번호" name="memberPwd"> <i
								class="heart outline icon"></i>
						</div></td>
				</tr>
				<tr style="width: 50px">
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
				<tr style="width: 50px">
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><small>*아직 피자학원 회원이 아니세요?ㅠㅠ </small></td>
					<td>
						<button class="ui yellow basic button" style="width: 100%"
							onclick="join();">회원가입하기</button>
					</td>
				</tr>
				<tr>
					<td><small>*아이디와 비밀번호를 잊으셨난용 </small></td>
					<td>
						<button class="ui yellow basic button" style="width: 100%"
							onclick="idPwdSearch();">
							<samll>아이디/비밀번호찾기</samll>
						</button>
					</td>
				</tr>


			</table>
		</div>
	</div>
</form>

	<!-- --------------아이디/비밀번호 찾기-------------- -->

	<div id="idPwdSearchDiv" class="idPwdSearchDiv">
		<br>
		<h1>FIND ID AND PASSWORD</h1>

		<div class="mar">
			<table class="table">
				<tr>
					<td colspan="2" align="center">*아이디찾기</td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="이름 입력">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input">
							<input type="text" placeholder="이메일">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width: 100%">아이디
							전송</button>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center">*비밀번호 찾기</td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="아이디를 입력하세요">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input">
							<input type="text" placeholder="이메일을 입력하세요">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width: 100%">임시
							비밀번호</button>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>


				<tr>
					<TD colspan="2" align="center">
						<button class="ui yellow button" onclick="login();"
							style="width: 100%">로그인</button>
					</TD>

				</tr>
			</table>
		</div>
	</div>


	<!-----------------모달창--------------------------->
	<div class="ui basic modal">
		<div class="ui icon header">
			<i class="archive icon"></i> 확인
		</div>
		<div class="content">
			<p>인증번호가 발송되었습니다!</p>
		</div>
		<div class="actions">
			<div class="ui green ok inverted button">
				<i class="checkmark icon"></i> Yes
			</div>
		</div>
	</div>


	<script>
		var joindiv = document.all.joindiv;
		var loginDiv = document.all.loginDiv;
		var idPwdSearchDiv = document.all.idPwdSearchDiv;

		function join() {
			joindiv.style.visibility = "visible";
			loginDiv.style = "hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
			console.log("회원가입");
		}

		function login() {
			loginDiv.style.visibility = "visible";
			joindiv.style = "hide";
			idPwdSearchDiv.style = "hide";
			$('#memberId').focus();
			$('#menu').removeClass('visible');
			console.log("로그인");
		}

		function closeBtn() {
			loginDiv.style = "hide";
			joindiv.style = "hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
		}

		function idPwdSearch() {
			idPwdSearchDiv.style.visibility = "visible";
			loginDiv.style = "hide";
			joindiv.style = "hide";
			$('#menu').removeClass('visible');
		}
		
		/* $("#login").click(function(){
			$("#memberCateg1").h
		}); */
	</script>

	<script>
		$("#Certification").click(function() {
			swal({
				title : "인증 확인",
				text : "인증이 확인되었습니다.",
				icon : "success",
				button : "확인",
			});
			console.log($('.ui.checkbox'));
		})

		$('.ui.checkbox').checkbox();
		console.log($('.ui.checkbox'));
		console.log($('.ui.checkbox'));

		//사업자로 변환
		/* var check = $("input[type='checkbox']");
		check.click(function(){
			console.log("클릭되닝");
			$("#buisnessman").toggle();
		}); */

		$("#changebox").click(function() {
			console.log("클랙");
		});
		
		
	</script>


	<script>
		//메뉴 드롭다운
		$("#menuList1").click(function() {
			if ($("#down1").css("display") == "none") {
				$("#down1").show();
			} else {
				$("#down1").hide();
			}
		});

		$("#menuList2").click(function() {
			if ($("#down2").css("display") == "none") {
				$("#down2").show();
			} else {
				$("#down2").hide();
			}
		});

		function mypage() {
			location.href = "mypage.t";

		}
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
