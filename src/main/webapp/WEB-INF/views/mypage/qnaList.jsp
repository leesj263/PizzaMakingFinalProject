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

	<%@ include file="/WEB-INF/views/main/mypageMenubar.jsp"%>

	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
	
		<select class="ui dropdown" id="selectBox">
		  <option value="share">공유게시판</option>
		  <option value="review">후기게시판</option>
		  <option value="qna">QnA</option>
		</select>
		
		<button class="ui button" id="findList">
		  조회
		</button>
		
		<script>
			$(function(){
				$("#list5").attr("class", "item active");
				
				if(${boardType == 3}){
					$("#selectBox").val("qna").prop("selected",true);
				}
				else if(${boardType == 0}){
					$("#selectBox").val("review").prop("selected",true);
				}
				else if(${boardType == 1}){
					$("#selectBox").val("share").prop("selected",true);
				}
				
			});
			
			
			$("#findList").click(function(){
				if($("#selectBox").val() == "qna"){
					location.href="myPageQna.mp"
				}else if($("#selectBox").val() == "review"){
					location.href="myPageReview.mp"
				}else if($("#selectBox").val() == "share"){
					location.href="myPageShare.mp"
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
		    	
			    	<c:if test="${m.boardAnswer == 'Y' }">
			    		<td>답변</td>
			    	</c:if>
			 
			    	<c:if test="${m.boardAnswer == 'N' }">
			    		<td>미답변</td>
			    	</c:if>
		    	  	
		    	<c:set var="date" value="${ m.boardDate }"/>
		    	<td>${ fn:substring(date,2,10) }</td>
		    	
		    </tr>
		    </c:forEach>
		    
		  </tbody>
		</table>
		
		
		
		
		

		<c:if test="${ boardType == 3 }">
			<c:set var="addr" value="myPageQna.mp"/>
		</c:if>
		<c:if test="${ boardType == 0 }">
			<c:set var="addr" value="myPageReview.mp"/>
		</c:if>
		<c:if test="${ boardType == 1 }">
			<c:set var="addr" value="myPageShare.mp"/>
		</c:if>
		
		
		 
		<!-- 페이징 버튼 영역 -->
		<div id="pagingArea" align="center">
			<!-- << : 맨앞으로 -->
			<c:if test="${ pi.currentPage > 1}">
				<c:url var="front" value="${ addr }">
					<c:param name="currentPage" value="1"/>                       
				</c:url>
				<a href="${ front }"> &lt;&lt; </a> &nbsp;	
			</c:if>

			<!-- << : 한페이지 앞으로 -->
			<c:if test="${ pi.currentPage > 1}">
				<c:url var="Onefront" value="${ addr }">
					<c:param name="currentPage" value="${ pi.currentPage -1 }"/>                       
				</c:url>
				<a href="${ Onefront }"> &nbsp; &lt; </a> &nbsp;	
			</c:if>
			
			<!-- 숫자 버튼 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="black">&nbsp;<b>[${p}]</b>&nbsp;</font>
				</c:if>
				
				<c:if test = "${ p ne pi.currentPage }">
					<c:url var="btnList" value="${ addr }">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ btnList }">&nbsp;${p}&nbsp;</a>
				</c:if>
			</c:forEach>
			
			<!-- > : 한페이지 뒤로 -->
			<c:if test="${ pi.currentPage < pi.maxPage}">
				<c:url var="OneBack" value="${ addr }">
					<c:param name="currentPage" value="${ pi.currentPage +1 }"/>                       
				</c:url>
				<a href="${ OneBack }"> &nbsp; &gt; </a> &nbsp;	
			</c:if>

			<!-- >> : 맨뒤로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="Back" value="${ addr }">
					<c:param name="currentPage" value="${pi.maxPage}"/>
				</c:url>
				<a href="${ Back }">&gt;&gt;</a>
			</c:if>
		</div>
	 
	 
	 <%-- 
	 시멘틱 UI
	 <div class="ui pagination menu" id="paging">
			<!-- << : 맨앞으로 -->
			<c:if test="${ pi.currentPage > 1}">
				<c:url var="front" value="${ addr }">
					<c:param name="currentPage" value="1"/>                       
				</c:url>
				<a href="${ front }" class="item"> &lt;&lt; </a> &nbsp;	
			</c:if>

			
			<!-- 숫자 버튼 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<a class="active item">${p}</a>
				</c:if>
				
				<c:if test = "${ p ne pi.currentPage }">
					<c:url var="btnList" value="${ addr }">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ btnList }" class="item">&nbsp;${p}&nbsp;</a>
				</c:if>
			</c:forEach>
			

			<!-- >> : 맨뒤로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="back" value="${ addr }">
					<c:param name="currentPage" value="${pi.maxPage}"/>
				</c:url>
				<a href="${ back }" class="item">&gt;&gt;</a>
			</c:if>
		</div> 
		
		--%>

	
</div>
</body>
</html>