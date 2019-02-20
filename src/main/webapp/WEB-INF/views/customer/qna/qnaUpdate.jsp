<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
<section class="bg-light" id="portfolio">
<br>
<br>
<br>
<br>
<br>
	<%-- <% if(loginUser != null){%> --%>
	<div class="outer">
		<br>
		<h1 align="center">QnA 수정</h1>
		<br>
		<br>
		<div class="tableArea">
			<form action="updateQna.bo" method="post">
				<table align="center">
					<tr>
						<td><b>분야</b></td>
						<td>
							<select name="category">
								<option value="1" selected>결제 </option>
								<option value="2">주문</option>
								<option value="3">공유 / 후기 / 질문답변</option>
								<option value="4">이벤트</option>
							</select>
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>제목</b></td>
						<td colspan="3">
						<input type="hidden" name="boardNo" value="${qna.boardNo }">
							<input type="text" name="qnaTitle" id="qnaTitle" class="form-control" value="${qna.boardTitle }">
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>내용</b></td>
						<td>
							<textarea name="qnaContent" id="qnaContents" cols="100" rows="25" style="resize:none;">${notice.boardContent}</textarea>
						</td>
					</tr>
					<!-- <tr>
						<td><b>파일첨부</b></td>
						<td colspan="3">
							<input type="file" size="60" name="title">
						</td>
					</tr>	 -->				
				</table>
				<br>
				<div align="center">
					
					<button class="ui yellow button" type="submit" onclick="qnaUpdate();">수정하기</button>
					<button class="ui grey button" type="button" onclick="location.href='qnaList.bo?'">취소하기</button>
					
				</div>
			</form>
		</div>
		
	</div>
	<script>
		function qnaUpdate(){
			var num=$("input[name='boardNo']").val();
			location.href="qnaUpdateC.bo";
		  }
		
	
	
	</script>
	

</body>
</html>