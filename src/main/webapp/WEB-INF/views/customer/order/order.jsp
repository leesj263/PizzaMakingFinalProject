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
		margin-top: 80px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50px;
	}
	div.radio label:hover{
		cursor: pointer;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp" %>
	<div class="content-box">
	
		<h1 align="center">주문서 작성</h1>
		
		<!-- 주문방법 -->
		<h2>주문방법 선택</h2>
		<div class="ui divider"></div>
		<div class="ui radio checkbox" style="margin-right: 50px;">
			<input type="radio" name="orderMethod" id="deliveryOrder" value="1" onchange="orderMethodSel(1);">
			<label for="deliveryOrder" style="font-size: 16px;">배달주문</label>
		</div>
		<div class="ui radio checkbox" style="margin-bottom: 40px;">
			<input type="radio" name="orderMethod" id="visitOrder" value="2" onchange="orderMethodSel(2);">
			<label for="visitOrder" style="font-size: 16px;">방문포장</label>
		</div>
		
		<div>
			<div class="ui grid">
				<div class="left floated eight wide column" id="oaTopLeft">
				</div>
				<div class="right floated eight wide column right aligned" id="oaTopRight">
				</div>
			</div>
			
		</div>
		
		
		<!-- 장바구니 -->
		
	</div>

	<script>
		function orderMethodSel(val){
			$("#oaTopLeft").empty();
			$("#oaTopRight").empty();
			if(val == 1){
				$("#oaTopLeft").append($("<h3>").text("배달주소"));
				$("#oaTopRight").append($("<button class='ui button'>").text("배달주소 등록"));
			} else {
				$("#oaTopLeft").append($("<h3>").text("매장"));
				$("#oaTopRight").append($("<button class='ui button'>").text("매장 등록"));
			}
		}
	</script>

</body>
</html>