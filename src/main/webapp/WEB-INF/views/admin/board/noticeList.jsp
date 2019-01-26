<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<th scope="col">글번호</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">3</th>
							<td>[공지]</td>
							<td>점주님들 새해 복 많이 받으세요</td>
							<td>2019-01-02</td>
							<td>117</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>[이벤트]</td>
							<td>2019년 1월 룰렛 이벤트 안내</td>
							<td>2019-01-02</td>
							<td>305</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>[공지]</td>
							<td>셀프 피자 제작소 공지사항입니다.</td>
							<td>2019-01-20</td>
							<td>15</td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-1"><button class="btn btn-outline-warning" onclick="location.href='admin.ad?admin=board/noticeWrite'">작성</button></div>
	<!-- 검색 영역 -->
	<div class="form-inline col-md-4">
		<form class="search-form">
			<select class="form-control" name="searchNotice" onChange="selectSearch(this.options[this.selectedIndex].value)">
				<option value="name">제목</option>
				<option value="userId">내용</option>
				<option value="category">분류</option>
			</select>
			<select name="searchCategory" style="display:none;" class="form-control"></select>
			<select name="searchCategory2" style="display:none;" class="form-control"></select>
			<input class="form-control mr-sm-2" type="text" name="searchNoticeValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchNotice();">
			<i class="fa fa-search"></i>
		</button>
	</div>
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
	<div class="col-md-1"></div>
	<script>
		function selectSearch(obj){
			var category=["업체공지","고객공지"];
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
			var category1 = [ "본사 공지", "본사 이벤트안내" ];
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
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=board/noticeDetail";
			});
		})
	</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
