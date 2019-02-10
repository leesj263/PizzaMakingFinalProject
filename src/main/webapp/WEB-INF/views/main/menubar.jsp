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

	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />


	<header id="header">
		<div class="logo">
			<a href="main.t"><span>Self Pizza Shop</span></a>
		</div>
		<c:if test="${!empty sessionScope.loginUser}">
			<h5 style="display: inline; color: white">
				<c:out value="${sessionScope.loginUser.memberName }님 환영합니다" />
			</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="mini ui yellow basic button"
				onclick="location.href='logout.co'">로그아웃</button>
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
			<h3 align="center">
				<c:out value="${sessionScope.loginUser.memberName }님 환영합니다" />
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
					<li><a href="reviewList.t">후기</a></li>
				</ul></li>

			<li><a id="menuList2">고객센터</a>
        
				<ul id="down2" style="display: none">
					<li><a href="qnaList.t">Q&A</a></li>
					<br>
					<!-- 이건 그냥 테스트용으로 만든거! 지워도됨  : 솔 -->
					<li><a href="faqOrder.t">FAQ</a></li>
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

				<button class="mini ui yellow basic button"
					onclick="location.href='logout.co'">로그아웃</button>
				<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
			</div>
		</c:if>
	</nav>

	<!-- ---------------회원가입=------------------ -->

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
						<button class="ui yellow basic button" style="width: 100%" onclick="return CertificationSendBtn()">인증번호 발송</button>
					</td>
				</tr>
				<tr>
					<td><div class="ui input" style="width: 100%">
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
							<input type="text" placeholder="주소 입력" id="comAddress" name="comAddress">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width: 100%" onclick="">주소 검색</button>
					</td>
				</tr>
				<tr style="display: none;" id="comAddressTr2">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="상세주소를 입력하세요" id="comAddress2" name="comAddress2">
						</div></td>
				</tr>
				<tr style="display: none;" id="comTelTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="tel" placeholder="전화번호를 입력하세요" id="comTel" name="comTel">
						</div></td>
				</tr>
				<tr style="display: none;" id="comLisensenoTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="사업자 번호를 입력하세요" id="comLisenseno" name="comLisenseno">
						</div></td>
				</tr>
				<tr style="display: none;" id="comSalestimeTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="오픈시간과 마감시간 입력해주세요" id="comSalestime" name="comSalestime">
						</div></td>
				</tr>
				<tr style="display: none;" id="comLocationTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="위치정보를 입력해주세요" id="comLocation" name="comLocation">
						</div></td>
				</tr>
				<tr style="display: none;" id="comParkingTr">
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="주차정보를 입력해주세요" id="comParking" name="comParking">
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
						<button class="ui yellow button" onclick="closeBtn();"
							style="width: 100%">닫기</button>

					</TD>
				</tr>
			</table>
			</form>
		</div>
	</div>


	<!-- ---------------로그인=------------------ -->

	<form action="login.co" method="post">
		<div id="loginDiv" class="hiddenCss">
			<br>
			<h1>login</h1>

			<div class="mar">
				<table class="table">
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="아이디" id="memberId"
									name="memberId"> <i class="user outline icon"></i>
							</div></td>
						<td rowspan="2">
							<button class="ui yellow basic button"
								style="width: 100%; height: 78px" type="submit" id="loginBtn">로그인</button>

						</td>
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="password" placeholder="비밀번호" name="memberPwd">
								<i class="heart outline icon"></i>
							</div></td>
					</tr>
					<tr style="width: 50px">
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="ui yellow button"
								style="width: 100%">카카오 로그인</button>
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
	<!-- --------------비회원 로그인---------------- -->


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
										class="hidden"> <label>동의안함</label>
								</div>
							</div>
							<div class="field">
								<div class="ui radio checkbox">
									<input type="radio" name="agree" tabindex="0" class="hidden">
									<label>동의함</label>
								</div>
							</div>

						</div>
						<table class="table">
						<tr >
						<td colspan="2"><div class="ui left icon input">
								<input type="text" placeholder="이름" id="memberName"
									name="memberName" style="width: 350px"> <i class="user outline icon"></i>
							</div></td>
						<!--  <td rowspan="3">
							<button class="ui yellow basic button"
								style="width: 100%; height: 120px" type="submit" id="NonMemberloginBtn">비회원로그인</button>

						</td>  -->
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="핸드폰 번호 입력하세요" name="memberPhone">
								<i class="heart outline icon"></i>
							</div></td>
						 <td>
							<button class="ui yellow basic button"
								style="width: 100%; height: 40px" type="submit" id="NonMemberloginBtn">인증번호 발송</button>

						</td>
					</tr>
					<tr>
						<td><div class="ui left icon input">
								<input type="text" placeholder="인증번호" name="memberCertificationNumber">
								<i class="envelope outline icon"></i>
							</div></td>
						
						<td>
							<button class="ui yellow basic button"
								style="width: 100%; height: 40px" type="submit" id="nonMemberCertification">인증번호 확인</button>

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

	<!-- --------------아이디/비밀번호 찾기-------------- -->

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


<!----------------------- 화면 띄우기 script -------------------------------------->
	<script>
		var joindiv = document.all.joindiv;
		var loginDiv = document.all.loginDiv;
		var idPwdSearchDiv = document.all.idPwdSearchDiv;
		var nonMemberloginDiv = document.all.nonMemberloginDiv;

		function join() {
			joindiv.style.visibility = "visible";
			loginDiv.style = "hide";
			nonMemberloginDiv.style = "hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
			console.log("회원가입");
		}

		function login() {
			loginDiv.style.visibility = "visible";
			joindiv.style = "hide";
			idPwdSearchDiv.style = "hide";
			nonMemberloginDiv.style = "hide";
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

		function nonMember() {
			nonMemberloginDiv.style.visibility = "visible";
			idPwdSearchDiv.style = "hide";
			loginDiv.style = "hide";
			joindiv.style = "hide";
		}
		/* $("#login").click(function(){
			$("#memberCateg1").h
		}); */
		var idCheck = 1;
		var CertificationSend =1;
		var Certification =1;
		
		//아이디 중복확인 버튼 
		function IdCheckBtn(){
			idCheck = 2;
			return false;
		}
		
		//인증번호 발송 버튼
		function CertificationSendBtn(){
			CertificationSend=2;
			return false;
		}
		
		//인증확인 버튼
		function CertificationBtn(){
			Certification=2;
			return false;
		}	
		
		
	</script>

<!----------------------- 인증확인 script -------------------------------------->
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
		
		$("#nonMemberCertification").click(function() {
			swal({
				title : "인증 확인",
				text : "인증이 확인되었습니다.",
				icon : "success",
				button : "확인",
			});
		})
		
		$("#NonMemberloginBtn").click(function() {
			swal({
				title : "인증 번호 발송",
				text : "인증 번호 발송되었습니다.",
				icon : "success",
				button : "확인",
			});
			console.log($('.ui.checkbox'));
		})

		$('.ui.checkbox').checkbox();
		console.log($('.ui.checkbox'));
		

		

<!----------------------- 사업자로 변환 script -------------------------------------->

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
			 
			//사업자일때
			if(num%2==0){ 
				$("#joindiv").css({"height":"800px"});
				
			 } else{
				 $("#joindiv").css({"height":"500px"});
			 }
			 console.log("클릭되닝?"+num);
			 
			 //짝수일때가 사업자!
			var changeNum = $("#changeNum").val(num);
			console.log(changeNum.val());
		});
	
<!----------------------- 회원가입 유효성 검사 script -------------------------------------->
		function CreateAccount(){
			var comLisenseno = $("#comLisenseno").val();	//사업자 번호 
			var memberName = $("#memberName").val();	//이름 
			var memberId = $("#memberId").val();		//아이디 
			var memberPwd = $("#memberPwd").val();		//비밀번호 
			var memberPwd2 = $("#memberPwd2").val();	//비밀번호 확인
			var memberEmail = $("#memberEmail").val();	//이메일 
			var JoinCertificationNum = $("#JoinCertificationNum").val();	//인증번호 
			var comName =$("#comName").val();			//지점명
			var comAddress =$("#comAddress").val();		//주소
			var comTel =$("#comTel").val();				//전화번호
			var comLisenseno =$("#comLisenseno").val();	//사업자번호
			var comSalestime =$("#comSalestime").val();	//영업시간
			var comLocation =$("#comLocation").val();	//위치정보
			var comParking =$("#comParking").val();		//주차정보
			
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
			
			//사업자일때만 유효성
			if(num%2==0){
				if(comName==""){
					swal("지점명을 입력해주세요");
					return false;
				}
				if(comAddress==""){
					swal("주소를 입력해주세요");
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
				if(comSalestime==""){
					swal("영업시간 입력해주세요");
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
