<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<c:set var="leng" value="${fn:length(modelDetailList) -1}"/>
	
		<a class="ui grey tag label">주문정보</a>
		<table class="ui celled table" style="width:500px;">
		<thead>
		</thead>
		  <tbody>
		    <tr>
		      <td class="tableHead">주문일시</td>
		      <td> ${modelDetailList[leng].orderDate }</td>

		    </tr>
		    <tr>
		      <td class="tableHead">주문자명</td>
 			  <td>${ modelDetailList[leng].orderReceiver }</td>
		    </tr>
		    <tr>
		      <td class="tableHead">휴대폰번호</td>
 			  <td>${ modelDetailList[leng].orderRtel }</td>
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
			    <td>${ modelDetailList[leng].materialName }
			    <br>${ modelDetailList[leng].materialName2 }</td>
			    <td>${ modelDetailList[leng].orderTcount2 }</td>
			 	<td>${ modelDetailList[leng].orderTcount2 * modelDetailList[leng].materialSellprice }</td>
		    </tr>
		    	<c:if test="${ modelDetailList[0].materialCateg == 5 }">
		    		<c:forEach items="${modelDetailList}" begin="0" end="${ leng -1 }"  step="1" var="list">
		    		<tr>
		    			<td>${ list.materialName }</td>
					    <td>${ list.orderTcount }</td>
					 	<td>${ list.orderTcount * list.materialSellprice }</td>
					 </tr>
		    		</c:forEach>
		    	</c:if>
		    
		    	<c:if test="${ modelDetailList[leng].couponName == null}">
		    		<tr>
						<td rowspan="3"></td>
						<td class="totalArea">총 금액</td>
						<td class="totalArea">
								${ modelDetailList[leng].payPrice}원
						</td>
					</tr>
		    	</c:if>
		    	<c:if test="${ modelDetailList[leng].couponName != null}">
		    		<tr>
						<td rowspan="3"> ${ modelDetailList[leng].couponName} </td>
						<td class="totalArea">총 금액</td>
						<td class="totalArea">
								${ modelDetailList[leng].payPrice}원
						</td>
					</tr>
					<tr>
						<td class="totalArea">할인 금액</td>
						<c:if test="${ modelDetailList[leng].couponCateg == 0}">
							<td class="totalArea">
								<c:set var="discount" value="${ modelDetailList[leng].payPrice * modelDetailList[leng].rDiscount}"/>
								${ discount }원
							</td>
						</c:if>
						<c:if test="${ modelDetailList[leng].couponCateg == 1}">
							<td class="totalArea">
								<c:set var="discount" value="${ modelDetailList[leng].pDiscount}"/>
								${discount}원
							</td>
						</c:if>
					</tr>
					<tr>
						<td class="totalArea">최종 결제 금액</td>
						<td class="totalArea" style="color:red;">${ modelDetailList[leng].payPrice - discount}원</td>
						
					</tr>
		    	</c:if>
		    
		    
			
			
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
		      <td>${ modelDetailList[leng].orderReceiver}</td>
		    </tr>
		    <tr>
		      <td class="tableHead">주소</td>
		      <td>${ modelDetailList[leng].deliveryAddr} </td>
		    </tr>
		    <tr>
		      <td class="tableHead">배달매장</td>
 			  <td>${ modelDetailList[leng].comName}점</td>
		    </tr>
		  </tbody>
		</table>
		
		<br><br>
		
	</div>
	
	

</body>
</html>