<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item" href="mypage.mp">
		    주문내역
		  </a>
		  <a class="item" href="myPageMyMenu.t">
		    나만의 메뉴
		  </a>
		  <a class="item" href="myPageDelAddr.mp">
		    배송지 관리
		  </a>
		  <a class="item" href="myPageCoupon.mp">
		    쿠폰함
		  </a>
		  <a class="item" href="myPageShare.mp">
		    내 작성글
		  </a>
		  <a class="item active" href="myPageMemModify.t">
		   회원정보 수정
		  </a>
		  <a class="item" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
	<h1>회원 정보 수정</h1>
	<div class="mar">
		<form action="" method="post" >
			<table class="table">
				
				
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
				
				<tr>
					
					<TD align="center">
						<button class="ui yellow button" onclick=""
							style="width: 100%">회원 수정하기</button>

					</TD>
					
					<TD align="center">
						<button class="ui yellow button" onclick="" style="width: 100%">닫기</button>

					</TD>
				</tr>
			</table>
			</form>
		</div>
	
	</div>
	

</body>
</html>