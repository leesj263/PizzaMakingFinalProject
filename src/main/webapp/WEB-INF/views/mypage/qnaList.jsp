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
		  <a class="item active" href="myPageQna.t">
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
		
		<table class="ui celled table">
		  <thead>
		    <tr>
			    <th>문의번호</th>
			    <th>문의제목</th>
			    <th>배달방식</th>
			    <th>주문매장</th>
		 	</tr></thead>
		  <tbody>
		    <tr>
		     <td>20190117</td>
		     <td>주문관련 문의드립니다</td>
		     <td>답변</td>
		     <td>2019-01-01</td>
		    </tr>
		    <tr>
		     <td>20190118</td>
		     <td>쿠폰 이용기간 지났는데...	</td>
		     <td>미답변</td>
		     <td>2019-01-03</td>
		    </tr>
		    
		  </tbody>
		</table>
		
		
		
		
		
	</div>
	
	

</body>
</html>