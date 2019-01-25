<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	
	<a href="adminMain.t">관리자 페이지</a>
	<a href="movePage.com?movePage=companyMain">업체 페이지</a>
	<a href="order.t">주문 페이지</a>
	<a href="main.t">메인 페이지</a>
	
	<div style="text-align: center;">
		<h2>피자!</h2>
		<p>먹을꺼야? -`д´-</p>
		<img src="resources/customer/images/pizza.jpg" width="400px;">
	</div>

	<%-- <jsp:forward page="WEB-INF/views/admin/adminMain.jsp"/> --%>
</body>
</html>