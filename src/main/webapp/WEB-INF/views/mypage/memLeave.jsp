<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.tableHead{/*  */
		background-color: #D8D8D8;
		font-weight: bold;
		width:200px;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item" href="mypage.mp">
		    주문내역
		  </a>
		  <a class="item" href="myPageMyMenu.mp">
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
		  <a class="item" href="myPageMemModify.t">
		   회원정보 수정
		  </a>
		  <a class="item active" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;" align="center">
		
		<form action="leaveMember.co" method="post" id="leaveForm">
		<table class="ui celled table" style="width:500px;" >
		  <tbody>
		    <tr>
		      <td class="tableHead">탈퇴사유</td>
		      <td>
		      	<input type="radio" name="leave" cheked>타사이트 유사서비스 이용<br><br>
		      	<input type="radio" name="leave">자주 이용하지 않음<br><br>
		      	<input type="radio" name="leave">전반적인 서비스 불만족<br><br>
		      	<input type="radio" name="leave">기타
		      </td>
		    </tr>
		    <tr>
		      <td class="tableHead">남기는말</td>
		      <td>
		      	<textarea rows="10" cols="50" style="border: 0"></textarea>
		      </td>
		    </tr>
		  </tbody>
		</table>
		
		<div class="ui grey button" onclick="return leaveBtn()">탈퇴하기</div>
	</div>
	</form>
	
	<script>
		function leaveBtn(){
			var leaveForm = $("#leaveForm");
			
			
			
			 swal({
				  title: "정말 탈퇴 하실건가요?ㅠㅠ",
				  text: "탈퇴를 하시면 쿠폰사용 및 이벤트 참여가 불가능합니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("그동안 이용해주셔서 감사를 드립니다!",{
				        icon: "success",
				    });
				    leaveForm.submit();
				   // return true;
				  } else {
				    swal("탈퇴가 취소되었습니다.");
				    return false;
				  }
				}); 
			
			//return true;
		}
	
	
	</script>
	
	
	
</body>
</html>