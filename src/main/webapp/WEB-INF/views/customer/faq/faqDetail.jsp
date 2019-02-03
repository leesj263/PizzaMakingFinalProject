<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<title>Insert title here</title>
<!-- 테이블메뉴 스크립트 시작--> 
<script language="javascript">  
         
        function clickblock(num)  
        {  
                for (i=1;i<10;i++)  {      //5라는 수는 줄수보다 1 더한값을 적어주세요//
                 var left_menu=eval("block"+i+".style");                                                    
                 if (num==i) {  
                  if (left_menu.display=="block") { 
       left_menu.display="none";   
                  }else{  
                   left_menu.display="block";
                  }  
                 }else {
      left_menu.display="none";
     }  
                }  
        }  
  
</script> 
<!-- 테이블 메뉴 스크립트 끝-->
</head>
<body>
<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
<br>
<br>
<br>
<br>
<br>
<h1><b>FAQ</b></h1>
<br>


<div align="center">
 <div class="ui basic buttons" >
  <div class="ui button">결제 및 주문</div>
  <div class="ui button">회원가입</div>
  <div class="ui button">e-쿠폰</div>
   <div class="ui button">기타</div>
</div>
</div>
 
 
<br>
<br>
<table width="820" border="0" cellspacing="0" cellpadding="0" align="center">
             <tr>
              <td colspan="" height="1"  bgcolor="f4f4f4"></td>
             </tr>


             <tr align="center">
              <td width="30" height="23">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(1)">A/S신청은 어떻게 하나요?</td>
             </tr>


             <tr id="block1" style="display:none">
             <td width="30" height="23">A</td>
              <td  bgcolor="F7F7F7">
                   1) "주문불가" 인 경우 현재 매장이 불가피한 사정으로 인해 온라인주문이 불가능한 상황입니다. 가령 자재부족이나 전산장애, 임시휴무 등으로 당일 온라인주문을 받을 수 없는 경우입니다. 이런 경우 온라인주문은 불가능하고, 
                   매장이나 콜센터(1577-3082)로 전화하시면 매장상태를 다시 한번 확인한 후 방문포장의 경우 다른 매장으로 변경 가능합니다. 
                   (배달주문은 매장을 변경할 수 없습니다.) 2) "예약가능" 인 경우 배달사원부족, 주문폭주 등으로 부득이 하게 예약주문을 받는 것입니다. 
                   이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은 양해 부탁 드립니다.

              </td>
             </tr>


            <!--  <tr>
              <td colspan="2" height="1"  background="/itt/images/common/board_line.gif"></td>
             </tr>
 -->

             <tr align="center">
              <td width="30" height="23">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(2)">가입을 하지 않아도 되나요?</td>
             </tr>


             <tr id="block2" style="display:none">
              <td colspan="2" bgcolor="F7F7F7">
               내용내용내용

              </td>
             </tr>


            <!--  <tr>
              <td colspan="2" height="1"  background="/itt/images/common/board_line.gif"></td>
             </tr> -->


             <tr align="center">
              <td width="30" height="23">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(3)">제품에
               대한 문의를 하고 싶습니다</td>
             </tr>


             <tr id="block3" style="display:none">
              <td colspan="2" bgcolor="F7F7F7">
              내용내용내용

             </td>
             </tr>


             <!-- <tr>
              <td colspan="2" height="1"  background="/itt/images/common/board_line.gif"></td>
             </tr> -->


             <tr align="center">
              <td width="30" height="23" align="center">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(4)">브로셔는 들어있나요?</td>
             </tr>
             <tr id="block4" style="display:none">
              <td colspan="" bgcolor="F7F7F7">브로셔내용
              </td>
             </tr>
             
             <tr align="center">
              <td width="30" height="23" align="center">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(5)">브로셔는 들어있나요?</td>
             </tr>


             <tr id="block5" style="display:none">
              <td colspan="" bgcolor="F7F7F7">브로셔내용
              </td>
             </tr>
             <tr align="center">
              <td width="30" height="23" align="center">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(6)">브로셔는 들어있나요?</td>
             </tr>


             <tr id="block6" style="display:none">
              <td colspan="" bgcolor="F7F7F7">브로셔내용
              </td>
             </tr>
             <tr align="center">
              <td width="30" height="23" align="center">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(7)">브로셔는 들어있나요?</td>
             </tr>


             <tr id="block7" style="display:none">
              <td colspan="" bgcolor="F7F7F7">브로셔내용
              </td>
             </tr>
             <tr align="center">
              <td width="30" height="23" align="center">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(8)">브로셔는 들어있나요?</td>
             </tr>


             <tr id="block8" style="display:none">
              <td colspan="" bgcolor="F7F7F7">브로셔내용
              </td>
             </tr>
             <tr align="center">
              <td width="30" height="23" align="center">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(9)">브로셔는 들어있나요?</td>
             </tr>


             <tr id="block9" style="display:none">
              <td colspan="" bgcolor="F7F7F7">브로셔내용
              </td>
             </tr>


           <!--   <tr>
              <td colspan="2" height="1"  background="/itt/images/common/board_line.gif"></td>
             </tr> -->


             <tr>
              <td colspan="2" height="1" bgcolor="58AC6B"></td>
             </tr>
            </table>

</body>
</html>