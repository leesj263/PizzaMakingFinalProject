<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/pmfp/resources/main/assets/js/semantic/semantic.min.css">
<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>

<style>
	.popup{
		width: 98%;
		height: 98%;
		margin-left: 10px;
	}
	#map{
		height: 100%;
		width: 100%;
	}
	.comBox{
		width: 95%;
		height: 120px;
		margin-left: 10px;
		margin-bottom: 20px;
		background: rgba(0, 0, 0, 0.05);
		padding: 5px;
		border-radius: 5px;
	}
	.comBox:hover{
		background: rgba(0, 0, 0, 0.1);
		cursor: pointer;
	}
	.comBoxText{
		font-size: 14px;
		margin-top: 10px;
		margin-left: 10px;
	}
	.comBoxTextBold{
		font-weight: bold;
		margin-bottom: 10px;
		display: inline-block;
	}
	.comSelBtn{
		display: table-cell;
		height: 30px;
		right: 0;
		background: grey;
	}
	.comBoxTop{
		width: 100%;
	}
	.comInfo tbody tr td{
		vertical-align: top;
	}
	.comInfo tbody{
		height: 80%;
	}
	.comInfo tfoot tr td{
		text-align: center;
	}
</style>

</head>
<body>
	<table class="popup">
		<tr style="height: 60px;">
			<td colspan="2">
				<div class="ui input" style="width: 75%;">
					<input type="text" placeholder="검색" id="search" onkeypress="if(event.keyCode==13) {searchBtn();}">
				</div>
				
				<button class="ui blue button" style="width: 19%; margin-left: 5%;" onclick="searchBtn();">검색</button>
			</td>
		</tr>
		<tr>
			<td style="width: 60%;"><div id="map"></div></td>
			<td style="vertical-align: top;">
				<table class="comInfo" style="width: 100%; height: 100%;">
				<tbody>
					<tr><td>
					<c:forEach var="item" items="${ list }">
						<div class="comBox" onclick="mapMove(${ item.lat }, ${ item.lon });">
							<div class="ui grid">
								<div class="left floated ten wide column">
									<div class="ui icon circular inverted button compact mini green" style="margin-left: 10px;" onclick="comDetail(${ item.comNo }, '${ item.comName }', '${ item.comTel }', '${ item.comLocation }');"><i class="info icon"></i></div>
									<div class="comBoxText comBoxTextBold">${ item.comName }</div>
								</div>
								<div class="right floated five wide column">
									<div class="ui inverted button compact attached orange" onclick="selectCom(${ item.comNo }, '${ item.comName }', '${ item.comTel }', '${ item.comLocation }');">선택</div>
								</div>
							</div>
							<div class="comBoxText">${ item.comAddress }</div>
							<div class="comBoxText">${ item.comTel }</div>
						</div>
					</c:forEach>
					</td></tr>
				</tbody>
				<tfoot>
					<tr><td>
						<div class="ui pagination menu">
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="icon item"><i class="angle left icon"></i></a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="blistBack" value="comPop.cor">
									<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
									<c:param name="search" value="${ search }"/>
								</c:url>
								<a class="icon item" href="${ blistBack }"><i class="angle left icon"></i></a>
							</c:if>
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a class="active item">${ p }</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="blistCheck" value="comPop.cor">
										<c:param name="currentPage" value="${ p }"/>
										<c:param name="search" value="${ search }"/>
									</c:url>
									<a class="item" href="${ blistCheck }">${ p }</a>
								</c:if>
							</c:forEach>
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="icon item"><i class="angle right icon"></i></a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="blistEnd" value="comPop.cor">
									<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									<c:param name="search" value="${ search }"/>
								</c:url>
								<a class="icon item" href="${ blistEnd }"><i class="angle right icon"></i></a>
							</c:if>
						</div>
					</td></tr>
				</tfoot>
				</table>
			</td>
		</tr>
	</table>
	
	<div class="ui longer modal" id="comDetailModal">
		<div class="header">매장 정보</div>
		<div class="content">
			<table class="ui fixed table">
				<tbody>
					<tr>
						<td style="width: 20%;"><b>전화번호</b></td>
						<td></td>
					</tr>
					<tr>
						<td><b>주소</b></td>
						<td></td>
					</tr>
					<tr>
						<td><b>영업시간</b></td>
						<td></td>
					</tr>
					<tr>
						<td><b>위치정보</b></td>
						<td></td>
					</tr>
					<tr>
						<td><b>주차정보</b></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="actions">
			<div class="ui positive approve button" onclick="selectCom();" id="comDetailBtn">선택</div>
			<div class="ui negative cancel button">취소</div>
		</div>
	</div>
	
	<script>
		$(".item:not(.icon)").click(function(){
			$('.item').removeClass('active');
			$(this).addClass('active');
		});
		
		function initMap() {
	        var myLatLng = {lat: 37.526234, lng: 126.980357};
	
	        // Create a map object and specify the DOM element
	        // for display.
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          zoom: 10
	        });
	      }
		
		//검색하기
		function searchBtn(){
			var search = $("#search").val();
			
			location.href = "comPop.cor?search=" + search;
		}
		
		//지도 이동
		function mapMove(comLng, comLat){
			var myLatLng = {lat: comLat, lng: comLng};
			
	        // Create a map object and specify the DOM element
	        // for display.
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          zoom: 16
	        });
	
	        // Create a marker and set its position.
	        var marker = new google.maps.Marker({
	          map: map,
	          position: myLatLng
	        });
		}
		
		//업체 상세보기
		function comDetail(comNo, comName, comTel, comLocation){
			$.ajax({
				url: "comDetail.cor",
				data: {comNo: comNo},
				type: "POST",
				success: function(data){
					//console.log(data);
					$("#comDetailModal .header").text("매장 정보 - "+data.comName);
					
					$("#comDetailModal .content table tbody tr").eq(0).children().eq(1).text(data.comTel);
					$("#comDetailModal .content table tbody tr").eq(1).children().eq(1).text(data.comAddress);
					$("#comDetailModal .content table tbody tr").eq(2).children().eq(1).text(data.comSalestime);
					$("#comDetailModal .content table tbody tr").eq(3).children().eq(1).text(data.comLocation);
					$("#comDetailModal .content table tbody tr").eq(4).children().eq(1).text(data.comParking);
					
					$("#comDetailBtn").attr("onclick", "selectCom("+comNo+",'"+comName+"','"+comTel+"','"+comLocation+"');");
					$("#comDetailModal").modal("show");
				}, error: function(data){
					console.log("매장 정보 가져오기 실패!");
				}
			});
		}
		
		//업체 선택
		function selectCom(comNo, comName, comTel, comLocation){
			window.close();
			opener.selectCom(comNo, comName, comTel, comLocation);
		}
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0zIneBDDLfBSu5Xa2KyeC-ff-r7wcLKA&callback=initMap"
        async defer></script>
</body>
</html>