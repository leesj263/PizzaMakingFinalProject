<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
<br>
<br>
<br>
<br>
	
		<div class="container">

			<form width="200" align="center">
			      <caption> <h2>바람서리 불변함은 우리 기상일세</h2> </caption>
        </thead>
        <hr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="5" width="407"></td></tr>
	 <table>
    <tr>
      <td rowspan="2"><!-- <img class="mx-auto rounded-circle"
                     src="/dsm/img/team/1.jpg" alt=""
                     style="width: 90px; height: 90px;"></td>
      <td align="center" width="76"  > --><b>옆집피자</b></td>     
      <td width="50"></td>  

      <td align="center" width="76">조회수 : </td>      
      <td width="50"><b>8</b></td>	
      
      <td align="center" width="76">작성일 : </td>      
      <td width="150"><b>18.11.29 10:35</b></td>
     </tr>
     </table>
     <hr>
            			 
			   <textarea class="form-control" readonly rows="35" cols="95"  id="comment" placeholder="내용을 입력해 주세요">
말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어
끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다 이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다
			   </textarea>	
			                     
               </p>
            
   	<hr>
     <div class="form-group">
			  
			<form action="" method="post" name="">
			<font size="4" color="red">댓글 2</font>
      
			<div style="margin:0px 0px 0px 800px; margin-right:10px; ">	
			  <a href="board.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">목록으로</a>
			  <a href="boardUpdate.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">수정</a>
			  <a href="board.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">삭제</a>
			 </div> 
				<hr>
			</form>
			</div>	
			</table>
			<br><br>
			<!-- 댓글 란 -->
			  <table style="width: 300px;">			       
               <tr>
                  <td rowspan="2"><img class="mx-auto rounded-circle"
                     src="/dsm/img/team/1.jpg" alt=""
                     style="width: 90px; height: 90px;"></td>
                  <td width="80%" style="border-bottom: 1px solid #EAEAEA;"><span>18.11.29
                        17:02</span> 
                  </span></td>
               </tr>
               <tr>
                  <td>
                     <div>
                        <b>yes1231</b>
                     </div>
                     <div>긴 글 잘읽었습니다. 퍼가요
                     </div>
                  </td>
               </tr>
            </table> 
            	<hr>  
            	  <table style="width: 300px;">			       
               <tr>
                  <td rowspan="2"><!-- <img class="mx-auto rounded-circle"
                     src="/dsm/img/team/1.jpg" alt=""
                     style="width: 90px; height: 90px;"> --></td>
                  <td width="80%" style="border-bottom: 1px solid #EAEAEA;"><span>18.12.1
                        11:42</span> 
                  </span></td>
               </tr>
               <tr>
                  <td>
                     <div>
                        <b>아는사람</b>
                     </div>
                     <div>좋은글이네요 퍼갑니다
                     </div>
                  </td>
               </tr>               
            </table>                      
			<hr>
			<div class="input-group mb-3">
			  <input type="text" class="form-control" placeholder="댓글을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button" id="button-addon2">댓글 등록</button>
			  </div>
			</div>			
			<br>
			<br>
		
		
		</table>
	</table>
		</form>
		</div>
		<br>
		<br><br>
		<br>
		<hr>
		<br>
		<br>
	
	
</body>
</html>

