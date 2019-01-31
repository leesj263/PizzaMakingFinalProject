<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 테이블메뉴 스크립트 시작--> 
<script language="javascript">  
         
        function clickblock(num)  
        {  
                for (i=1;i<5;i++)  {      //5라는 수는 줄수보다 1 더한값을 적어주세요//
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

<table width="620" border="0" cellspacing="0" cellpadding="0">
             <tr>
              <td colspan="2" height="1"  bgcolor="f4f4f4"></td>
             </tr>


             <tr align="center">
              <td width="30" height="23">Q</td>
              <td width="570" align="left" style="CURSOR: hand" onClick="clickblock(1)">A/S신청은 어떻게 하나요?</td>
             </tr>


             <tr id="block1" style="display:none">
              <td colspan="2" bgcolor="F7F7F7">
              내용내용내용

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
              <td colspan="2" bgcolor="F7F7F7">브로셔내용
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