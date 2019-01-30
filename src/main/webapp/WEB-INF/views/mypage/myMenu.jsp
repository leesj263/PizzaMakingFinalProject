<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.mymenu{
		margin:10px;
	}
	td{
		padding:10px;
	}
	
</style>

</head>
<body>
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item" href="mypage.t">
		    주문내역
		  </a>
		  <a class="item active" href="myPageMyMenu.t">
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
		  <a class="item">
		   회원정보 수정
		  </a>
		  <a class="item">
		    회원탈퇴
		 </a>
 
	</div>
	
	
	
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
		
		<table border="1">
			  <tbody>
			    <tr>
			      <td>
			      	<table class="mymenu">
			      		<tr>
			      			<td rowspan="2">이미지</td>
			      			<td>이름<br>맛있는 조합</td>
			      		</tr>
			      		<tr>
			      			<td>35,000원</td>
			      		</tr>
			      		<tr>
			      			<td>상세보기</td>
			      			<td>개수</td>
			      		</tr>
			      	</table>
			      	</td>
			      	
			      	<td>
			      	<table class="mymenu">
			      		<tr>
			      			<td rowspan="2">이미지</td>
			      			<td>이름<br>맛있는 조합</td>
			      		</tr>
			      		<tr>
			      			<td>35,000원</td>
			      		</tr>
			      		<tr>
			      			<td>상세보기</td>
			      			<td>개수</td>
			      		</tr>
			      	</table>
			      	</td>
			      	
			      	<td>
			      	<table class="mymenu">
			      		<tr>
			      			<td rowspan="2">이미지</td>
			      			<td>이름<br>맛있는 조합</td>
			      		</tr>
			      		<tr>
			      			<td>35,000원</td>
			      		</tr>
			      		<tr>
			      			<td>상세보기</td>
			      			<td>개수</td>
			      		</tr>
			      	</table>
			      	</td>
			    </tr>
			    
			    <tr>
			      <td>
			      	<table class="mymenu">
			      		<tr>
			      			<td rowspan="2">이미지</td>
			      			<td>이름<br>맛있는 조합</td>
			      		</tr>
			      		<tr>
			      			<td>35,000원</td>
			      		</tr>
			      		<tr>
			      			<td>상세보기</td>
			      			<td>개수</td>
			      		</tr>
			      	</table>
			    	</td>
			      	
			      	<td>
			      	<table class="mymenu">
			      		<tr>
			      			<td rowspan="2">이미지</td>
			      			<td>이름<br>맛있는 조합</td>
			      		</tr>
			      		<tr>
			      			<td>35,000원</td>
			      		</tr>
			      		<tr>
			      			<td>상세보기</td>
			      			<td>개수</td>
			      		</tr>
			      	</table>
			      	</td>
			      	
			      	<td>
			      	<table class="mymenu">
			      		<tr>
			      			<td rowspan="2">이미지</td>
			      			<td>이름<br>맛있는 조합</td>
			      		</tr>
			      		<tr>
			      			<td>35,000원</td>
			      		</tr>
			      		<tr>
			      			<td>상세보기</td>
			      			<td>개수</td>
			      		</tr>
			      	</table>
			      	</td>
			    </tr>
			  </tbody>
		</table>
		
		
		
		
		
	</div>
	
	

</body>
</html>