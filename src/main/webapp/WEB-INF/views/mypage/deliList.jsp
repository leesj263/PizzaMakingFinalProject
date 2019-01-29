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
		  <a class="item active" href="myPageDelAddr.t">
		    배송지 관리
		  </a>
		  <a class="item" href="myPageCoupon.t">
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
	
	
	
	
	<div style="float: left; width:70%; padding:20px; margin-top: 50px;">
		
		<table class="ui celled table">
		  <thead>
		    <tr>
			    <th><input type="checkbox"></th>
			    <th>배달지 이름</th>
			    <th>주소</th>
			    <th>배달매장</th>
		 	</tr></thead>
		  <tbody>
		    <tr>
		     <td><input type="checkbox"></td>
		     <td>집</td>
		     <td>서울시 강동구</td>
		     <td>천호점(02-4425-1659)</td>
		    </tr>
		    <tr>
		     <td><input type="checkbox"></td>
		     <td>회사</td>
		     <td>서울시 동대문구</td>
		     <td>동대문점(01-5329-4659)</td>
		    </tr>
		    <tr>
		    <td><input type="checkbox"></td>
		     <td>회사2</td>
		     <td>서울시 광진구</td>
		     <td>자양점(02-110-1326)</td>
		    </tr>
		  </tbody>
		</table>
		
		
		
		
		
	</div>
	
	
	
	
	<div style="float: left; width:20%; padding:20px; margin-top: 50px;">
		<button class="ui yellow button">추가</button>
		<button class="ui yellow button">삭제</button>
	</div>
	
	

</body>
</html>