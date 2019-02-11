<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item" href="mypage.mp">
		    주문내역
		  </a>
		  <a class="item" href="myPageMyMenu.t">
		    나만의 메뉴
		  </a>
		  <a class="item" href="myPageDelAddr.mp">
		    배송지 관리
		  </a>
		  <a class="item" href="myPageCoupon.mp">
		    쿠폰함
		  </a>
		  <a class="item active" href="myPageQna.mp">
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
	
		<select class="ui dropdown" id="selectBox">
		  <option value="qna">QnA</option>
		  <option value="review">후기게시판</option>
		  <option value="share">공유게시판</option>
		</select>
		
		<table class="ui celled table">
		  <thead>
		    <tr>
			    <th>문의번호</th>
			    <th>문의제목</th>
			    <th>답변여부</th>
			    <th>작성일</th>
		 	</tr></thead>
		  <tbody>
		    <c:forEach items="${ myWritingList }" var="m">
		    <tr>
		    	<td>${ m.boardNo }</td>
		    	<td>${ m.boardTitle }</td>
		    	
		    	<c:if test="${m.boardAnswer == 'Y' }">
		    		<td>답변</td>
		    	</c:if>
		    	
		    	<c:if test="${m.boardAnswer == 'N' }">
		    		<td>미답변</td>
		    	</c:if>
		    	
		    <%-- 	<td>${ m.boardDate }</td> --%>
		    	
		    	<c:set var="date" value="${ m.boardDate }"/>
		    	<td>${ fn:substring(date,2,10) }</td>
		    	
		    
		    	
		    	
		    </tr>
		    </c:forEach>
		    
		  </tbody>
		</table>
		
		
		
		
		
	</div>
	
	

</body>
</html>