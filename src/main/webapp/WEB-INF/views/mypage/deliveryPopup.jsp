<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#all{
		padding:5px;
		width: 550px;
	}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 시멘틱 UI -->
<link rel="stylesheet" type="text/css" href="/pmfp/resources/main/assets/js/semantic/semantic.min.css">

<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>

</head>

<body>

<div id="all">

<div class="ui mini input">
  <input type="text" id="postcode" placeholder="우편번호">
</div>

<button class="mini ui black basic button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button><br>

<div class="ui mini input">
  <input type="text" id="roadAddress" placeholder="도로명주소" style="width: 250px;">
</div>

<div class="ui mini input">
  <input type="text" id="jibunAddress" placeholder="지번주소" style="width: 250px;">
</div>

<span id="guide" style="color:#999;display:none"></span>

<div class="ui mini input">
  <input type="text" id="extraAddress" placeholder="참고항목" style="width: 250px;">
</div>

<br><br><div class="ui mini input">
<input type="text" id="detailAddress" style="width: 230px;" placeholder="상세주소">
</div>

<br><div class="ui mini input">
<input type="text" id="deliveryName" style="width: 230px;" placeholder="배달지 이름">
</div>

<br><br>
<button class="fluid ui button" onclick="addAddr()">등록하기</button>


<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	var flag = false;
	var latlonVal;

	//다음 도로명주소 api
    function sample4_execDaumPostcode() {
    	 daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
				
                console.log("roadAddr : " + roadAddr);
                
                //사용자가 입력한 주소의 위도/경도 구하기
               latlonVal = latlon(roadAddr);
               console.log("latlonVal : " + latlonVal);
            }
        }).open();   
    })
    };
    
    
  
    //구글 지오코딩 api : 사용자가 입력한 주소 위/경도로 변환
    function latlon(value) {
        var geocode = "https://maps.googleapis.com/maps/api/geocode/json?address="+value+"&key=키값입력하기~~~~~";
        var tag = "";
        jQuery.ajax({
            url: geocode,
            type: 'POST',
            async:false,
           	success: function(myJSONResult){
	            if(myJSONResult.status == 'OK') {
	                var i;
	                
	                /* for (i = 0; i < myJSONResult.results.length; i++) {
	                  tag += myJSONResult.results[i].geometry.location.lat+",";
	                  tag += myJSONResult.results[i].geometry.location.lng+"";
	                  
	                  flag="true";
	                } */
	                tag += myJSONResult.results[0].geometry.location.lat+",";
	                tag += myJSONResult.results[0].geometry.location.lng;
	                  
	                flag="true";
	                
	            }else{
	            	console.log(myJSONResult);
	            }
	        }
        }); 
        console.log("ㅡㅡ tag: " + tag)
        return tag;
        
    }
    
    
    //배송지 등록하기 버튼
    function addAddr(){
    	var roadAddress = $("#roadAddress").val();
    	var detailAddress = $("#detailAddress").val();
    	var deliName = $("#deliveryName").val();
    	
    	if(flag == false){
    		alert("주소를 등록하세요");
    	}else if(!detailAddress){
    		alert("상세 주소를 입력하세요");
    	}else if(!deliName){
    		alert("배달지 이름을 입력하세요");
    	}else{
	    	jQuery.ajax({
	    		url:"comLatLon.mp",
	    		data:{latlonVal:latlonVal},
	    		type:'POST',
	    		async:false,
	    		success:function(data){
	    			if(data == "실패"){
	    				alert("배달 가능 매장이 없습니다");
	    			}else{
		    			var addr = roadAddress + "+" + detailAddress
	
		    			window.close();
	
		    			opener.location.href="deliveryAdd.mp?finalDeliveryLoc=" + data + "&addr=" + addr + "&deliName=" + deliName;
	    			}
	    		},
	    		error:function(data){
	    			console.log("통신 실패");
	    			console.log(data);
	    		}
	    	});
    	}
    }
    
    
</script>
</div>
</body>
</html>














