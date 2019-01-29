<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
	.content-box{
		width: 1200px;
		margin-top: 50px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50px;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp" %>

	<div class="content-box">
		<div class="two brown ui attached buttons" style="margin-bottom: 20px;">
			<button class="ui button" onclick="location.href='pizzaMaking.cor'">피자 만들기</button>
			<button class="ui button active">사이드 메뉴</button>
		</div>
		
		<div class="ui four column centered grid">
			<div class="row">
				<div class="four column">
					<div style="width: 100%; height: 200px; border: 1px solid black;"></div>
					<h4>바삭쌀가루 치킨</h4>
					<div class="ui container right aligned">8,000원</div>
					<button class="ui button container">장바구니에 담기</button>
				</div>
				<div class="four column">
					<div style="width: 100%; height: 200px; border: 1px solid black;"></div>
					<h4>바삭쌀가루 치킨</h4>
					<div class="ui container right aligned">8,000원</div>
					<button class="ui button container">장바구니에 담기</button>
				</div>
				<div class="four column">
					<div style="width: 100%; height: 200px; border: 1px solid black;"></div>
					<h4>바삭쌀가루 치킨</h4>
					<div class="ui container right aligned">8,000원</div>
					<button class="ui button container">장바구니에 담기</button>
				</div>
				<div class="four column">
					<div style="width: 100%; height: 200px; border: 1px solid black;"></div>
					<h4>바삭쌀가루 치킨</h4>
					<div class="ui container right aligned">8,000원</div>
					<button class="ui button container">장바구니에 담기</button>
				</div>
			</div>
		</div>
		
		
	
	</div>


</body>
</html>