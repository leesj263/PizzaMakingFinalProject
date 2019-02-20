<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	td{
		padding:10px;
	}
	
</style>

</head>
<body>
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<%@ include file="/WEB-INF/views/main/mypageMenubar.jsp"%>

	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
		<table align="center">
			<!-- <tr>
				<td>
					<div class="ui card" style="width: 250px;">
					  <div class="content">
					    <div align='center'>맛있는조합</div>
					  </div>
					  <div class="image">
					    <img src="/pmfp/main/webapp/resources/main/images/222.jpg" style="height: 150px;">
					  </div>
					  <div class="content" align="center">
					   <button class="ui secondary basic button">상세보기</button>
					  </div>
					</div>
				</td>
				</tr> -->
				
				<c:forEach items="${myPizzaList }" var="m">
					<tr>
						<td>
							<div class="ui card" style="width: 250px;">
							  <div class="content">
							    <div align='center'>${ m.mypizzaName }</div>
							    <input id="mypizzaNo" type="hidden" value="${ m.mypizzaNo }">
							  </div>
							  <div class="image">
							    <img src="resources/customer/images/myPizza/${m.imgChangeName }" style="height: 150px;">
							  </div>
							  <div class="content" align="center">
							   <button class="ui secondary basic button">상세보기</button>
							  </div>
							</div>
						</td>
					</tr>
				</c:forEach>
				
				
				

			
			
		
		</table>
		
		
		
		<button id="pop">상세보기 팝업</button>
		
		<script>
			$(function(){
				$("#list2").attr("class", "item active");
			});
		
			var screenW = screen.availWidth; // 스크린 가로사이즈
			var screenH = screen.availHeight; // 스크린 세로사이즈
			
			var popW = 500;  //팝업 가로사이즈
			var popH = 500;  //팝업 세로사이즈
			
			var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
			var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 

			$("#pop").click(function(){
				 window.open('myPageMyMenuPop.t','','width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
			
			});
			
		</script>
		
		
		
	</div>
	
	

</body>
</html>