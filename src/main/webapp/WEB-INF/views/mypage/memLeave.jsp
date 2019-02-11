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
		  <a class="item" href="myPageMyMenu.t">
		    나만의 메뉴
		  </a>
		  <a class="item" href="myPageDelAddr.mp">
		    배송지 관리
		  </a>
		  <a class="item" href="myPageCoupon.mp">
		    쿠폰함
		  </a>
		  <a class="item" href="myPageQna.t">
		    문의내역
		  </a>
		  <a class="item" href="myPageMemModify.t">
		   회원정보 수정
		  </a>
		  <a class="item active" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;" align="center">
		
		<table class="ui celled table" style="width:500px;" >
		  <tbody>
		    <tr>
		      <td class="tableHead">탈퇴사유</td>
		      <td>
		      	<input type="radio">타사이트 유사서비스 이용<br><br>
		      	<input type="radio">자주 이용하지 않음<br><br>
		      	<input type="radio">전반적인 서비스 불만족<br><br>
		      	<input type="radio">기타
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
		
		<button class="ui grey button">탈퇴하기</button>
	</div>
	
	
	
</body>
</html>