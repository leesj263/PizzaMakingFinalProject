<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>

<section>
	<div class="right-panel">
	
		<p>qnaDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">Q&A</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span>분류</span>
								<p>[쿠폰]</p></li>
							<li class="member-li"><span>제목</span>
								<p>쿠폰 사용 후 주문 취소를 했는데...
									<input type="hidden" name="qno" value="3">
								</p>
							</li>
							<li class="member-li"><span>작성자</span><p>asdfasd</p></li>
						</ul>
					</div>
					<div class="col-md-2"></div>
				</div>
			<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-7">
						<table class="table"> 
							<tr>
								<td id="nContents">
									쿠폰이 다시 안들어와요 원래 이런건가요?
									
								</td>
							</tr>
						</table>
					</div>
					<div class="col-md-3"></div>
				</div>
			<br>
			<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-7" id="summernote">
						<textarea cols="85" rows="4"></textarea>
					</div>
					<div class="col-md-3">
						
					</div>
				</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>
				<div class="col-md-3">
					<button class="btn btn-outline-secondary" onclick="location.href='admin.ad?admin=board/qnaList'">목록</button>
					<button class="btn btn-outline-warning" type="submit" onclick="qWrite();">답변 등록</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			<script>
				function qWrite(){
					var num=$("input[name='qno']").val();
					console.log(num);
				}
			</script>
		</div>
	</div>
</div>
</section>
<jsp:include page="../common/footer.jsp"/>