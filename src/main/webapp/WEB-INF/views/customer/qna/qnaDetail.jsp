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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>

	<div class="container" style="width: 50%; margin-left: 30%">
		<p align="center">
		<h2>Q&A상세보기</h2></p>
		<hr>

		<caption>
			<h2>${qna.boardTitle }
				<input type="hidden" name="boardNo" value="${qna.boardNo }">
			</h2>
		</caption>

		<hr>

		<table>
			<tr>
				<td><input type="hidden" name="boardType"
					value="${qna.boardType }">분류</td>
				<td><p>
						<c:choose>
							<c:when test="${qna.boardCateg==1 }">
								<td>[결제]</td>
							</c:when>
							<c:when test="${qna.boardCateg==2 }">
								<td>[주문]</td>
							</c:when>
							<c:when test="${qna.boardCateg==3 }">
								<td>[공유 / 후기 / 질문답변]</td>
							</c:when>
							<c:otherwise>
								<td>[이벤트]</td>
							</c:otherwise>
						</c:choose>
					</p></td>
				<td rowspan="2"><b>작성자</b></td>
				<td width="100"><p>${qna.memberNickname }</p></td>

				<td align="center" width="76">작성일 :</td>
				<td width="150"><p>${qna.boardDate }</p></td>

				<td align="center" width="76">조회수 :</td>
				<td width="150"><p>${qna.boardCount }</p></td>
			</tr>
		</table>
		<hr>
		<table class="table">
			<tr>
				<td id="boardContent">
					<% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(qna.boardContent, newLineChar, "<br/>")}
				</td>
			</tr>
		</table>

		<hr>
		<div class="form-group">


			<font size="4" color="red">댓글</font>

			<hr>
			
		</div>
		
		<br>
		<br>
		<!-- 댓글 란 -->
		<table style="width: 300px;">
			
			<tr>
				<td>
					<div>
						<b>관리자</b>
					</div>
					<div>${answer.boardContent}</div>
				</td>
			</tr>
		</table>

		<hr>

		<br> <br>



	</div>
	<div align="center">
	    <button class="ui grey button" onclick="location.href='qnaList.bo?'">목록</button>
		<button class="ui yellow button" onclick="qnaUpdate()">수정</button>
		<button class="ui red button"onclick="qnaDelete()">삭제</button>
		
	</div>

	<br>
	<br>
	<script>
		
		function qnaUpdate() {
			var num=$("input[name='boardNo']").val();
			console.log(num);
			location.href="qnaUpdate.bo?num="+num;
		}
		function qnaDelete(){
			var num=$("input[name='boardNo']").val();
			console.log(num);
			location.href="qnaDelete.bo?num="+num;
		} 
		</script>

</body>

		
</html>

