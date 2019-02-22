<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		td:hover{
		cursor: pointer;
	}
	
</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<%@ include file="/WEB-INF/views/main/mypageMenubar.jsp"%>
	<!-- <div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
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
 
	</div> -->
	
	
	
	
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
		    
		    <c:forEach items="${ orderList }" var="o" varStatus="status">
		    	<tr>
		    		<td>${ o.orderNo }</td>
					<td>
						${ baseList[status.index] } <br>
						${ toppingList[status.index] }
					</td>
					<%-- <td>${ o.orderMaterial }</td> --%>
		    		
		    		<c:if test="${o.orderMethod == 1}">
		    			<td>방문포장</td>
		    		</c:if>
		    		<c:if test="${o.orderMethod == 2}">
		    			<td>배달</td>
		    		</c:if>
		    		
		    		<td>${ o.comName }점</td>
		    		<td><fmt:formatNumber value="${ o.payPrice }"/>원</td>
		    	</tr>
		    </c:forEach>
		    
		  </tbody>
		</table>
	</div>
	
	
	<script>
		$(function(){
			$("#list1").attr("class", "item active");
		});
	
		$("td").click(function(){
			var orderNo = $(this).parent().children("td").eq(0).text();

			location.href="mpOderDetail.mp?orderNo=" + orderNo;
		});
	</script>
	
	

</body>
</html>