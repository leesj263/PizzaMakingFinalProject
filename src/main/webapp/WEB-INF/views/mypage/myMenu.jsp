<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	td{
	/* 			  위   오른쪽   아래     왼쪽*/
		padding: 0 20px 20px 20px;
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

				<tr>
					<c:forEach items="${myPizzaList }" var="m" varStatus="status">
						<c:if test="${status.count % 4 == 1}"></tr><tr></c:if>
								
								<td>
									<div class="ui card" style="width: 250px;">
									  <div class="content">
									    <div align='center'>${ m.mypizzaName }</div>
									  </div>
									  <div class="image">
									    <img src="resources/customer/images/myPizza/${m.imgChangeName }" style="height: 250px;width: 250px">
									  </div>
									  <div class="content" align="center">
									<button class="ui secondary basic button" onclick="mypizzaDetail(${ m.mypizzaNo }, '${ m.mypizzaName }','${m.imgChangeName }' );">상세보기</button>
									  </div>
									</div>
								</td>
					</c:forEach>
				</tr> 
		</table>
		
		<c:set var="addr" value="myPageMyMenu.mp"/>
		
		<!-- 페이징 버튼 영역 -->
		<div id="pagingArea" align="center">
			<!-- << : 맨앞으로 -->
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="front" value="${ addr }">
					<c:param name="currentPage" value="1"/>
				</c:url>
				<a href="${ front }">&lt;&lt;</a> &nbsp;
			</c:if>
			
			<!-- << : 한페이지 앞으로 -->
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="Onefront" value="${ addr }">
					<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
				</c:url>
				<a href="${ Onefront }">&nbsp; &lt;</a>&nbsp;
			</c:if>
			
			<!-- 숫자 버튼 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="black">&nbsp;[${ p }]&nbsp;</font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="btnList" value="${ addr }">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
						<a href="${ btnList }">&nbsp;${p}&nbsp;</a>
				</c:if>
			</c:forEach>
			
			<!-- > : 한페이지 뒤로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="Oneback" value="${ addr }">
					<c:param name="currentPage" value="${ currentPage + 1 }"/>
				</c:url>
				<a href="${ Oneback }"> &nbsp; &gt; </a> &nbsp;	
			</c:if>
			
			<!-- >> : 맨뒤로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="back" value="${ addr }">
					<c:param name="currentPage" value="${ pi.maxPage }"/>
				</c:url>
				<a href ="${ back }">&gt;&gt;</a>
			</c:if>
		</div>
		
		
		
		<!-- <button id="pop">상세보기 팝업</button> -->
		
		<script>
			 $(function(){
				$("#list2").attr("class", "item active");
			});
			
			var screenW = screen.availWidth; // 스크린 가로사이즈
			var screenH = screen.availHeight; // 스크린 세로사이즈
				
			var popW = 500;  //팝업 가로사이즈
			var popH = 420;  //팝업 세로사이즈
			
			var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
			var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
			
			var url = 'myPageMyMenuPop.mp?mypizzaNo=';
			var option = 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no';
			 
			function mypizzaDetail(value1, value2, value3){
				console.log(typeof(value1));
				console.log(typeof(value2));
				console.log(typeof(value3));
				/* var a = "${m}"; */
				
				window.open(url+value1+"&mypizzaName="+value2 +"&mypizzaImgChangeName="+value3,"",option);
			}
			 
		</script>
		
		
		
	</div>
	
	

</body>
</html>