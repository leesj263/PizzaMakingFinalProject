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
		  <a class="item active" href="myPageCoupon.t">
		    쿠폰함
		  </a>
		  <a class="item" href="myPageQna.t">
		    문의내역
		  </a>
		  <a class="item">
		   회원정보 수정
		  </a>
		  <a class="item">
		    회원탈퇴
		 </a>
 
	</div>
	
	
	
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
		
		
		
		<div class="ui top attached tabular menu">
		  <a class="active item" data-tab="first" href="myPageCoupon.t">사용 가능 쿠폰</a>
		  <a class="item" data-tab="second" href="myPageCouponTimeOut.t">사용 만료 쿠폰</a>

		</div>
		<div class="ui bottom attached active tab segment" data-tab="first">
		  <table class="ui celled table">
			  <thead>
			    <tr><th>Name</th>
			    <th>Age</th>
			    <th>Job</th>
			  </tr></thead>
			  <tbody>
			    <tr>
			      <td data-label="Name">James</td>
			      <td data-label="Age">24</td>
			      <td data-label="Job">Engineer</td>
			    </tr>
			    <tr>
			      <td data-label="Name">Jill</td>
			      <td data-label="Age">26</td>
			      <td data-label="Job">Engineer</td>
			    </tr>
			    <tr>
			      <td data-label="Name">Elyse</td>
			      <td data-label="Age">24</td>
			      <td data-label="Job">Designer</td>
			    </tr>
			  </tbody>
			</table>
		</div>
		<div class="ui bottom attached tab segment" data-tab="second">
		  Second
		</div>
		<div class="ui bottom attached tab segment" data-tab="third">
		  Third
		</div>
		
		
		
		
		  
		  
	</div>
	
	

</body>
</html>