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

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item" href="mypage.mp">
		    주문내역
		  </a>
		  <a class="item active" href="myPageMyMenu.t">
		    나만의 메뉴
		  </a>
		  <a class="item" href="myPageDelAddr.mp">
		    배송지 관리
		  </a>
		  <a class="item" href="myPageCoupon.mp">
		    쿠폰함
		  </a>
		  <a class="item" href="myPageShare.mp">
		    내 작성글
		  </a>
		  <a class="item" href="myPageMemModify.t">
		   회원정보 수정
		  </a>
		  <a class="item" href="myPageMemLeave.t">
		    회원탈퇴
		 </a>
 
	</div>
	
	
	
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;">
		<table align="center">
			<tr>
				<td>
					<div class="ui card" style="width: 250px;">
					  <div class="content">
					    <div class="right floated ">35,000원</div>
					    	<input type="checkbox"> 맛있는조합
					  </div>
					  <div class="image">
					    <img src="/pmfp/main/webapp/resources/main/images/222.jpg" style="height: 150px;">
					  </div>
					  <div class="content">
					    <span class="right floated">
					      	<button class="ui icon button">-</button>
					      	&nbsp;<label>1</label>&nbsp;
					      	<button class="ui icon button">+</button>
					    </span>
					   <button class="ui secondary basic button">상세보기</button>
					  </div>
					</div>
				</td>
				
				<td>
					<div class="ui card" style="width: 250px;">
					  <div class="content">
					    <div class="right floated ">35,000원</div>
					    	<input type="checkbox"> 맛있는조합
					  </div>
					  <div class="image">
					    <img src="/pmfp/main/webapp/resources/main/images/222.jpg" style="height: 150px;">
					  </div>
					  <div class="content">
					    <span class="right floated">
					      	<button class="ui icon button">-</button>
					      	&nbsp;<label>1</label>&nbsp;
					      	<button class="ui icon button">+</button>
					    </span>
					   <button class="ui secondary basic button">상세보기</button>
					  </div>
					</div>
				</td>
				<td>
					<div class="ui card" style="width: 250px;">
					  <div class="content">
					    <div class="right floated ">35,000원</div>
					    	<input type="checkbox"> 맛있는조합
					  </div>
					  <div class="image">
					    <img src="/pmfp/main/webapp/resources/main/images/222.jpg" style="height: 150px;">
					  </div>
					  <div class="content">
					    <span class="right floated">
					      	<button class="ui icon button">-</button>
					      	&nbsp;<label>1</label>&nbsp;
					      	<button class="ui icon button">+</button>
					    </span>
					   <button class="ui secondary basic button">상세보기</button>
					  </div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="3" align="center"><br><button class="ui yellow button">주문하기</button></td>
			</tr>
		
		</table>
		
		
		
		<button id="pop">상세보기 팝업</button>
		
		<script>
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