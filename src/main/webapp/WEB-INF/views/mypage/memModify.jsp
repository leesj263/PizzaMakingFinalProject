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
	<div class="mar" align="center">
		<form action="modifyMember.co" method="post" id="modifyIdForm">
			<table class="table">
				<div>
					<input type="hidden" name="memberId" value="${sessionScope.loginUser.memberId }">
				</div>
				
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="이름" id="modifyMemberName" name="memberName" value="${sessionScope.loginUser.memberName}">
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="text" placeholder="닉네임을 입력하세요" id="modifyMemberNickName" name="memberNickName" value="${sessionScope.loginUser.memberNickName }">
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="password" placeholder="비밀번호" id="modifyMemberPwd" name="memberPwd">
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="ui input" style="width: 100%">
							<input type="password" placeholder="비밀번호 확인" id="modifyMemberPwd2">
						</div></td>
				</tr>
				<tr>
					<td><div class="ui input" style="width: 100%">
							<input type="text" placeholder="이메일" id="modifyMemberEmail" name="memberEmail" value="${sessionScope.loginUser.memberEmail }">
						</div></td>
					<td align="center">
						<div class="ui yellow basic button" style="width:100%" onclick="return CertificationSendBtn()">이메일 변경(인증번호 발송)</div>
					</td>
				</tr>
				<tr>
					<td><div class="ui input" style="width:100%">
							<input type="text" placeholder="인증번호를  입력해주세요" id="modifyJoinCertificationNum">
						</div></td>
					<td align="center">
						<button class="ui yellow basic button" style="width: 100%"  
							id="modifyCertification" onclick="return CertificationBtn()">인증 확인</button>
					</td>
				</tr>
				
				<tr>
					
					<TD colspan="2" align="center">
						<div class="ui yellow button" onclick="modifyBtn()"
							style="width: 100%">수정하기</div>
					</TD>
					
				</tr>
			</table>
			</form>
		</div>
	
	</div>
	
	
	<script>
		
	//이메일 인증 버튼
	var chkRandomCode=0
	var emailBtnChk=0;
		function CertificationSendBtn(){
		emailBtnChk=1;
			var modifyMemberName = $("#modifyMemberName").val();
			var modifyMemberEmail = $("#modifyMemberEmail").val();
			console.log(modifyMemberName);
			console.log(modifyMemberEmail);
			
			var randomCode = Math.floor(Math.random() * 1000000)+100000;
			if(randomCode>1000000){
				randomCode = randomCode - 100000;
			}
			chkRandomCode = randomCode;
			
			$.ajax({
				url : "modifySendMail.co",
				type:"post",
				data:{"modifyMemberName":modifyMemberName,
						"modifyMemberEmail":modifyMemberEmail,
						"randomCode":randomCode},
				success:function(data){
					console.log("이메일 인증 성공");
					swal("인증번호를 전송하였습니다! 인증번호를 입력해주세요.")
				},error:function(data){
					console.log("이메일 인증 통신 실패");
				}
			});
			return false;
		}
	
	
	//이메일 인증확인 버튼
	function CertificationBtn(){
		
		console.log(emailBtnChk);
		var modifyJoinCertificationNum = $("#modifyJoinCertificationNum").val();
		
		if(modifyJoinCertificationNum==chkRandomCode){
			swal("인증이 확인 되었습니다.");
		}else{
			swal("인증 번호를 다시 확인해주세요.");
			return false;
		}
		
		return false;
	}
	
	//수정하기 버튼
	function modifyBtn(){
		var modifyMemberPwd = $("#modifyMemberPwd").val();
		var modifyMemberPwd2 = $("#modifyMemberPwd2").val();
		var modifyJoinCertificationNum = $("#modifyJoinCertificationNum").val();
		console.log("공백이여닝?"+modifyJoinCertificationNum)
		if(modifyMemberPwd==""){
			swal("비밀번호를 입력해주세요");
			return false;
			
		}
		if(modifyMemberPwd!=modifyMemberPwd2){
			swal("비밀번호가 일치하지 않습니다!");
			return false;
		}
		console.log("번호는?"+emailBtnChk);
		//만약 이메일변경 버튼을 클릭했는데 인증확인 버튼을 클릭 안해줬을때 인증확인 해줘랑
		if(emailBtnChk==1 && modifyJoinCertificationNum==""){
			swal("인증 확인 버튼을 클릭해주세요");
			return false;
		}else{
			$("#modifyIdForm").submit();
			//return true;
		}
		
	}
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>