<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	.member-ul .member-li{
		padding:0px;
	}
	.member-li > p{
		width:500px;
	}
	/* .form-control > textarea{
		width:85%;
	} */
</style>
<section>
	<div class="right-panel">

		<p>noticeWrite.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">공지사항 작성</h3>
			</div>
			<div class="card-body">
				<form id="noticeWrite" action="uploadNotice" method="post">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<ul class="member-ul">
								<li class="member-li"><p>&nbsp;</p></li>
								<li class="member-li"><span>제목</span>
									<p>
										<input type="text" name="nTitle" id="nTitle" class="form-control" placeholder="제목을 입력하세요">
									</p></li>
								<li class="member-li"><span>분류</span>
									<p>
										<select name="noticeType" onChange="showCategory(this.options[this.selectedIndex].value);">
											<option selected>분류</option>
											<option value="seller">업체공지</option>
											<option value="customer">고객공지</option>
										</select> <select name="category" style="display: none;">
										</select>
										<!-- 
									<select name="category2" style="display:none;">
										<option value="notice2">공지</option>
										<option value="event2">이벤트</option>
									</select> -->
									</p></li>
								<!-- <li class="member-li"><span>첨부파일</span><p><input type="file" class="form-control" id="nFile" name="nFile"></p></li> -->
							</ul>
						</div>
						<div class="col-md-2"></div>
					</div>
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-7" id="summernote">
							<textarea rows="15" cols="60" style="resize: none;" class="form-control" placeholder="내용을 입력하세요" id="nContents" name="nContents"></textarea>
						</div>
						<div class="col-md-3"></div>
					</div>
				</form>
				<br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-5"></div>
					<div class="col-md-3">
						<button class="btn btn-outline-secondary" data-toggle="modal"
							data-target="#staticModal">목록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-outline-warning" type="submit" onclick="nWrite();">등록</button>
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
					<p>공지사항을 작성중입니다. 이동하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-primary" onclick="location.href='admin.ad?admin=board/noticeList'">Confirm</button>
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
		
		function nWrite(){
			var nTitle=$("#nTitle").val();
			var nContents=$("#nContents").val();
			var nCategory1=$("select[name='noticeType']").val();
			var nCategory2=$("select[name='category']").val();
			//var nFile=$("#nFile").val();
			console.log(nTitle+nCategory1+nCategory2+nContents);
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>