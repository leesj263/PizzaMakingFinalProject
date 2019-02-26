<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
<style>
	#reviewList{
		text-align:center;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/menubar.jsp"%>
	<section class="bg-light" id="portfolio"> <br>
	<br>
	<br>
	<br>
	<br>
	<h2 style="margin: -10px -20px -10px 70px; padding-left: 5%">피자제작소 후기</h2>
	<br>

	<div class="container">

		<div class="row" style="postion: static;">
			<table class="table table-striped" id="reviewList" >
				
				<thead>
					<th scope="col" width="8%">글번호</th>
					<th scope="col" width="30%">제목</th>
					<th scope="col" width="8%">작성자</th>
					<th scope="col" width="8%">작성일</th>
					<th scope="col" width="8%">조회수</th>
					
				</thead>
				<tbody >
					<c:forEach var="review" items="${ reviewList }">
						<tr>
							<td><input type="hidden" name="boardNo" id="boardNo"
								value="${review.boardNo }">${review.rownum }</td>
							<td>${review.boardTitle }</td>
							<td>${review.memberNickname}</td>
							<td>${review.boardDate }</td>
							<td>${review.boardCount }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			
			<div class="col-md-5"></div>
			<!-- 페이징-->
			<div class="dataTables_paginate paging_simple_numbers col-md-4" 
				id="bootstrap-data-table_paginate">
				<ul class="pagination">
					<c:if test="${pi.currentPage >1}">
						<c:url var="btnList" value="${ addr }">
							<c:param name="currentPage" value="${pi.currentPage-1}" />
						</c:url>
						<li class="paginate_button page-item previous"
							id="bootstrap-data-table_previous"><a href="${btnList }"
							aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0"
							class="page-link"><i class="ti-angle-left"></i></a></li>
					</c:if>
					<c:if test="${pi.currentPage==1 }">
						<li class="paginate_button page-item previous disabled"
							id="bootstrap-data-table_previous"><a href="#"
							aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0"
							class="page-link"><i class="ti-angle-left"></i></a></li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<li class="paginate_button page-item active disabled"><a
								href="#" aria-controls="bootstrap-data-table"
								data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a></li>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="btnList" value="${ addr }">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<li class="paginate_button page-item"><a href="${btnList }"
								aria-controls="bootstrap-data-table" data-dt-idx="${p }"
								tabindex="0" class="page-link">${p }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pi.currentPage <pi.maxPage}">
						<c:url var="btnList" value="${ addr }">
							<c:param name="currentPage" value="${pi.currentPage+1}" />
						</c:url>
						<li class="paginate_button page-item next"
							id="bootstrap-data-table_next"><a href="${btnList }"
							aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0"
							class="page-link"><i class="ti-angle-right"></i></a></li>
					</c:if>
					<c:if test="${pi.currentPage>=pi.maxPage }">
						<li class="paginate_button page-item next disabled"
							id="bootstrap-data-table_next"><a href="#"
							aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0"
							class="page-link"><i class="ti-angle-right"></i></a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-md-2"></div>
			<button class="btn btn-outline-warning" 
						><a href="./reviewWrite.t">작성하기</a></button>
			<div class="col-md-4"></div>


			<!-- 검색영역 -->
			<!-- <div class="input-group-prepend" id="searchText"
				style="margin: 0px 0px 0px 100px">

				<select class="form-control" name="searchNotice">
					<option value="memberNickName">작성자</option>
					<option value="boardTitle">제목</option>
				</select>
				 <input type="text" placeholder="검색어 입력">
				<button class="search-trigger" onclick="searchNotice();">
					<i class="fa fa-search"></i>
				</button>

				<div class="col-md-2">
					
				</div>

			</div> -->
			
		</div>

	
	</section>
<script>
$(function(){
	$("#reviewList tr").click(function(){
		var num=$(this).find("#boardNo").val();
		console.log(num);
		location.href="./reviewDetail.bo?num="+num;
	});
});


</script>
</body>
</html>