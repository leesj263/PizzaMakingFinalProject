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
		<a class="item" href="mypage.t">
		    주문내역
		  </a>
		  <a class="item" href="myPageMyMenu.t">
		    나만의 메뉴
		  </a>
		  <a class="item" href="myPageDelAddr.t">
		    배송지 관리
		  </a>
		  <a class="item" href="myPageCoupon.t">
		    쿠폰함
		  </a>
		  <a class="item" href="myPageQna.t">
		    문의내역
		  </a>
		  <a class="item active" href="myPageMemModify.t">
		   회원정보 수정
		  </a>
		  <a class="item" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
	수정페이지
	</div>
	

</body>
</html>