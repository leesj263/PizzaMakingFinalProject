<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
<section class="bg-light" id="portfolio">
<br>
<br>
<br>
<br>
<br>
	<h2 style="margin:-10px -20px -10px 70px; padding-left:5%">Q&A</h2>	
	<br>

		<div class="container">
		 		
		 <div class="row" style="postion:static;">
		 	<table class="table table-striped"  id="qnaList">
		 		<thead>
						<th scope="col">글번호</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
					</tr>		 		
		 		</thead>
		 		<tbody align="center"> 				
			<c:forEach var="qna" items="${ qnaList }">
				<tr>
				<td><input type="hidden" name="boardNo" value="${qna.boardNo }"></td>
								<th scope="row">${qnaboard.bo }</th>
					<td>${ qna.bid }</td>
					<td>${ qna.bTitle }</td>
					<td>${ qna.userName }</td>
					<td>${ qna.bCount }</td>
					<td>${ qna.createDate }</td>
				</tr>
			</c:forEach>
		</tbody>>		 	
		 	</table>		 	
		 	<nav aria-label="page" style="margin:0px 0px 0px 400px">
 			 <ul class="pagination">
    			<li class="page-item">
    			  <a class="page-link" href="#" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>
      	</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
	      	  <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	        	    	
 <div class="input-group-prepend" id="searchText" style="margin:0px 0px 0px 220px">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</button>
    <input type ="text"  placeholder="검색어 입력">
    <button>검색</button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">제목</a>
      <a class="dropdown-item" href="#">작성자</a>
      <a class="dropdown-item" href="#">제목+내용</a>    
    </div>
    &nbsp;
   <div class="col-md-1"><button class="btn btn-outline-warning" onclick="location.href='writeQna.bo'">글 작성</button></div>
    
  </div>
  
</div>
	  </ul>
  
</nav>	
								
			 	
		 	</div>
		 	
		 </div>
		
	</div>
 </section>

</body>
</html>

</body>
</html>