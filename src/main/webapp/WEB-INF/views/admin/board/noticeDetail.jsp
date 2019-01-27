<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>

</style>
<section>
	<div class="right-panel">
	
		<p>noticeDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">공지사항</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span>제목</span>
								<p>
									2019년 1월 룰렛 이벤트 안내
									<input type="hidden" name="nno" value="3">
								</p></li>
							<li class="member-li"><span>분류</span>
								<p>
									[고객][이벤트]
								</p></li>
							<!-- <li class="member-li"><span>첨부파일</span><p><input type="file" class="form-control" id="nFile" name="nFile"></p></li> -->
						</ul>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-7" id="summernote">
						<table class="table"> 
							<tr>
								<td id="nContents">
									새로운 이벤트가 시작됩니다.
									룰렛을 열심히 돌려 쿠폰을 획득하세요
									룰렛 링크 :
								</td>
							</tr>
						</table>
					</div>
					<div class="col-md-3"></div>
				</div>
			<br>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<button class="btn btn-outline-secondary" onclick="location.href='admin.ad?admin=board/noticeList'">목록</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-outline-warning" type="submit" onclick="nModify();">수정</button>
					<button class="btn btn-outline-danger" type="submit" data-toggle="modal" data-target="#staticModal">삭제</button>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
	
	<div class="modal fade" id="staticModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>[     ] 공지사항을 정말 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-primary" onclick="nDelete()">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function showCategory(obj) {
			var category1 = [ "본사 공지", "본사 이벤트안내" ];
			var category2 = [ "공지", "이벤트" ];
			var $target = $("select[name='category']");
			var data;

			if (obj == "seller") {
				data = category1;
			} else if (obj == "customer") {
				data = category2;
			}

			$target.empty();
			for (x in data) {
				var option = "<option>" + data[x] + "</option>";
				$target.append(option);
			}
			$target.css("display", "");
		}

		function nModify() {
			var num=$("input[name='nno']").val();
			console.log(num);
		}
		function nDelete(){
			var num=$("input[name='nno']").val();
			console.log(num);
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
