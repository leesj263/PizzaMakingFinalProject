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
	}
	
	.totalArea{
		background-color: #F7D358; /*결제 금액 강조(노랑) */
	}
	
	
	
</style>

</head>
<body>
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item active" href="mypage.mp">
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
		  <a class="item" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	
	
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
	
		<a class="ui grey tag label">주문정보</a>
		<table class="ui celled table" style="width:500px;">
		<thead>
		</thead>
		  <tbody>
		    <tr>
		      <td class="tableHead">주문일시</td>
		      <td> ${ orderDetailList[0].orderDate }</td>
		    </tr>
		    <tr>
		      <td class="tableHead">주문자명</td>
 			  <td>${ orderDetailList[0].orderReceiver }</td>
		    </tr>
		    <tr>
		      <td class="tableHead">휴대폰번호</td>
 			  <td>${ orderDetailList[0].orderRtel }</td>
		    </tr>
		  </tbody>
		</table>
		
		
		
		
		<br><br>
		<a class="ui grey tag label">주문 메뉴</a>
		<table class="ui celled table" style="width:700px;">
		<thead>
		</thead>
		  <tbody>
		    <tr>
		      <td class="tableHead">상품명</td>
		      <td class="tableHead">수량</td>
		      <td class="tableHead">금액</td>
		    </tr>
		    <tr>
		    
		    <td>
		      		${ orderMain }
		   	</td>
		    
		   <c:forEach items="orderSide" var="o">
		   		<td></td>
		   		<td></td>
		   		<td></td>
		   </c:forEach>
		      
		    </tr>
		    
		    
		    
		    <tr>
				<td rowspan="3"></td>
				<td class="totalArea">총 금액</td>
				<td class="totalArea">
					<c:if test="">
					
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="totalArea">할인 금액</td>
				<td class="totalArea">5,000원</td>
			</tr>
			<tr>
				<td class="totalArea">최종 결제 금액</td>
				<td class="totalArea" style="color:red;">30,000원</td>
			</tr>
			
			
		  </tbody>
		</table>
		
		
		
		
		
	
		
		
		
		<br><br>
		<a class="ui grey tag label">배송지 정보</a>
		<table class="ui celled table" style="width:500px;">
		<thead>
		</thead>
		  <tbody>
		    <tr>
		      <td class="tableHead">수령인</td>
		      <td>유솔이</td>
		    </tr>
		    <tr>
		      <td class="tableHead">주소</td>
		      <td> 서울시 강남구 역삼동 </td>
		    </tr>
		    <tr>
		      <td class="tableHead">배달매장</td>
 			  <td>역삼본점(02-555-8888)</td>
		    </tr>
		  </tbody>
		</table>
		
		<br><br>
		
	</div>
	
	

</body>
</html>