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

	<%@ include file="/WEB-INF/views/main/mypageMenubar.jsp"%>
	
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
		    	<tr>
		    		
		    		<td>
		    			<input type="hidden" value="${ d.delNo }" name="delNo">
		    			<input type="checkbox" name="chk">
		    		</td>
		    		<td>${ d.delName }</td>
		    		<td>${ d.delAddr }</td>
		    		<td>${ d.comName }점</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>
		
		<button class="ui yellow button" id="pop">추가</button>
		<!-- <button class="ui yellow basic button">수정</button> -->
		<button class="ui yellow basic button" onclick="deleteOne()">삭제</button>
	</div>
	
	<script>
		$(function(){
			$("#list3").attr("class", "item active");
		});
	
	
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
		}));

		//전체 체크박스 개수(헤더 제외)
		var chkCountAll = $("input[name=chk]").length;
		
		//사용자가 체크한 체크박스 개수(헤더 제외)
		var chkCount;  
	

		$("input[name=chk]").click(function(){
			chkCount = $('input[name=chk]:checked').length;
			
			console.log("전체 개수 : " + chkCountAll);
			console.log("체크한거 개수 : " + chkCount);
			
			
			if(chkCountAll == chkCount){
				$("#chkTop").prop("checked", true);
			}else if(chkCountAll != chkCount){
				$("#chkTop").prop("checked", false);
			}
			
		});	
		
		function deleteOne(){
			//var delNoList = $("input[name=chk]:checked").parent().children().eq(0).val();
			var delNoList = $("input[name=chk]:checked").parents()
			
			console.log(delNoList);
			
		}
			
	</script>
	

	
	

</body>
</html>