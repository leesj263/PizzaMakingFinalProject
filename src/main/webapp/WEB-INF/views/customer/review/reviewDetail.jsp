<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>

		<div class="container" style="width: 50%; margin-left: 30%">
		<p text-align="center">
		<h2>후기상세보기</h2></p>
		<hr>
		<caption>
			<h2>${review.boardTitle }
				<input type="hidden" name="boardNo" value="${review.boardNo }">
			</h2>
		</caption>
		<table  >
			<tr>
				<td rowspan="2"><b>작성자</b></td>
				<td width="100"><p>${review.memberNickname }</p></td>

				<td align="center" width="76">작성일 :</td>
				<td width="150"><p>${review.boardDate }</p></td>

				<td align="center" width="76">조회수 :</td>
				<td width="150"><p>${review.boardCount }</p></td>
			</tr>
		</table>
		<hr>
		<table class="table">
			<tr>
				<td id="boardContent">
					<% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(review.boardContent, newLineChar, "<br/>")}
				</td>
			</tr>
		</table>	
			                     
             
            
   	<hr>
     <div class="form-group">
			  
			
			<!-- 댓글 란 -->
			  
            	  
			
				<form id="reviewAnswerWrite" action="reviewAnswerWrite.bo" method="post" style="border:solid 1px red;" >
					
					<input type="hidden" name="boardRefNo" value="${review.boardNo }">
					<input type="hidden" name="boardType" value="${review.boardType }">
					<input type="hidden" name="boardCate" value="${review.boardCate }">
					<textarea class="form-control" cols="80" rows="2" id="reviewAnswerWrite" name="reviewAnswerWrite"></textarea>
				
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				
					
						<button class="ui yellow button" type="submit" onclick="reviewAnswerWrite();">등록</button>
					
				<div class="col-md-2"></div>
			</div>
			
			</form>
			
		
		
	
		</div>
		<br>
		<br><br>
	<div align="center">
	    <button class="ui grey button" onclick="location.href='reviewList.bo?'">목록</button>
		<button class="ui yellow button" onclick="reviewUpdate()">수정</button>
		<button class="ui red button"onclick="reviewDelete()">삭제</button>
		
	</div>

	<br>
	<br>
	<script>
		
		function reviewUpdate() {
			var num=$("input[name='boardNo']").val();
			console.log(num);
			location.href="reviewUpdate.bo?num="+num;
		}
		function reviewDelete(){
			var num=$("input[name='boardNo']").val();
			console.log(num);
			location.href="reviewDelete.bo?num="+num;
		} 
		function reviewAnswerWrite(){
			
		}
		</script>
</body>
</html>

