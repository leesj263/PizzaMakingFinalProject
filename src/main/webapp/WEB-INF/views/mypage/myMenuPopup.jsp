<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/pmfp/resources/main/assets/css/main.css" />

<style>
	.tableHead{/*  */
			background-color: #D8D8D8;
			font-weight: bold;
		}
</style>


<!-- 시멘틱 UI -->
<link rel="stylesheet" type="text/css" href="/pmfp/resources/main/assets/js/semantic/semantic.min.css">

<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>

</head>
<body>
<div>
	<!-- <div style="float: left; width:40%; padding-top:20px; padding-left: 20px;"> -->
	<div style="float: left; width:40%; padding-top:20px; text-align: center; padding-left: 15px">
		<img src="resources/customer/images/myPizza/${mypizzaImgChangeName }" width="200px" height="200px" ><br>
		<button class="ui yellow button" >삭제</button>
	</div>
	
	<!-- <div style="float: left; width:60%; padding:20px;"> -->
	<div style="float: left; width:60%; padding-top:20px; padding-right: 20px; ">
		<table class="ui celled table" style="width:250px;" align="right">
		  <tbody>
		    <tr>
		      <td class="tableHead">이름</td>
		      <td id="test">${ mypizzaName }</td>
		    </tr>
		    <tr>
		      <td class="tableHead">가격</td>
		      <td><fmt:formatNumber value="${ priceSum }"/>원</td>
		    </tr>
		    <tr>
		      <td class="tableHead">커스텀</td>
 			  <td>
		  		<c:forEach items="${ toppingList }" var="list">
		  			${ list }<br>
		  		</c:forEach>
 			  </td>
		    </tr>
		  </tbody>
		</table>
		
	</div>
	
	
</div>
</body>
</html>