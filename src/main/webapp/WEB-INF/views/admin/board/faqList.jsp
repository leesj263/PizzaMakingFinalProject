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
		<p>faqList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">FAQ</h3>
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="faqList">
					<thead>
						<tr>
							<!-- <th scope="col"> </th> -->
							<th scope="col">분류</th>
							<th scope="col" colspan="3">제목</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${faqList }" var="faq">
							<tr onclick="location.href='faqDetail.ad?num=${faq.boardNo}'">
							<!-- onclick="location.href='faqDetail.ad?num=${faq.boardNo}'" -->
								<%-- <th scope="row">${faq.rn }</th> --%>
								<c:choose>
									<c:when test="${faq.boardCate==1 }">
										<td>[결제]</td>
									</c:when>
									<c:when test="${faq.boardCate==2 }">
										<td>[주문]</td>
									</c:when>
									<c:when test="${faq.boardCate==3 }">
										<td>[공유 / 후기 / 질문답변]</td>
									</c:when>
									<c:otherwise>
										<td>[이벤트]</td>
									</c:otherwise>
								</c:choose>
								<td  colspan="3">${faq.boardTitle }</td>
							</tr>
						</c:forEach>
						<!-- <tr>
							<td>[결제]</td>
							<td>카카오페이 결제가 안돼요</td>
						</tr>
						<tr>
							<td>[이벤트]</td>
							<td>이벤트 쿠폰 적용이 안될때는 어떻게 하나요?</td>
						</tr>
						<tr>
							<td>[배달]</td>
							<td>배달완료라고 하는데 배달이 오지 않아요</td>
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
<!-- 	<div class="form-inline col-md-5">
		<form class="search-form">
			<select class="form-control" name="searchFaq" onChange="selectSearch(this.options[this.selectedIndex].value)">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="category">분류</option>
			</select> 
			<select name="searchCategory" style="display:none;" class="form-control"></select>
			<input class="form-control mr-sm-2" type="text" name="searchFaqValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchFaq();">
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
				$("input[name='searchFaqValue']").css("display","none");
			}else{
				$target.css("display","none");
				$("input[name='searchFaqValue']").css("display","");
			}
		}
		function searchFaq() {
			var searchFaq = $("select[name='searchFaq']").val();
			var searchFaqValue = $("input[name='searchFaqValue']").val();
			console.log(searchNotice + " / " + searchNoticeValue);
		}
		$(function(){
			$("#faqList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="faqDetail.ad?num="+num;
			});
		});
		/* 
		function clickblock(num) {
			//console.log($("<tr>"));
			for (i = 1; i < 10; i++) { //10이라는 수는 줄수보다 1 더한값을 적어주세요//
				var left_menu = eval("block" + i + ".style");
				if (num == i) {
					if (left_menu.display == "") {
						left_menu.display = "none";
					} else {
						left_menu.display = "";
						//$("#block1").show();
					}
				} else {
					left_menu.display = "none";
				}
			}
		}
*/
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>