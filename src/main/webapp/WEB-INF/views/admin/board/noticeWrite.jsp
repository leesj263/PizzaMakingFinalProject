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
				<form id="noticeWrite" action="noticeWrite.ad" method="post">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<ul class="member-ul">
								<li class="member-li"><p>&nbsp;</p></li>
								<li class="member-li"><span>제목</span>
									<p>
										<input type="text" name="boardTitle" id="boardTitle" class="form-control" placeholder="제목을 입력하세요">
									</p></li>
								<li class="member-li"><span>분류</span>
									<p>
										<select name="boardType" onChange="showCategory(this.options[this.selectedIndex].value);">
											<option selected>분류</option>
											<option value="4">업체공지</option>
											<option value="5">고객공지</option>
										</select> <select name="boardCate" style="display: none;">
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
							<textarea rows="15" cols="60" style="resize: none;" class="form-control" placeholder="내용을 입력하세요" id="boardContent" name="boardContent"></textarea>
						</div>
						<div class="col-md-3"></div>
					</div>
				
				<br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-5"></div>
					<div class="col-md-3">
						<button class="btn btn-outline-secondary" type="button" data-toggle="modal"
							data-target="#staticModal">목록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-outline-warning" type="submit" onclick="nWrite();">등록</button>
						</form>
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
					<button type="button" class="btn btn-outline-primary" onclick="location.href='noticeList.ad'">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function showCategory(obj) {
			var category1 = [ "안내", "공지", "경고", "이벤트" ];
			var cateVal=[1, 2, 3, 4];
			var category2 = [ "공지사항", "이벤트" ];
			var $target = $("select[name='boardCate']");
			var data;
	
			if (obj == 4) {
				data = category1;
			} else if (obj == 5) {
				data = category2;
			}
	
			$target.empty();
			for (x in data) {
				for(y in cateVal){
					if(x==y){
					var option = "<option value='"+cateVal[y]+"'>" + data[x] + "</option>";
					$target.append(option);
					}
				}
			}
			$target.css("display", "");
		}
		function nWrite(){
			var boardTitle=$("#boardTitle").val();
			var boardContent=$("#boardContent").val();
			var boardType=$("select[name='boardType']").val();
			var boardCate=$("select[name='boardCate']").val();
			//var nFile=$("#nFile").val();
			console.log(boardTitle+boardContent+boardType+boardCate);
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>