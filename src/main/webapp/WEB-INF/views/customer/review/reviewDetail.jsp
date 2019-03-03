<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
</style>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>

	<div class="container" style="width: 50%; margin-left: 30%">
		<p text-align="center">
		<h2>후기상세보기</h2>
		</p>
		<hr>
		<caption>
			<h2>${review.boardTitle }
				<input type="hidden" name="boardNo" value="${review.boardNo }">
			</h2>
		</caption>
		<table>
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
			
				<div class="image" style="padding-left:18%">
						<img src="resources/customer/images/review/${image.imgChangeName }"
							style="height: 300px; width:500px">
					</div>
				<tr><div id="boardContent" style="padding-left:19%">
					<% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(review.boardContent, newLineChar, "<br/>")}
				</div><tr>

			
		</table>



		<hr>
		<!-- 댓글 란 -->
		<div class="form-group" id="replySelectTable">



			<table id="replySelectTable" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<c:forEach var="r" items="${ reply }">

					<tbody>
						<tr>
							<td width="15%" color="">${ r.memberNickname }</td>
							<td colspan="3">${ r.boardContent }</td>
							<td width="15%">${ r.boardDate }</td>

						</tr>
				</c:forEach>
			</table>
		</div>




		<!-- <form id="reviewAnswerWrite" action="reviewAnswerWrite.bo" method="post" style="border:solid 1px red;" > -->
		<br>
		<br>
		<!-- <div id="but"> -->
		<tr>
			<input type="hidden" name="boardRefNo" value="${review.boardNo }">
			<input type="hidden" name="boardRefNo" value="${review.boardNo }">
			<input type="hidden" name="boardRefNo" value="${review.boardNo }">
			<td><div style="padding-left:10%"><textarea class="form-control" cols="80" style="padding-top: 20px;"
				id="reviewAnswerWrite" name="reviewAnswerWrite"
				></textarea></div></td>
			<td><button class="ui yellow button"
				onclick="return reviewAnswerWrite();" style="padding-top: 20px;">등록</button></td>
				</tr>
			<!-- <div class="col-md-2"></div> -->
		<!-- </div> -->
		<!-- <div class="row">
				
					
						
					
				<div class="col-md-2"></div>
			</div> -->

		<!-- 	</form> -->
	</div>




	<br>
	<br>
	<br>
	<div align="center">
		<button class="ui grey button"
			onclick="location.href='reviewList.bo?'">목록</button>
		<button class="ui yellow button" onclick="reviewUpdate()">수정</button>
		<button class="ui red button" onclick="reviewDelete()">삭제</button>

	</div>

	<br>
	<br>
	<script>
		
	function reviewAnswerWrite(){
	      
	      var writer = ${ loginUser.memberNo }
	      var content = $("#reviewAnswerWrite").val();
	      var boardNo =${ review.boardNo };
	      
	      console.log(writer);
	      console.log(content); 
	      console.log(boardNo);
	      
	      $.ajax({
	          url:"bringreviewAnswer.bo",
	          data:{ writer:writer, content:content, boardNo:boardNo},
	          type:"post",
	          success:function(data){
	             console.log(data);
	             
	             var $replySelectTable = $("#replySelectTable");
	             $replySelectTable.html('');
	             
	             
	                
	                $("#reviewAnswerWrite").val("");
	                window.location.reload();

	              
	             
	          },
	          error:function(){
	             console.log("실패");
	          }
	       });

	      
	   }
</script>
</body>
</html>

