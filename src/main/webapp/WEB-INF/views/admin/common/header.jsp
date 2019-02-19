<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>셀프피자제작소 ADMIN</title>
</head>
<body>
	<c:if test="${sessionScope.loginUser.memberCateg==1 }">
		<script>alert("접근 권한이 없습니다.");</script>
		<jsp:forward page="/goMain.com?memberNo=${sessionScope.loginUser.memberNo }"/>
	</c:if>
	<c:if test="${sessionScope.loginUser.memberCateg==0}">
		<script>alert("접근 권한이 없습니다.");</script>
		<jsp:forward page="/goMain.co"/>
	</c:if>
	<c:if test="${empty sessionScope.loginUser}">
		<script>alert("접근 권한이 없습니다. 로그인이 필요합니다.");</script>
		<jsp:forward page="/goMain.co"/>
	</c:if>
	<c:if test="${sessionScope.loginUser.memberCateg==2 }">
		<jsp:include page="sidebar.jsp" />
		<jsp:include page="nav.jsp" />
	</c:if>
