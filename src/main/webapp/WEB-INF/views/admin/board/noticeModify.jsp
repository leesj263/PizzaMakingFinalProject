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
</style>
<section>
	<div class="right-panel">
	
		<p>noticeModify.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">공지사항 수정</h3>
			</div>
			<div class="card-body">
			<form>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span>분류</span>
								<p>
									<select name="noticeType" onChange="showCategory(this.options[this.selectedIndex].value);">
										<option selected>분류</option>
										<option value="seller">업체공지</option>
										<option value="customer">고객공지</option>
									</select> 
									<select name="category" style="display:;">- 
										<option value="notice">공지사항</option>
										<option value="event">이벤트</option>
									</select>
								</p>
							</li>
							<li class="member-li">
								<span>제목</span>
								<input type="hidden" name="nno" value="3">
								<p>
									<input type="text" name="nTitle" id="nTitle" class="form-control">
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
						<textarea rows="15" cols="60" style="resize: none;" class="form-control" id="nContents" name="nContents"></textarea>
					</div>
					<div class="col-md-3"></div>
				</div>
				</form>
			<br>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>
				<div class="col-md-3">
					<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#staticModal">목록</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-outline-warning" type="submit" onclick="nModify();">수정</button>
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
					<p>공지사항 수정 중입니다. 페이지를 이동합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-primary" onclick="nList()">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function showCategory(obj) {
			var category1 = [ "본사 공지", "이벤트안내" ];
			var cateVal=["notice", "event"];
			var category2 = [ "공지사항", "이벤트" ];
			var $target = $("select[name='category']");
			var data;

			if (obj == "seller") {
				data = category1;
			} else if (obj == "customer") {
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
		$(function(){
			var option="seller";
			$("input[name='nTitle']").val("2019년 1월 룰렛 이벤트 안내");
			$("textarea[name='nContents']").val("새로운 이벤트가 시작됩니다.룰렛을 열심히 돌려 쿠폰을 획득하세요룰렛 링크 :");
			
		});
		function nModify() {
			var num=$("input[name='nno']").val();
			console.log(num);
		}
		function nList(){
			location.href="admin.ad?admin=board/noticeList";
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
