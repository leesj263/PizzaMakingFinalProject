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
		  <a class="active item" data-tab="first" href="myPageCoupon.mp">사용 가능 쿠폰</a>
		  <a class="item" data-tab="second" href="myPageCouponTimeOut.mp">기간 만료 쿠폰</a>

		</div>
		<div class="ui bottom attached active tab segment" data-tab="first">
		  <table class="ui celled table">
			  <thead>
			    <tr><th>쿠폰번호</th>
			    <th>쿠폰명</th>
			    <th>사용여부</th>
			    <th>사용조건</th>
			    <th>유효기간</th>
			  </tr></thead>
			  <tbody>
			    <!-- <tr>
			      <td>789456123</td>
			      <td>회원가입 축하 2% 할인</td>
			      <td>사용</td>
			      <td>2019-01-01~2019-03-13</td>
			    </tr> -->
			    <c:forEach items="${ pCouponList }" var="p">
			    	<tr>
			    		<td>${p.issueNo }</td>
			    		<td>${p.couponName }</td>
			    		
			    		<c:if test="${p.issueStatus == 'Y'}">
			    			<td>사용</td>
			    		</c:if>
			    		<c:if test="${ p.issueStatus == 'N' }">
			    			<td>미사용</td>
			    		</c:if>
			    		
			    		<td>${ p.couponCondition }원 이상 구매시</td>
			    		<td>${p.possiblePeriod }</td>
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