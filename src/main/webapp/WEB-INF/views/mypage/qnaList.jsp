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
		
		<button class="ui button" id="findList">
		  조회
		</button>
		
		<script>
			$("#findList").click(function(){
				if($("#selectBox").val() == "qna"){
					location.href="myPageQna.mp"
				}else if($("#selectBox").val() == "review"){
					location.href="myPageReview.mp"
				}else if($("#selectBox").val() == "share"){
					location.href="myPageShare.mp"
				}
			});
			
			$(function(){
				if(${boardType == "3"}){
					$("#selectBox").val("qna").prop("selected",true);
				}else if(${boardType == "0"}){
					$("#selectBox").val("review").prop("selected",true);
				}else if(${boardType == "1"}){
					$("#selectBox").val("share").prop("selected",true);
				}
				
			});
		</script>
		

			<table class="ui celled table" id="list">
			  <thead>
			    <tr>
			    <c:if test="${ boardType == '0'}">
				    <th>후기번호</th>
				    <th>후기제목</th>
				    <th>답변여부</th>
				    <th>작성일</th>
				</c:if>
				<c:if test="${ boardType == '1'}">
				    <th>글번호</th>
				    <th>글제목</th>
				    <th>작성일</th>
				</c:if>
				<c:if test="${ boardType == '3'}">
				    <th>문의번호</th>
				    <th>문의제목</th>
				    <th>답변여부</th>
				    <th>작성일</th>
				</c:if>
			 	</tr></thead>

		  <tbody>
		    <c:forEach items="${ myWritingList }" var="m">
		    <tr>
		    	<td>${ m.boardNo }</td>
		    	<td>${ m.boardTitle }</td>
		    	
		    	<%-- <c:if test="${ boardType == '0' || boardType == '3' }"> --%>
			    	<c:if test="${m.boardAnswer == 'Y' }">
			    		<td>답변</td>
			    	</c:if>
			    	
			    	<c:if test="${m.boardAnswer == 'N' }">
			    		<td>미답변</td>
			    	</c:if>
		    <%-- 	</c:if>		 --%>  
		    	  	
		    	<c:set var="date" value="${ m.boardDate }"/>
		    	<td>${ fn:substring(date,2,10) }</td>
		    	
		    </tr>
		    </c:forEach>
		    
		  </tbody>
		</table>
		
		
		
		<!-- 페이징 버튼 영역 -->
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="blistBack" value="/selectList.bo">
					<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
				</c:url>
				<a href="${ blistBack }">[이전]</a> &nbsp;
			</c:if>
		</div>
		
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="red" size="4"><b>[${p}]</b></font>
			</c:if>
			
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="blistCheck" value="selectList.bo">
					<c:param name="currentPage" value="${ p }"/>
				</c:url>
				<a href="${ blistCheck }">${p }</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${ pi.currentPage >= pi.maxPage }">
			&nbsp;[다음]
		</c:if>
		
		<c:if test="${pi.currentPage < pi.maxPage }">
			<c:url var="blistEnd" value="selectList.bo">
				<c:param name="currentPage" value="${ pi.currentPage +1 }"/>
			</c:url>
			&nbsp;<a href="${blistEnd }">[다음]</a>
		</c:if>
		
	</div>
	
	

</body>
</html>