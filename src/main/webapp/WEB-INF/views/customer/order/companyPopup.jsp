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
	table{
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
		background: rgba(0, 0, 0, 0.05);
		padding: 5px;
		border-radius: 5px;
	}
	.comBoxText{
		font-size: 14px;
		margin-top: 10px;
	}
	.comBoxTextBold{
		font-weight: bold;
		margin-bottom: 10px;
		padding-top: 10px;
		display: table-cell;
	}
	.comSelBtn{
		display: table-cell;
		height: 30px;
		right: 0;
		background: grey;
	}
</style>

</head>
<body>
	<table>
		<tr style="height: 60px;">
			<td colspan="2">
				<div class="ui input" style="width: 75%;">
					<input type="text" placeholder="검색...">
				</div>
				
				<button class="ui blue button" style="width: 19%; margin-left: 5%;">검색</button>
			</td>
		</tr>
		<tr>
			<td style="width: 60%;"><div id="map"></div></td>
			<td style="vertical-align: top;">
				<div class="comBox">
					<div class="comBoxText comBoxTextBold">천호</div>
					<div class="comSelBtn">선택</div>
					<div class="comBoxText">서울특별시 강동구 천호대로157길 34</div>
					<div class="comBoxText">02-4425-1659</div>
				</div>
			</td>
		</tr>
	</table>
	
	
	<script>
		function initMap() {
	        var myLatLng = {lat: 37.476234, lng: 126.980357};
	
	        // Create a map object and specify the DOM element
	        // for display.
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          zoom: 16
	        });
	
	        // Create a marker and set its position.
	        var marker = new google.maps.Marker({
	          map: map,
	          position: myLatLng,
	          title: 'Hello World!'
	        });
	      }
		$(function(){
			initMap();
		});
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0zIneBDDLfBSu5Xa2KyeC-ff-r7wcLKA&callback=initMap"
        async defer></script>
</body>
</html>