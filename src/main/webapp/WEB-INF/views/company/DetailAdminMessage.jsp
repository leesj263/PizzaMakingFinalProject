<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sufee Admin - HTML5 Admin Template</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	#backBtn{
		position : relative;
		left : 800px
	}

    
</style>
</head>
<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>
	
	 <div id="right-panel" class="right-panel">

        <jsp:include page="companyHeader.jsp"></jsp:include>
        
       
        <div class="col-md-4" style = "margin : 50px">
            <div class="card">
		            <table style = "background : white; width : 1000px;">
		           	<tr>
			           <td colspan = "6" style = "font-size : 1.4em; padding-top : 10px; background: lightgray;"><div class="card-header">
		                    <strong class="card-title">룰렛이벤트 안내</strong></div></td>
		                
		           	</tr>
		           	<tr style = "height : 50px">
		           		<td width = "7%" align = "right"><b>분류</b>&nbsp;&nbsp;&nbsp;</td>
		           		<td width = "10%">공지</td>
		           		<td width = "7%" align = "right"><b>게시일</b>&nbsp;&nbsp;&nbsp;</td>
		           		<td width = "15%">2019.01.25</td>
		           		<td width = "7%" align = "right"><b>작성자</b>&nbsp;&nbsp;&nbsp;</td>
		           		<td>관리자</td>
		           	</tr>
		           	<tr style = "vertical-align : top">
		           		<td colspan = "6"></td>
		           	</tr>
		           	<tr style = "width : 90%;height : 500px; vertical-align : top;">
		           		<td colspan = "6"><div class="card-body"><p class="card-text">1월부터 룰렛이벤트를 실시합니다. 이벤트 기간은 2월 1일부터 2월 15일까지입니다. 각 지점 점주분들께서는 이점 유의해주시기 바랍니다,
		           		23일 세계경제포럼(WEF) 2019 연차총회(다보스포럼) 개최 이틀째를 맞아 포럼 주 행사장인 콩그레스홀에서 특별연설을 한 아베 신조 일본 총리가 일본의 부상을 전 세계에 알렸다. 
		           		"패배주의가 패배했다"는 말은 더 이상 일본이 스스로 패배주의에 굴복하지 않겠다는 자신감을 드러낸 것이라는 평가다. 다보스포럼 현장에 모인 파워 엘리트들을 향한 아베 총리의 자신감이다.
						아베 총리는 특별연설 후 국가 IR 성격을 띤 `일본의 밤(재팬 나이트)` 행사를 통해 국가 세일즈에 나섰다.
						이 행사에는 글로벌 리더 1000여 명이 참석해 대성황을 이뤘다. 아베 총리는 포럼 현장에서 비즈니스 리더들과도 면담과 오찬 행사를 개최하는 등
						 적극적인 행보를 펼쳤는데 도널드 트럼프 미국 대통령이 불참해 스포트라이트가 아베 총리에게 집중되는 모습이었다. 아베 총리뿐만 아니다.
						  시진핑 중국 국가주석을 대신해 포럼에 참석한 왕치산 중국 국가부주석도 최근 불안감이 커지고 있는 중국 경제 하강 우려를 불식하고 중국 경제 낙관론을 설파하는 
						  플랫폼으로 특별연설을 활용하는 등 주요국 정상과 고위 인사들이 포럼 현장에서 국가 세일즈에 박차를 가했다. </p></div></td>
		           	</tr>
		           </table>
                
               
            </div>
            <button id = "backBtn" type="button" class="btn btn-primary" onclick = "location.href = 'movePage.com?movePage=companyMain'"><i class="fa fa-mail-forward"></i>&nbsp; 사용자 메뉴로 이동</button>
        </div>
        
        
     </div>
	
</body>
</html>