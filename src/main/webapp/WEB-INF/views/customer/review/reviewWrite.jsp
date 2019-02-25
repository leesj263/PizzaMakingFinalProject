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
		<h1 align="center">피자학교 후기작성</h1>
		<br>
		<br>
		<div class="tableArea">
			<form action="reviewWrite.bo" method="post" encType="multipart/form-data">
				<table align="center">
					
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>제목</b></td>
						<td colspan="3">
							<input type="text" size="60" name="boardTitle">
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><b>내용</b></td>
						<td>
							<textarea name="boardContent" cols="100" rows="25" style="resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td><b>파일첨부</b></td>
						<td colspan="3">
							<input type="file" size="60" name="boardFile">
						</td>
					</tr>					
				</table>
				<br>
				<div align="center">
					
					<button class="ui yellow button"type="submit">등록하기</button>
					<button class="ui grey button" type="button" onclick="location.href='reviewList.bo'">취소하기</button>
				</div>
			</form>
		</div>
		
	</div>
	<script>
		
		
		function reviewWrite(){
			
		}
		
	</script>
</body>
</html>