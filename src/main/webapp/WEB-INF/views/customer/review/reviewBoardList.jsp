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
<section class="bg-light" id="portfolio">

	<h2 style="margin:-10px -20px -10px 70px; padding-left:5%">게시판</h2>	

		<div class="container">
		 		<div style="margin:10px 10px 10px 1050px"><a class="btn btn-primary pull-right " href="boardWrite.jsp">글쓰기</a></div>
		 <div class="row" style="postion:static;">
		 	<table class="table table-striped"  border:1px; solid #dddddd">
		 		<thead>
						<th style="width: 3% background-color:#eeeeee; text-align: center;">번호</th>
						<th style="width: 20% background-color:#eeeeee; text-align: center;">제목</th>
						<th style="width: 5% background-color:#eeeeee; text-align: center;">작성자</th>
						<th style="width: 5% background-color:#eeeeee; text-align: center;">작성일</th>
						<th style="width: 3% background-color:#eeeeee; text-align: center;">조회수</th>
					</tr>		 		
		 		</thead>
		 		<tbody>
		 				<tr>
                            <td>13</td>
                            <td onclick="location.href='boardPosts.jsp'">바람서리 불변함은 우리 기상일세</td>
                            <td>아무말대잔치</td>
                            <td>18.11.29</td>
                            <td>8</td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>남산위에 저 소나무 철갑을 두른듯</td>
                            <td>아무말대잔치</td>
                            <td>18.11.29</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>대한으로 길이 보전하세</td>
                            <td>아무말대잔치</td>
                            <td>18.11.28</td>
                            <td>11</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>무궁화 삼천리 화려강산 대한사람</td>
                            <td>아무말대잔치</td>
                            <td>18.11.26</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>하느님이 보우하사 우리 나라 만세</td>
                            <td>아무말대잔치</td>
                            <td>18.11.25</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>동해물과 백두산이 마르고 닳도록</td>
                            <td>아무말대잔치</td>
                            <td>18.11.25</td>
                            <td>11</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>이제 부터 애국가 부를거임</td>
                            <td>아무말대잔치</td>
                            <td>18.11.24</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>너무했다 그 요일을 언급해선 안돼;;</td>
                            <td>너뒤에</td>
                            <td>18.11.19</td>
                            <td>34</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>밑에 나쁜쉐키</td>
                            <td>금요일밤</td>
                            <td>18.11.18</td>
                            <td>54</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>그다음에 월요일</td>
                            <td>으아아</td>
                            <td>18.11.16</td>
                            <td>45</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>와 금요일이다! 주말이다!</td>
                            <td>나에게맡겨요</td>
                            <td>18.11.14</td>
                            <td>34</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>야식으론 치킨이 더맛있음<br></td>
                            <td>yes1231</td>
                            <td>18.11.13</td>
                            <td>45</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>떡볶이,튀김,순대 맛있음</td>
                            <td>옆집드론</td>
                            <td>18.11.11</td>
                            <td>32</td>
                        </tr>
		 		</tbody>		 	
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
	        	    	
 <div class="input-group-prepend" id="searchText" style="margin:0px 0px 0px 240px">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</button>
    <input type ="text"  placeholder="검색어 입력">
    <button>검색</button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">제목</a>
      <a class="dropdown-item" href="#">작성자</a>
      <a class="dropdown-item" href="#">제목+내용</a>    
    </div>
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