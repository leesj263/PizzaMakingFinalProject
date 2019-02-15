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
	
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>

	<div class="ui small vertical menu" style="float: left; width:20%; margin-top: 70px; width:150px;">
		<a class="item" href="mypage.mp">
		    주문내역
		  </a>
		  <a class="item" href="myPageMyMenu.t">
		    나만의 메뉴
		  </a>
		  <a class="item active" href="myPageDelAddr.mp">
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
	
	
	
	
	<div style="float: left; width:80%; padding:20px; margin-top: 50px;" align="center">
		
		<table class="ui celled table">
		  <thead>
		    <tr>
			    <th><input type="checkbox" id="chkTop"></th>
			    <th>배달지 이름</th>
			    <th>주소</th>
			    <th>배달매장</th>
		 	</tr></thead>
		  <tbody>
		    <c:forEach items="${ delList }" var="d">
		    	<tr class="t">
		    		<td><input type="checkbox" name="chk" class="b"></td>
		    		<td>${ d.delName }</td>
		    		<td>${ d.delAddr }</td>
		    		<td>${ d.comName }점</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>
		
		<button class="ui yellow button" id="pop">추가</button>
		<!-- <button class="ui yellow button">수정</button>
		<button class="ui yellow button">삭제</button> -->
		<button class="ui yellow basic button">수정</button>
		<button class="ui yellow basic button">삭제</button>

	</div>
	
	<script>
		//배송지 추가 팝업 설정
		var screenW = screen.availWidth; // 스크린 가로사이즈
		var screenH = screen.availHeight; // 스크린 세로사이즈
		
		var popW = 550;  //팝업 가로사이즈
		var popH = 240;  //팝업 세로사이즈
		
		var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
		var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
	
		$("#pop").click(function(){
			 window.open('myPageDelPopup.mp','',',width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
		
		});
		
		
		
		
		
		
		
		
		
		
		
		
		//체크박스 전체선택  & 전체해제
		if($("#chkTop").click(function(){
			if($("#chkTop").prop("checked")){
				$("input[name=chk]").prop("checked", true);
			}else{
				$("input[name=chk]").prop("checked", false);
			}
			
			//$("input[name=chk]").trigger("change");
		}));

		//전체 체크박스 개수(헤더 제외)
		var chkCountAll = $("input[name=chk]").length;
		
		//사용자가 체크한 체크박스 개수(헤더 제외)
		var chkCount=0;
		var chkFlag = false;
		
		
		
		$("input[name=chk]").change(function(){
			
			
			
			/* if($("input[name=chk]:checked") && chkFlag == false){
				chkCount += 1;
				chkFlag = true;
			}else if(($("input[name=chk]").prop("checked") == false) && chkFlag == true){
				chkCount -= 1;
				chkFlag = false;
			} */
			
			var i=0;
			//if($("tr:eq(i+1) td:first input:checkbox:checked")){
			//for(var i=0;i<chkCountAll;i++){
				//if($("tr>td:eq(i) input:checkbox:checked")){
				if($(".t:eq(i) td input:checkbox:checked")){
					chkCount += 1;
					i++;
				}else{
					chkCount -= 1;
				}
				
			//} 
			
			
			
			console.log("전체 행 수 : " + chkCountAll);
			console.log("클릭 카운트 : " + chkCount);
			
			if(chkCountAll == chkCount){
				$("#chkTop").prop("checked", true);
			}else if(chkCountAll != chkCount){
				$("#chkTop").prop("checked", false);
			}
			
		});	
			
	</script>
	

	
	

</body>
</html>