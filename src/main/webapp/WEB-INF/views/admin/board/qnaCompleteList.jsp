<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	table{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>qnaList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">Q&A</h3>
			</div>
			<div class="card-body">
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<button class="btn btn-sm btn-outline-warning" onclick="location.href='qnaWaitList.ad'">
					<i class="fa fa-lightbulb-o"></i>   미답변 질문 보기</button>
				<button class="btn btn-sm btn-secondary"disabled onclick="location.href='qnaCompleteList.ad'">답변완료 질문 보기</button>
			</div>
			<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="qnaList">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qnaCompleteList }" var="qna">
							<tr onclick="location.href='admin.ad?admin=board/qnaDetail'">
							<!-- onclick="location.href='qnaDetail.ad?num=${qna.boardNo}'" -->
								<th scope="row">${qna.rn }</th>
								<c:choose>
									<c:when test="${qna.boardCate==1 }">
										<td>[결제]</td>
									</c:when>
									<c:when test="${qna.boardCate==2 }">
										<td>[주문]</td>
									</c:when>
									<c:when test="${qna.boardCate==3 }">
										<td>[공유 or 후기]</td>
									</c:when>
									<c:otherwise>
										<td>[질문 & 답변]</td>
									</c:otherwise>
								</c:choose>
								<td>${qna.boardTitle }</td>
								<c:choose>
									<c:when test="${qna.boardAnswer=='Y' }">
										<th><button class="btn btn-sm btn-outline-secondary" disabled>답변완료</button></th>
									</c:when>
									<c:when test="${qna.boardAnswer=='N' }">
										<th><button class="btn btn-sm btn-outline-warning" onclick="location.href='qnaDetail.ad?num=${qna.boardNo}'">답변하기</button></th>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
						<!-- <tr>
							<td>[주문]</td>
							<td>주변 매장이 없는데 멀리 배달 안되나요</td>
							<td><button class="btn btn-sm btn-outline-warning" onclick="location.href="admin.ad?admin=board/qnaDetail";">답변하기</button></td>
						</tr>
						<tr>
							<td>[이벤트]</td>
							<td>베스트 토핑 됐는데 쿠폰 언제 주나요?</td>
							<td><button class="btn btn-sm btn-outline-warning" onclick="location.href="admin.ad?admin=board/qnaDetail";">답변하기</button></td>
						</tr>
						<tr>
							<td>[쿠폰]</td>
							<td>쿠폰 사용 후 주문을 취소했는데...</td>
							<td><button class="btn btn-sm btn-outline-secondary" disabled>답변완료</button></td>
						</tr> -->
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<div class="col-md-4"></div>
	<!-- <div class="col-md-1"><button class="btn btn-outline-warning">작성</button></div> -->
	<!-- 검색 영역 -->
	<!-- <div class="form-inline col-md-5">
		<form class="search-form">
			<select class="form-control" name="searchQna" onChange="selectSearch(this.options[this.selectedIndex].value)">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="category">분류</option>
			</select>
			<select name="searchCategory" style="display:none;" class="form-control"></select>
			<input class="form-control mr-sm-2" type="text" name="searchQnaValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchQna();">
			<i class="fa fa-search"></i>
		</button>
	</div> -->
	<!-- 페이징 영역 -->
	<div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
		<ul class="pagination">
			<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a></li>
			<li class="paginate_button page-item active"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
			<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
			<li class="paginate_button page-item next" id="bootstrap-data-table_next"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a></li>
		</ul>
	</div>
	<div class="col-md-4"></div>
	<script>
		function selectSearch(obj){
			var category=["주문","결제","이벤트","쿠폰"];
			var $target = $("select[name='searchCategory']");
			var data;
			console.log(obj);
			if (obj == "category") {
				data = category; 
				$target.empty();
				
				for (x in data) {
					var option = "<option>" + data[x] + "</option>";
					$target.append(option);
				}
				$target.css("display", "");
				$("input[name='searchQnaValue']").css("display","none");
			}else{
				$target.css("display","none");
				$("input[name='searchQnaValue']").css("display","");
			}
		}
		function searchQna() {
			var searchQna = $("select[name='searchQna']").val();
			var searchQnaValue = $("input[name='searchQnaValue']").val();
			console.log(searchNotice + " / " + searchQnaValue);
		}
		$(function(){
			$("#qnaList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=board/qnaDetail";
			});
		})
	</script>	
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>