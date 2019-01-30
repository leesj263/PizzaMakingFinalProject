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

<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>

<style>

    /* 회원가입 창 */
    .joindiv{
        position: absolute;
        top:20%;
        left: 35%;
        color: black;
        background-color: white;
        border: 1px solid white;
        width: 450px;
        height: 500px;
        opacity: 1;
        visibility: hidden; 
         border-radius: 5px; /*둥글겡*/
         z-index:500;
    }
     .loginDiv{
        position: absolute;
        top:20%;
        left: 35%;
        color: black;
        background-color: white;
        border: 1px solid white;
        width: 450px;
        height: 500px;
        opacity: 1;
        visibility: hidden; 
         border-radius: 5px; /*둥글겡*/
         z-index:500;
    }
    h1{
        text-align: center;
    }
   
    /* 입력양식 모두! */
    .mar{
        margin: 30px 50px 10px;
    }
    .mar2{
        margin: 30px 50px 10px;
       
    }

</style>

</head>


<body>
	<header id="header">
		<div class="logo"><a href="main.t"><span>Self Pizza Shop</span></a></div>
		<button class="mini ui yellow basic button">로그아웃</button>
		<button class="mini ui yellow basic button" onclick="mypage();">마이페이지</button>
		<a href="#menu">메뉴</a>
	</header>

	
	<nav id="menu">
		<ul class="links">
			<li><a href="main.t">홈</a></li>
			<li><a href="pizzaMaking.cor">주문하기</a></li>
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
		<button class="ui yellow basic button" onclick="login();">로그인</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="ui yellow basic button" onclick="join();">회원가입</button>
		
	</nav>
	
		<!-- ---------------회궝가입=------------------ -->

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
							<button class="ui yellow basic button" style="width: 100%" id="Certification">인증
								확인</button>
						</td>
					</tr>
					<!-- 이메일 전화번호 -->
					<tr> 
					<TD align="center">
					<button class="ui yellow button" onclick="login();" style="width: 100%">계정만들기</button>
					
					
						</TD>
					<TD align="center">
					<button class="ui yellow button" onclick="closeBtn();" style="width: 100%">닫기</button>
			
						</TD>
					</tr>
				</table>
			</div>
		</div>


	<!-- ---------------로그인=------------------ -->
	
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
							<button class="ui yellow basic button" style="width: 100%" onclick="join();">회원가입하기</button>
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

		function join() {
			joindiv.style.visibility = "visible";
			loginDiv.style = "hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
			console.log("회원가입");
		}

		function login() {
			loginDiv.style.visibility = "visible";
			joindiv.style = "hide";
			$('#memberId').focus();
			$('#menu').removeClass('visible');
			console.log("로그인");
		}

		function closeBtn() {
			loginDiv.style = "hide";
			joindiv.style = "hide";
			$('#menu').removeClass('visible'); //메뉴바들어가기
		}
		
		
	</script>
	
	
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
		
		
		function mypage(){
			location.href="mypage.t";
			
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
