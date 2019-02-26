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

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 카카오 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
	//변수만 선언
	//아이디 중복확인 체크 (마지막에 계정만들기 눌렀을떄 아이디가 중복체크)
	idcheckcheck=0;
</script>


<style>


/* 회원가입 창 */
.hiddenCss {
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
	z-index: 5000; 
}

	.customModal{
		position: fixed;
		top: 0;
		width: 100%;
		height: 100%;
		background: black;
		opacity: 0.5;
		z-index: 1000;
		display:none;
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

	
	<div class="customModal" id="allClose" onclick="return AllcloseBtn()">
		<!-- 배경 어두워지면서 클릭하면 배경 모든 창 닫기  -->
	</div>


	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />


	<header id="header">
		<div class="logo">
			<a href="main.t"><span>Self Pizza Shop</span></a>
		</div>
		<c:if test="${!empty sessionScope.loginUser}">
			
			<c:if test="${ sessionScope.loginUser.memberName == '관리자' }">
				<button class="mini ui yellow basic button"
				onclick="location.href='adminMain.ad'">관리자 페이지로 이동</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<h5 style="display: inline; color: white">
				<c:out value="${sessionScope.loginUser.memberName }님 환영합니다" />
			</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="mini ui yellow basic button"
				onclick="location.href='logout.co'">로그아웃</button>
			<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
		</c:if>
		
		<!-- 비회원일떄 -->
		<c:if test="${!empty sessionScope.noUserLogin.memberName}">
			<h5 style="display: inline; color: white">
				<c:out value="${sessionScope.noUserLogin.memberName }님 환영합니다" />
			</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="mini ui yellow basic button"
				onclick="location.href='logout.co'">로그아웃</button>
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
		<!-- 회원일때 -->
		<c:if test="${!empty sessionScope.loginUser}">
			<h3 align="center">
				<c:out value="${sessionScope.loginUser.memberName }님 환영합니다" />
			</h3>
		</c:if>
		
		<!-- 비회원일때 -->
		<c:if test="${!empty sessionScope.noUserLogin.memberName}">
			<h3 align="center">
				<c:out value="${sessionScope.noUserLogin.memberName }님 환영합니다" />
			</h3>
		</c:if>
		
		<ul class="links">
			<li><a href="main.t">홈</a></li>
			<li><a href="pizzaMaking.cor">주문하기</a></li>
			<li><a href="#">이벤트</a></li>

			<li id="menuList1"><a>게시판</a>

				<ul id="down1" style="display: none">
					<li><a href="shareList.t">토핑공유</a></li>
					<br>
					<li><a href="reviewList.bo">제작후기</a></li>
				</ul></li>

			<li><a id="menuList2">고객센터</a>
        
				<ul id="down2" style="display: none">
					<li><a href="qnaList.bo">Q&A</a></li>
					<br>
					<!-- 이건 그냥 테스트용으로 만든거! 지워도됨  : 솔 -->
					<li><a href="faqOrder.bo">FAQ</a></li>
				</ul></li>

		</ul>
		<br> <br> &nbsp;&nbsp;
<%-- 		<c:if test="${empty sessionScope.loginUser}">
			<button class="ui yellow basic button" onclick="login();" id="login">로그인</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="ui yellow basic button" onclick="join();">회원가입</button>
		</c:if>

		
		<c:if test="${!empty sessionScope.loginUser}">
			<div align="center">

				<button class="mini ui yellow basic button"
					onclick="location.href='logout.co'">로그아웃</button>
				<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
			</div>
		</c:if>
		
		
		<c:if test="${!empty sessionScope.memberName}">
			<div align="center">

				<button class="mini ui yellow basic button"
					onclick="location.href='logout.co'">로그아웃</button>
			</div>
		</c:if> --%>
		<c:choose>
		
		<c:when test="${!empty sessionScope.noUserLogin}">
			<div align="center">

				<button class="mini ui yellow basic button"
					onclick="location.href='logout.co'">로그아웃</button>
			</div>
		</c:when>
		
		<c:when test="${empty sessionScope.loginUser}">
			<button class="ui yellow basic button" onclick="login();" id="login">로그인</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="ui yellow basic button" onclick="join();">회원가입</button>
		</c:when>

		
		<c:when test="${!empty sessionScope.loginUser}">
			<div align="center">

				<button class="mini ui yellow basic button"
					onclick="location.href='logout.co'">로그아웃</button>
				<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
			</div>
		</c:when>
		
		</c:choose>
		
		
		
	</nav>

	<!--------------------------------------회원가입=------------------------------------------------------->

	<div id="joindiv" class="hiddenCss">
		<br>
		<h1>Create account</h1>

		<div class="mar">
		<form action="insertJoin.co" method="post" >
			<table class="table">
				<tr>
					<td>
						<div class="inline field">
							<div class="ui toggle checkbox">
								<input type="checkbox" tabindex="0" class="hidden"> <label>사업자로 변환하기</label>
								<input type="hidden" name="changeNum" id="changeNum" value="1">
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="이름" id="memberName" name="memberName">
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="닉네임을 입력하세요" id="memberNickName" name="memberNickName">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input">
							<input type="text" placeholder="아이디" id="memberId" name="memberId">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width: 100%" onclick="return IdCheckBtn()">아이디
							중복확인</button>
					</td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="password" placeholder="비밀번호" id="memberPwd" name="memberPwd">
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="password" placeholder="비밀번호 확인" id="memberPwd2">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input" style="width: 100%">
							<input type="text" placeholder="이메일" id="memberEmail" name="memberEmail">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width:100%" onclick="return CertificationSendBtn()">인증번호 발송</button>
					</td>
				</tr>
				<tr>
					<td><div class="ui input" style="width:100%">
							<input type="text" placeholder="인증번호를 확인해주세요" id="JoinCertificationNum">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width: 100%"
							id="Certification" onclick="return CertificationBtn()">인증 확인</button>
					</td>
				</tr>
				
				<tr style="display: none;" id="comNameTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="지점명을 입력하세요" id="comName" name="comName">
						</div></td>
				</tr>
				<tr style="display: none;" id="comAddressTr">
					<td><div class="ui input" style="width: 100%">
							<input type="text" placeholder="우편 번호 (검색 이용)" id="comAddress" name="comAddress" readonly>
						</div></td>
					<td align="center">
						<div class="ui yellow basic button" style="width: 100%" onclick="return postNumSearch()">우편번호 검색</div>
					</td>
				</tr>
				<tr style="display: none;" id="comAddressTr3">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="주소 " id="comAddress3" name="comAddress3" readonly>
						</div></td>
				</tr>
				
				<tr style="display: none;" id="comAddressTr2">
					<td><div class="ui input" style="width: 100%">
							<input type="text" placeholder="상세주소 입력" id="comAddress2" name="comAddress2">
						</div></td>
						<td><div class="ui input" style="width: 100%">
							<input type="text" placeholder="참고주소(입력X)" id="comAddress4" name="comAddress4" readonly>
						</div></td>
				</tr>
				
				<tr style="display: none;" id="comTelTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="tel" placeholder="매장 전화번호 (EX:02-1234-1234)" id="comTel" name="comTel">
						</div></td>
				</tr>
				<tr style="display: none;" id="comLisensenoTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="사업자 번호" id="comLisenseno" name="comLisenseno">
						</div></td>
				</tr>
				<tr style="display: none;" id="comSalestimeTr">
						<td>
						<div class="ui selection dropdown compact" style="width:170px">
							<input type="hidden" name="openTime" id="openTime" value=""> <i
								class="dropdown icon"></i>
							<div class="default text">오픈시간</div>
							<div class="menu">
								<div class="item" data-value="AM 05:00">AM 05:00</div>
								<div class="item" data-value="AM 06:00">AM 06:00</div>
								<div class="item" data-value="AM 07:00">AM 07:00</div>
								<div class="item" data-value="AM 08:00">AM 08:00</div>
								<div class="item" data-value="AM 09:00">AM 09:00</div>
								<div class="item" data-value="AM 10:00">AM 10:00</div>
								<div class="item" data-value="AM 11:00">AM 11:00</div>
								<div class="item" data-value="PM 12:00">PM 12:00</div>
								<div class="item" data-value="PM 01:00">PM 01:00</div>
								<div class="item" data-value="PM 02:00">PM 02:00</div>
							</div>
						</div>
						</td>
						<td>
						<div class="ui selection dropdown compact" style="width:170px">
							<input type="hidden" name="closeTime" id="closeTime" value=""> <i class="dropdown icon"></i>
							<div class="default text">마감시간</div>
							<div class="menu">
								<div class="item" data-value="PM 08:00">PM 08:00</div>
								<div class="item" data-value="PM 09:00">PM 09:00</div>
								<div class="item" data-value="PM 10:00">PM 10:00</div>
								<div class="item" data-value="PM 11:00">PM 11:00</div>
								<div class="item" data-value="PM 12:00">AM 12:00</div>
								<div class="item" data-value="AM 01:00">AM 01:00</div>
								<div class="item" data-value="AM 02:00">AM 02:00</div>
								<div class="item" data-value="AM 03:00">AM 03:00</div>
								<div class="item" data-value="AM 04:00">AM 04:00</div>
							</div>
						</div>
						</td>
						<!-- <td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="오픈시간과 마감시간 입력해주세요" id="comSalestime" name="comSalestime">
						</div></td> -->
				</tr>
				<tr style="display: none;" id="comLocationTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="매장 상세 위치정보 (EX : 역삼역 4번출구 방향)" id="comLocation" name="comLocation">
						</div></td>
				</tr>
				<tr style="display: none;" id="comParkingTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="주차정보 (EX : 약 10대 주차가능 or 주차불가능)" id="comParking" name="comParking">
						</div></td>
				</tr>
				
				<!-- 이메일 전화번호 -->
				<tr>
					<!-- <TD align="center">
						<button class="ui yellow button" onclick="login();"
							style="width: 100%">계정만들기</button>


					</TD>
					 -->
					<TD align="center">
						<button class="ui yellow button" onclick="return CreateAccount()"
							style="width: 100%">계정만들기</button>

					</TD>
					
					<TD align="center">
						<button class="ui yellow button" onclick="return AllcloseBtn()" style="width: 100%">닫기</button>

					</TD>
				</tr>
			</table>
			</form>
		</div>
	</div>


	<!--------------------------------------------로그인=---------------------------------------------------->

	<form action="login.co" method="post">
		<div id="loginDiv" class="hiddenCss">
			<br>
			<h1>login</h1>

			<div class="mar">
				<table class="table">
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="아이디" id="memberIdLogin"
									name="memberId"> <i class="user outline icon"></i>
							</div></td>
						<td rowspan="2">
							<button class="ui yellow basic button"
								style="width: 100%; height: 78px" id="loginBtn" onclick="return memberLoginBtn()">로그인</button>

						</td>
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwdLogin">
								<i class="heart outline icon"></i>
							</div></td>
					</tr>
					<tr style="width: 50px">
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- <button type="button" class="ui yellow button"
								style="width: 100%">카카오 로그인</button> -->
								<a id="kakao-login-btn"></a> <a
							href="http://developers.kakao.com/logout"></a> <script
								type='text/javascript'>
								//<![CDATA[
								// 사용할 앱의 JavaScript 키를 설정해 주세요.
								Kakao.init('193ce7b860db2d5f477856840d1b7fb4');
								// 카카오 로그인 버튼을 생성합니다.
								Kakao.Auth.createLoginButton({
									container : '#kakao-login-btn',
												success : function(authObj) {
													Kakao.API.request({
																url : '/v1/user/me',
																success : function(res) {
																	alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
																	alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
																	console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
																	console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
																	console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
																	// res.properties.nickname으로도 접근 가능 )
																	console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
																	
																	//에이작스로 컨트롤러 데이터 보내고
																	$.ajax({
																		url:"kakaologin.co",
																		type:"post",
																		data:{"kakaoId":res.id,
																			"kakaoEmail":res.kaccount_email,
																			"kakaoNickname":res.properties['nickname']},
																		success:function(data){
																			console.log("카카오 로그인 통신 성공");
																		},error:function(data){
																			console.log("카카오 로그인 통신 실패");
																		}
																	});
																	//세션에 담깅
																}
															})
												},

												fail : function(error) {
													alert(JSON.stringify(error));
												}
											});

									//]]>
								</script>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="ui green  button"
								style="width: 100%">네이버 로그인</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="ui black basic button"
								style="width: 100%" onclick="nonMember();">비회원 로그인</button>
						</td>
					</tr>
					<tr style="width: 50px">
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><small>*아직 피자학원 회원이 아니세요?ㅠㅠ </small></td>
						<td>
							<button type="button" class="ui yellow basic button"
								style="width: 100%" onclick="join();">회원가입하기</button>
						</td>
					</tr>
					<tr>
						<td><small>*아이디와 비밀번호를 잊으셨나요? </small></td>
						<td>
							<button type="button" class="ui yellow basic button"
								style="width: 100%" onclick="idPwdSearch();">
								<samll>아이디/비밀번호찾기</samll>
							</button>
						</td>
					</tr>


				</table>
			</div>
		</div>
	</form>
	<!---------------------------------------------비회원 로그인------------------------------------------------>


<form action="nonMemberlogin.co" method="post">
	<div id="nonMemberloginDiv" class="hiddenCss">
		<br>
		<h1>nonMember-login</h1>

		<div class="mar">
			<table class="table">
				<tr>
					<h4>비회원 주문 시 기본할인&제휴할인 이용불가</h4>
					<p>*셀프 피자 회원으로 가입하고, 셀프 피자 정보 및 이벤트 참여 등 다양한 혜택을 받으세요.</p>
				</tr>

				<tr style="width: 30px">
					<td>&nbsp;</td>
				</tr>
				<tr>

					<div class="ui form">
						<div class="inline fields">
							<label for="agree"><h4>개인정보 수집 및 동의</h4></label>
							<div class="field">
								<div class="ui radio checkbox">
									<input type="radio" name="agree" checked="" tabindex="0"
										class="hidden" id="noAgree"> <label>동의안함</label>
								</div>
							</div>
							<div class="field">
								<div class="ui radio checkbox">
									<input type="radio" name="agree" tabindex="0" class="hidden" id="agree">
									<label>동의함</label>
								</div>
							</div>

						</div>
						<table class="table">
						<tr >
						<td colspan="2"><div class="ui left icon input">
								<input type="text" placeholder="이름" id="noMemberName"
									name="memberName" style="width: 350px"> <i class="user outline icon"></i>
							</div></td>
						
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="핸드폰 번호 입력하세요" id="noMemberPhone" name="memberPhone">
								<i class="heart outline icon"></i>
							</div></td>
						 <td>
							<div class="ui yellow basic button"
								style="width: 100%; height: 40px" id="phoneCertificationSend" onclick="return phoneCertificationSend()">인증번호 발송</div>

						</td>
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="인증번호" name="memberCertificationNumber" id="memberCertificationNumber">
								<i class="envelope outline icon"></i>
							</div></td>
						
						<td>
							<div class="ui yellow basic button"
								style="width: 100%; height: 40px" id="nonMemberCertification" onclick="return CertificationCheckBtn()">인증번호 확인</div>

						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr> 
					
					<tr> 
						<td colspan="3">
							<button class="ui yellow button"
								style="width: 300px; height: 60px; margin-left:20px" type="submit" id="NonMemberloginBtn">비회원로그인</button>

						</td>
					
					</tr>
						
						</table>



					</div>
				<tr>
					<td></td>
				</tr>

			</table>
		</div>
	</div>
</form>
	<!---------------------------------------아이디/비밀번호 찾기---------------------------------------------->

<form action="" method="post">
	<div id="idPwdSearchDiv" class="hiddenCss">
		<br>
		<h1>FIND ID AND PASSWORD</h1>

		<div class="mar">
			<table class="table">
				<tr>
					<td colspan="2" align="center">*아이디찾기</td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="이름 입력" id="idSearchName" name="memberName">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input">
							<input type="text" placeholder="이메일" id="idSearchEmail" name="memberEmail">
						</div></td>
					<td align="center">
						<div class="ui yellow basic button" style="width: 100%" onclick="return idSendBtn();">아이디 전송</div>
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
							<input type="text" placeholder="아이디를 입력하세요" id="pwdSearchId" name="memberId">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input">
							<input type="text" placeholder="이메일을 입력하세요" id="pwdSearchEmail" name="memberEmail">
						</div></td>
					<td align="center">
						<div class="ui yellow basic button" style="width: 100%" onclick="return PwdSendBtn()">임시 비밀번호</div>
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
</form>

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


<!----------------------- 화면 띄우기 script -------------------------------------->
	<script>
	
	//드롭다운
	$('.ui.dropdown')
	  .dropdown()
	;
	
		var joindiv = document.all.joindiv;						//회원가입
		var loginDiv = document.all.loginDiv;					//로그인
		var idPwdSearchDiv = document.all.idPwdSearchDiv;		//아이디비밀번호찾기
		var nonMemberloginDiv = document.all.nonMemberloginDiv;	//비회원 로그인
	
		
		function join() {
			joindiv.style.visibility = "visible";
			loginDiv.style = "hide";
			nonMemberloginDiv.style = "hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
			console.log("회원가입");
			$("#allClose").show();				//배경 어두워지면서 클릭하면 배경 모든 창 닫기 
			
		}

		function login() {
			loginDiv.style.visibility = "visible";
			joindiv.style = "hide";
			idPwdSearchDiv.style = "hide";
			nonMemberloginDiv.style = "hide";
			$('#memberId').focus();
			$('#menu').removeClass('visible');
			$("#allClose").show();				//배경 어두워지면서 클릭하면 배경 모든 창 닫기 
			console.log("로그인");
		}


		function idPwdSearch() {
			idPwdSearchDiv.style.visibility = "visible";
			loginDiv.style = "hide";
			joindiv.style = "hide";
			nonMemberloginDiv.style = "hide";
			$('#menu').removeClass('visible');
			$("#allClose").show();				//배경 어두워지면서 클릭하면 배경 모든 창 닫기 
		}

		function nonMember() {
			nonMemberloginDiv.style.visibility = "visible";
			idPwdSearchDiv.style = "hide";
			loginDiv.style = "hide";
			joindiv.style = "hide";
			$('#menu').removeClass('visible');
			$("#allClose").show();				//배경 어두워지면서 클릭하면 배경 모든 창 닫기 
		}
		
		//모든 창 닫기
		function AllcloseBtn() {
			loginDiv.style = "hide";
			joindiv.style = "hide";
			idPwdSearchDiv.style = "hide";
			nonMemberloginDiv.style="hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
			$("#allClose").hide();				//배경 어두워지는거 풀기
			
		
			
			
			return false;
			
		} 

		
		/* $("#login").click(function(){
			$("#memberCateg1").h
		}); */
		
		//회원 로그인 버튼 클릭시 
		function memberLoginBtn(){
			console.log("를룰");
			var memberIdLogin = $("#memberIdLogin").val();
			var memberPwdLogin = $("#memberPwdLogin").val();
			
			console.log(memberIdLogin);
			console.log(memberPwdLogin);
			
		 	if(memberIdLogin==""){
		 		swal("아이디를 입력해주세요");
				return false;
			}
			if(memberPwdLogin==""){
				swal("비밀번호를 입력해주세요");
				return false;
			}
			return true; 
		}
		
		
		var idCheck = 1;
		var CertificationSend =1;
		var Certification =1;
		
		//아이디 중복확인 버튼 
		function IdCheckBtn(){
			idCheck = 2;
			var memberId = $("#memberId").val();
			//console.log(memberId);
			
			$.ajax({
				url:"duplicationCheck.co",
				type:"post",
				data:{memberId:memberId},
				success:function(data){
					console.log("성공");
					console.log(data);
					if(memberId==''){
						swal("아이디를 입력해주세요");
					}else{
						if(data==0){
							swal("사용 가능한 아이디 입니다.");
							idcheckcheck=2;
						}else{
							swal("아이디가 중복됩니다.");
							idcheckcheck=1;
						}
					}
				},
				error:function(data){
					console.log(data);
				}
			});
			
			return false;
		}
		
		//회원가입-이메일 인증번호 발송 버튼
		var chkRandomCode = 0;
		function CertificationSendBtn(){
			CertificationSend=2;
			var memberId = $("#memberId").val();
			var memberEmail = $("#memberEmail").val();
			//랜덤 코드 생성
			var randomCode = Math.floor(Math.random() * 1000000)+100000;
			if(randomCode>1000000){
				randomCode = randomCode - 100000;
			}
			chkRandomCode = randomCode;
			//console.log(memberId);
			//console.log(memberEmail);
			//console.log(randomCode);
			
		$.ajax({	
			url:"joinSendMail.co",
			type:"post",
			data:{"memberId":memberId,
				"memberEmail":memberEmail,
				"randomCode":randomCode},
			success:function(data){
				console.log(data);
				if(data.sendMail == '성공'){
				swal("이메일인증번호 전송완료 ! 인증번호를 입력해주세요");					
				}
			},error:function(data){
				console.log("통신실패");
			}
				
			});
			
			
			return false;
			
		}
		
		//회원가입-이메일 인증확인 버튼
		function CertificationBtn(){
			Certification=2;
			if($("#JoinCertificationNum").val() == chkRandomCode){
				console.log("인증확인 되었습니당~!!");
				swal("인증 완료!");
			}else{
				swal("인증 번호 확인해주세요");
				return false;
			}
			return false;
		}	
		
		
	</script>
	
<!----------------------- 비회원 로그인 script -------------------------------------->

	<script>
		var noMemberLoginCode=0;	//랜덤 인증번호 변수
		//비회원 로그인-인증번호 보내기 버튼
		function phoneCertificationSend(){
			var noMemberName = $("#noMemberName").val();
			var noMemberPhone = $("#noMemberPhone").val();
			console.log(noMemberName);
			console.log(noMemberPhone);
			
			//랜덤 코드 생성
			var randomCode = Math.floor(Math.random() * 1000000)+100000;
			if(randomCode>1000000){
				randomCode = randomCode - 100000;
			}
			noMemberLoginCode = randomCode;
			
			$.ajax({
				url:"noMemberLogin.co",
				type:"post",
				data:{"noMemberName":noMemberName,
					"noMemberPhone":noMemberPhone,
					"randomCode":randomCode},
				success:function(data){
					console.log("비회원 로그인 통신 성공");
					swal("인증번호를 전송하였습니다!");
				},error:function(data){
					console.log("비회원 로그인 통신 실패");
				}
			});
		}
		
		//비회원 로그인-인증번호 확인 버튼
		function CertificationCheckBtn(){
			var memberCertificationNumber = $("#memberCertificationNumber").val();
			
			if(memberCertificationNumber==noMemberLoginCode){
				console.log("인증확인 되었습니당~!!");
				swal("인증 완료!");
			}else{
				swal("인증번호를 확인해주세요");
				return false;
			}
			return false;
			
		}
		
	</script>

<!----------------------- 인증확인 script -------------------------------------->
	<script>
	/* 	$("#Certification").click(function() {
			swal({
				title : "인증 확인",
				text : "인증이 확인되었습니다.",
				icon : "success",
				button : "확인",
			});
			console.log($('.ui.checkbox'));
		}) */
		
		//비회원 로그인-인증번호 확인버튼
/* 		$("#nonMemberCertification").click(function() {
			swal({
				title : "인증 확인",
				text : "인증이 확인되었습니다.",
				icon : "success",
				button : "확인",
			});
		}) */
		
/* 		$("#NonMemberloginBtn").click(function() {
			swal({
				title : "인증 번호 발송",
				text : "인증 번호 발송되었습니다.",
				icon : "success",
				button : "확인",
			});
			//console.log($('.ui.checkbox'));
		}) */

		$('.ui.checkbox').checkbox();
		//console.log($('.ui.checkbox'));
		
		



/* ---------------------- 사업자로 변환 script -------------------------------------- */
		//사업자로 변환시 양식 변환
		var check = $('.ui.toggle.checkbox');
		var num=1;
		check.click(function(){
			//console.log("클릭되닝");
			num++;
			$("#comLisensenoTr").toggle();
			$("#comNameTr").toggle();
			$("#comAddressTr").toggle();
			$("#comAddressTr2").toggle();
			$("#comTelTr").toggle();
			$("#comSalestimeTr").toggle();
			$("#comLocationTr").toggle();
			$("#comParkingTr").toggle();
			$("#comAddressTr3").toggle();
			 
			//사업자일때
			if(num%2==0){ 
				$("#joindiv").css({"height":"900px"});
				
			 } else{
				 $("#joindiv").css({"height":"500px"});
			 }
			 console.log("클릭되닝?"+num);
			 
			 //짝수일때가 사업자!
			var changeNum = $("#changeNum").val(num);
			console.log(changeNum.val());
		});
	

/* ---------------------- 회원가입 유효성 검사 script -------------------------------------- */
		//계정만들기 Btn
		function CreateAccount(){
			var comLisenseno = $("#comLisenseno").val();	//사업자 번호 
			var memberName = $("#memberName").val();	//이름 
			var memberId = $("#memberId").val();		//아이디 
			var memberPwd = $("#memberPwd").val();		//비밀번호 
			var memberPwd2 = $("#memberPwd2").val();	//비밀번호 확인
			var memberEmail = $("#memberEmail").val();	//이메일 
			var JoinCertificationNum = $("#JoinCertificationNum").val();	//인증번호 
			var comName =$("#comName").val();			//지점명
			var comAddress =$("#comAddress").val();		//우편번호
			var comAddress2 = $("#comAddress2").val();	//상세 주소
			var comAddress4 = $("#comAddress4").val();	//참고 주소
			var comTel =$("#comTel").val();				//전화번호
			var comLisenseno =$("#comLisenseno").val();	//사업자번호
			//var comSalestime =$("#comSalestime").val();	//영업시간
			var comLocation =$("#comLocation").val();	//위치정보
			var comParking =$("#comParking").val();		//주차정보
			var openTime = $("#openTime").val();		//오픈 시간
			var closeTime = $("#closeTime").val();		//마감 시간
			
			console.log(openTime);
			console.log(closeTime);
			
			//이메일 유효성 검사(4글자 이상 나오고 @나오고 1글자 이상 주소)
			var regEmail = /\w{4,}@\w+.\w{1,3}/;
			//아이디 유효성 검사(첫글짜는 반드시 영문 소문자,4~12자로,숫자가 하나이상 포함, 영문소문자와숫자로!)
			var regId= /^[a-z]+[a-z0-9]{4,12}$/;
			
			//이름 검사
			if(memberName==""){
				swal("이름을 입력해주세요!");
				$("#memberName").focus();
				return false;
			}
			
			//아이디검사
			if(memberId==""){
				swal("아이디 입력해주세요!");
				$("#memberId").focus();
				return false;
			}
			
			//아이디 중복확인 체크여부(체크 했는지 안했는징)
			if(idCheck==1){
				swal("중복체크해주세요");
				return false;
			}
			
			//비밀번호 검사
			if(memberPwd==""){
				swal("비밀번호를 입력해주세요.");
				return false;
			}
			if(memberPwd!=memberPwd2){
				swal("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			//이메일 검사
			if(memberEmail==""){
				swal("이메일을 입력해주세요!");
				return false;
			}
			//인증번호 확인
			if(JoinCertificationNum==""){
				swal("인증번호를 입력해주세요");
				return false;
			}
			
		 	if(regId.test(memberId)){
				//swal("아이디 정상입력");
				console.log("정상 입력");
			}else{
				swal("아이디를 올바르게 입력해주세용");
				console.log("아이디 비정상 입력");
				return false;
			} 
			if(regEmail.test(memberEmail)){
				//swal("이메일 정상입력");
				console.log("정상 입력");
			}else{
				swal("올바른 이메일을 입력해주세요");
				return false;
			} 
			
			//인증버호 발송 체크여부(체크 했는지 안했는징)
			if(CertificationSend==1){
				swal("인증번호 발송해주세요");
				return false;
			}
			//인증확인 버튼  체크여부(체크 했는지 안했는징)
			if(Certification==1){
				swal("인증확인 해주세요");
				return false;
			}
			
			if(idcheckcheck!=2){
				swal("아이디가 중복됩니다.");
				return false;
			}
			
			//사업자일때만 유효성
			if(num%2==0){
				if(comName==""){
					swal("지점명을 입력해주세요");
					return false;
				}
				if(comAddress==""){
					swal("우편번호를 입력해주세요");
					return false;
				}
				if(comTel==""){
					swal("전화번호를 입력해주세요");
					return false;
				}
				if(comLisenseno==""){
					swal("사업자번호를 입력해주세요");
					return false;
				}
				//사업자 번호 총 자리수는 10자리 이다!
				if(comLisenseno.length!=10){
					swal("사업자번호를 다시 확인해주세요");
					return false;
				}
				if(openTime==""){
					swal("오픈 시간을 선택해주세요");
					return false;
				}
				if(closeTime==""){
					swal("마감 시간을 선택해주세요");
					return false;
				}
				if(comLocation==""){
					swal("위치정보를 입력해주세요");
					return false;
				}
				if(comParking==""){
					swal("주차정보를 입력해주세요");
					return false;
				}
			}
			
			/* 
			console.log('사업자 번호 '+comLisenseno);
			console.log('이름 이름 '+memberName);
			console.log('아이디 '+memberId);
			console.log('비밀번호'+memberPwd);
			console.log('비밀번호 확인'+memberPwd2);
			console.log('이메일 '+memberEmail);
			console.log('인증번호 '+JoinCertificationNum);
			
			 */
			return true;
		}
		
	</script>
	
	<script>
	//주소검색 -api
    function postNumSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("comAddress4").value = extraAddr;
                
                } else {
                    document.getElementById("comAddress4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('comAddress').value = data.zonecode;
                document.getElementById("comAddress3").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("comAddress2").focus();
            }
        }).open();
    }
</script>

	<script>
	/* ---------------------- 아이디 비밀번호 찾기 script -------------------------------------- */
		//아이디 찾기
		function idSendBtn(){
			var idSearchName = $("#idSearchName").val();
		    var idSearchEmail =$("#idSearchEmail").val();
		      
		      //console.log(idSearchEmail);
		       $.ajax({
		         url:"idSearch.co",
		         type:"post",
		         data:{"idSearchName":idSearchName,
		               "idSearchEmail":idSearchEmail},
		         success:function(data){
		        	 console.log("아이디 찾기 통신 서어공");
		        	 if(data!=''){
				         swal("이메일로 아이디 전송 하였습니다.");
		        	 }else{
		        		 swal("회원가입하신 이름과 아이디를 입력해주세요.");
		        	 }
		            //console.log(data);
		         },error:function(data){
		            console.log("아이디찾기 통신 실패");
		         }
		      });
		     return false;
		}
		
		//비밀번호 찾기(임시 비밀번호)
		function PwdSendBtn(){
			var pwdSearchId = $("#pwdSearchId").val();
			var pwdSearchEmail = $("#pwdSearchEmail").val();
			
			$.ajax({
				url:"pwdSearch.co",
				type:"post",
				data:{"pwdSearchId":pwdSearchId,
					"pwdSearchEmail":pwdSearchEmail},
				success:function(data){
					console.log(data);
					if(data!=''){
						console.log("비밀번호 찾기 통신 썽꽁");
						swal("임시 비밀번호를 전송하였습니다.");
					}else{
						swal("회원가입하신 아이디와 이메일을 입력해주세요.")
					}
				},error:function(data){
					console.log("임시 비밀번호 통신 실패 ㅠ");
				}
			});
			return false;
		}
	
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
			location.href = "mypage.mp";

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
