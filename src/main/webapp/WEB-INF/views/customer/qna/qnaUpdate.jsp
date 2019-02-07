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
	<div class="outer">
		<br>
		<h1 align="center">QnA 수정</h1>
		<br>
		<br>
		<div class="tableArea">
			<form action="<%-- <%= request.getContextPath() %>/insert.bo --%>" method="post">
				<table align="center">
					<tr>
						<td><b>분야</b></td>
						<td>
							<select name="category">
								<option value="10">결제 및 주문</option>
								<option value="20">회원가입</option>
								<option value="30">e-쿠폰</option>
								<option value="70">기타</option>
							</select>
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>제목</b></td>
						<td colspan="3">
							<input type="text" size="60" name="title">
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>내용</b></td>
						<td>
							<textarea name="content" cols="100" rows="25" style="resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td><b>파일첨부</b></td>
						<td colspan="3">
							<input type="file" size="60" name="title">
						</td>
					</tr>					
				</table>
				<br>
				<div align="center">
					
					<button class="ui yellow button">수정하기</button>
					<button class="ui grey button">취소하기</button>
				</div>
			</form>
		</div>
		
	</div>
	

</body>
</html>