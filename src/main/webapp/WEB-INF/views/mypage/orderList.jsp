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
		<a class="item active" href="mypage.t">
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
		  <a class="item" href="myPageMemModify.t">
		   회원정보 수정
		  </a>
		  <a class="item" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	
	
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
		
		<table class="ui celled table">
		  <thead>
		    <tr>
			    <th>주문번호</th>
			    <th>주문명</th>
			    <th>배달방식</th>
			    <th>주문매장</th>
			    <th>주문금액</th>
		 	</tr></thead>
		  <tbody>
		    <tr onclick="location.href='myPageOrderDetail.t'">
		     <td>20190117</td>
		     <td>도우-씬 /사이즈-L 
				엣지-크러스트 / 소스-토마토소스
				토핑-불고기1, 새우1, 파인애플2</td>
		     <td>배달</td>
		     <td>천호점</td>
		     <td>25,000원</td>
		    </tr>
		    <tr>
		     <td>20190118</td>
		     <td>도우-씬 /사이즈-L 
				엣지-크러스트 / 소스-토마토소스
				토핑-불고기1, 새우1, 파인애플2</td>
		     <td>배달</td>
		     <td>동대문점</td>
		     <td>38,000원</td>
		    </tr>
		    <tr>
		    <td>20190120</td>
		     <td>도우-씬 /사이즈-L 
				엣지-크러스트 / 소스-토마토소스
				토핑-불고기1, 새우1, 파인애플2</td>
		     <td>배달</td>
		     <td>역삼점</td>
		     <td>40,000원</td>
		    </tr>
		  </tbody>
		</table>
		
		
		
		
		
	</div>
	
	

</body>
</html>