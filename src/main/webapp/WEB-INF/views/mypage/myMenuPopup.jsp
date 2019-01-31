<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<div id="all">
	<div style="float: left; width:30%; padding:20px;" align="center">
		이미지<br>
		<button class="ui yellow button">삭제</button>
	</div>
	
	<div style="float: left; width:70%; padding:20px;">
	
		
		
		<table class="ui celled table" style="width:300px;">
		  <tbody>
		    <tr>
		      <td class="tableHead">이름</td>
		      <td>맛있는 조합</td>
		    </tr>
		    <tr>
		      <td class="tableHead">가격</td>
		      <td>35,000원</td>
		    </tr>
		    <tr>
		      <td class="tableHead">커스텀</td>
 			  <td>
 			  		도우 : 씬<br>
					사이즈 : L<br>
					엣지 : 크러스트<br>
					소스  : 불고기소스<br>
					토핑 : 치킨3<br>
					올리브3<br>
					버섯1<br>
 			  </td>
		    </tr>
		  </tbody>
		</table>
		
	</div>
	
	
</div><!-- id:all -->	
</body>
</html>