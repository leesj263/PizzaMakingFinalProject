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
		<h1 align="center">QnA 작성</h1>
		<br>
		<br>
		<div class="tableArea">
			<form action="writeQna.bo" method="post">
				<table align="center">
					<tr>
						<td><b>분야</b></td>
						<td>
							<select name="category" onChange="showCategory(this.options[this.selectedIndex].value);">
								<option value="1" selected>결제 </option>
								<option value="2">주문</option>
								<option value="3">공유 / 후기 / 질문답변</option>
								<option value="4">이벤트</option>
							</select>
							<!-- <select name="boardCate" style="display: none;">
										</select> -->
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>제목</b></td>
						<td colspan="3">
							<input type="text" size="60" name="boardTitle" placeholder="제목을 입력해주세요">
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>내용</b></td>
						<td>
							<input type="textarea" name="content" cols="100" rows="100" style="resize:none;" placeholder="내용을 입력해주세요"></textarea>
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>파일첨부</b></td>
						<td colspan="3">
							<input type="file" size="60" name="title">
						</td>
					</tr>					
				</table>
				<br>
				<div align="center">
					
					<button class="ui yellow button">등록하기</button>
					<button class="ui grey button">취소하기</button>
				</div>
			</form>
		</div>
		
	</div>
	

</body>
</html>