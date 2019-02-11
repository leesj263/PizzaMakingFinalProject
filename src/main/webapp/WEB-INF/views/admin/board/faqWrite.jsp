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

		<p>faqWrite.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">FAQ 작성</h3>
			</div>
			<div class="card-body">
				<form id="faqWrite" action="faqWrite.ad" method="post">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<ul class="member-ul">
								<li class="member-li"><p>&nbsp;</p></li>
								<li class="member-li"><span>제목</span>
									<p>
										<input type="text" name="boardTitle" id="boardTitle" class="form-control" placeholder="제목을 입력하세요">
									</p></li>
								<li class="member-li"><span><input type="hidden" name="boardType" value="2">분류</span>
									<p>
										<select name="boardCate">
											<option value="1" selected>결제</option>
											<option value="2">주문</option>
											<option value="3">공유/후기/질문답변</option>
											<option value="4">이벤트</option>
										</select>
									</p>
								</li>
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
						<button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#staticModal">목록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-outline-warning" type="submit" onclick="fWrite();">등록</button>
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
					<p>FAQ를 작성 중입니다. 이동하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-warning" onclick="location.href='faqList.ad'">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function fWrite(){
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