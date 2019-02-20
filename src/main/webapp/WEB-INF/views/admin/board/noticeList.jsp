<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	.card-header{
		border:0;
	}
	#noticeList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>noticeList.jsp</p>
			<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">공지사항</h3>
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="noticeList">
					<thead>
						<tr>
							<th></th>
							<th scope="col">글번호</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList }" var="notice">
							<tr>
								<td><input type="hidden" name="boardNo" value="${notice.boardNo }"></td>
								<th scope="row">${notice.rn }</th>
								<c:choose>
									<c:when test="${notice.boardCate==1 }">
										<td>[안내]</td>
									</c:when>
									<c:when test="${notice.boardCate==2 }">
										<td>[공지]</td>
									</c:when>
									<c:when test="${notice.boardCate==3 }">
										<td>[경고]</td>
									</c:when>
									<c:otherwise>
										<td>[이벤트]</td>
									</c:otherwise>
								</c:choose>
								<td>${notice.boardTitle }</td>
								<td>${notice.boardDate }</td>
								<td>${notice.boardCount }</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-1"><button class="btn btn-outline-warning" onclick="location.href='noticeWriteView.ad'">작성</button></div>
	<!-- 검색 영역 -->
	<div class="form-inline col-md-4">
<!-- 		<form class="search-form">
			<select class="form-control" name="searchNotice" onChange="selectSearch(this.options[this.selectedIndex].value)">
				<option value="name">제목</option>
				<option value="userId">내용</option>
				<option value="category">분류</option>
			</select>
			<select name="searchCategory" style="display:none;" class="form-control" onChange="showCategory(this.options[this.selectedIndex].value)"></select>
			<select name="searchCategory2" style="display:none;" class="form-control"></select>
			<input class="form-control mr-sm-2" type="text" name="searchNoticeValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchNotice();">
			<i class="fa fa-search"></i>
		</button> -->
	</div>
	<!-- 페이징 영역 -->
	<div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
		<ul class="pagination">
			<c:if test="${pi.currentPage >1}">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${pi.currentPage-1}"/>
				</c:url>
				<li class="paginate_button page-item previous" id="bootstrap-data-table_previous">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
				</li>
			</c:if>
			<c:if test="${pi.currentPage==1 }">
				<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
				</li>
			</c:if>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<li class="paginate_button page-item active disabled">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
				</li>
			</c:if>
				
			<c:if test = "${ p ne pi.currentPage }">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${ p }"/>
				</c:url>
				<li class="paginate_button page-item">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
				</li>
			</c:if>
		</c:forEach>
			<c:if test="${pi.currentPage <pi.maxPage}">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${pi.currentPage+1}"/>
				</c:url>
				<li class="paginate_button page-item next" id="bootstrap-data-table_next">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
				</li>
			</c:if>
			<c:if test="${pi.currentPage>=pi.maxPage }">
				<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="col-md-1"></div>
	<script>
		function selectSearch(obj){
			var category=["분류", "업체공지", "고객공지"];
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
				$("input[name='searchNoticeValue']").css("display","none");
			}else{
				$target.css("display","none");
				$("input[name='searchNoticeValue']").css("display","");
			}
		}
		
		function showCategory(obj) {
			var category1 = [ "안내", "공지", "경고", "이벤트" ];
			var category2 = [ "공지", "이벤트" ];
			var $target = $("select[name='searchCategory2']");
			var data;

			if (obj == "업체공지") {
				data = category1;
			} else if (obj == "고객공지") {
				data = category2;
			}

			$target.empty();
			for (x in data) {
				var option = "<option>" + data[x] + "</option>";
				$target.append(option);
			}
			$target.css("display", "");
		}
		
		function searchNotice() {
			var searchNotice = $("select[name='searchNotice']").val();
			var searchNoticeValue = $("input[name='searchNoticeValue']").val();
			console.log(searchNotice + " / " + searchNoticeValue);
		}
		$(function(){
			$("#noticeList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().children().eq(0).val();
				console.log(num);
				location.href="noticeDetail.ad?num="+num;
			});
		})
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
