<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	
	<%@ include file="/WEB-INF/views/main/mypageMenubar.jsp"%>

	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
		<div class="ui top attached tabular menu">
		  <a class="item" data-tab="first" href="myPageCoupon.mp">사용 가능 쿠폰</a>
		  <a class="active item" data-tab="second" href="myPageCouponTimeOut.mp">기간 만료 쿠폰</a>

		</div>
		<div class="ui bottom attached active tab segment" data-tab="first">
		 <table class="ui celled table">
			  <thead>
			    <tr><th>쿠폰번호</th>
			    <th>쿠폰명</th>
			    <th>사용여부</th>
			    <th>유효기간</th>
			  </tr></thead>
			  <tbody>
			   <c:forEach items="${iCouponList}" var="i">
			   	<tr>
			   		<td>${i.issueNo }</td>
			    	<td>${i.couponName }</td>
			    	
			    	<c:if test="${i.issueStatus == 'Y'}">
			    		<td>사용</td>
			    	</c:if>
			    	<c:if test="${ i.issueStatus == 'N' }">
			    		<td>미사용</td>
			    	</c:if>
			    		
			    	<td>${i.possiblePeriod }</td>
			   	</tr>
			   </c:forEach>
			    
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
	<script>
		$(function(){
			$("#list4").attr("class", "item active");
		});
	</script>
	

</body>
</html>