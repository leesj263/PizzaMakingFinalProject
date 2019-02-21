<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/pmfp/resources/customer/js/common.js"></script>
<style>

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp" %>
	
	<div style="position: absolute; left:40%; top:40%;">
		<h2>주문이 완료되었습니다.</h2>
		<c:if test="${ !empty sessionScope.loginUser }">
		<button class="ui button green attached" style="margin-left: 60px;" onclick="location.href='mypage.mp'">마이페이지로</button>
		</c:if>
		<c:if test="${ !empty sessionScope.noUserLogin }">
		<button class="ui button green attached" style="margin-left: 60px;" onclick="location.href='main.t'">메인페이지로</button>
		</c:if>
	</div>
	

	<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>
</body>
</html>