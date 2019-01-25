<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file="../common/menubar.jsp" %> --%>
	<%-- <% if(loginUser != null){%> --%>
	<div class="outer">
		<br>
		<h2 align="center">게시판 작성</h2>
		<div class="tableArea">
			<form action="<%-- <%= request.getContextPath() %>/insert.bo --%>" method="post">
				<table align="center">
					<tr>
						<td>분야</td>
						<td>
							<select name="category">
								<option value="10">공통</option>
								<option value="20">운동</option>
								<option value="30">등산</option>
								<option value="40">게임</option>
								<option value="50">낚시</option>
								<option value="60">요리</option>
								<option value="70">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">
							<input type="text" size="60" name="title">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
		
	</div>
	

</body>
</html>