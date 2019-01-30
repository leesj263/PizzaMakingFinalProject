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
	
		<p>faqModify.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">FAQ 수정</h3>
			</div>
			<div class="card-body">
			<form>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span>분류</span>
								<p>
									<select name="faqType">
										<option value="credit" selected>결제</option>
										<option value="coupon">쿠폰</option>
										<option value="order">주문</option>
									</select>
								</p>
							</li>
							<li class="member-li">
								<span>제목</span>
								<input type="hidden" name="fno" value="3">
								<p>
									<input type="text" name="fTitle" id="fTitle" class="form-control">
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
						<textarea rows="15" cols="60" style="resize: none;" class="form-control" id="fContents" name="fContents"></textarea>
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
					<button class="btn btn-outline-warning" type="submit" onclick="fModify();">수정</button>
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
					<p>FAQ 수정 중입니다. 페이지를 이동합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-primary" onclick="fList()">Confirm</button>
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
			$("input[name='fTitle']").val("카카오페이 결제가 안돼요");
			$("textarea[name='fContents']").val("서버 차원의 오류로 정상 결제가 진행되지 않는 경우에는 공지사항에 작성하고 있습니다.공지사항 페이지에서 확인할 수 없는 경우는 고객님의 카드 혹은 페이 측의 서버 문제이므로해당 카드사 혹은 카카오에 문의해주시기 바랍니다.공지사항 링크 :");
			
		});
		function fModify() {
			var num=$("input[name='fno']").val();
			console.log(num);
		}
		function fList(){
			location.href="admin.ad?admin=board/faqList";
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
