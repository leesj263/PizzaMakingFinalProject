<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../common/header.jsp"/>
<style>
	.card-header{
		border:0px;
	}
	table{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<p>menuList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">토핑 목록</h3>
			</div>
			<div class="card-body">
			
			<!-- 업체 목록 영역 -->
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="menuList">
					<thead>
						<tr>
							<th scope="col">메뉴 번호</th>
							<th scope="col">이름</th>
							<th scope="col">도매가</th>
							<th scope="col">판매가</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${menuList }" var="menu">
							<tr>
								<td>${menu.bNo }</td>
								<td>${menu.bMenu} ${menu.bSize }</td>
								<td>${menu.bBuyPrice }</td>
								<td>${menu.bSellPrice }</td>
								<th>
									<button class="btn btn-sm btn-outline-warning" onclick="modMenu()">수정</button>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<!-- 페이징 영역 -->
	<div class="col-md-4"></div>
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
<!-- 	<div class="col-md-4">
		<button class="btn btn-outline-warning" onclick="location.href='admin.ad?admin=sales/menu/addTopping'">메뉴 추가</button>
	</div> -->
		<script>
		$(function(){
			$("#menuList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="menuDetail.ad?basicNo="+num;
			});
		});
		function modMenu(){
			var num=$("#menuList").find("td").parent().children().eq(0).text();
			console.log(num);
			location.href="menuModifyView.ad?basicNo="+num;
		}
		
	</script>
	</div>
</section>
<jsp:include page="../../common/footer.jsp"/>
