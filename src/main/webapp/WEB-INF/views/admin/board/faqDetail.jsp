<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../common/header.jsp"/>

<section>
	<div class="right-panel">
	
		<p>faqDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">FAQ</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span>분류</span>
								<p>[결제]</p></li>
							<li class="member-li"><input type="hidden" name="qno" value="3">
								<span>제목</span>
								<p>카카오페이 결제가 안돼요</p>
							</li>
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
									서버 차원의 오류로 정상 결제가 진행되지 않는 경우에는 공지사항에 작성하고 있습니다.
									공지사항 페이지에서 확인할 수 없는 경우는 고객님의 카드 혹은 페이 측의 서버 문제이므로
									해당 카드사 혹은 카카오에 문의해주시기 바랍니다.
									공지사항 링크 :
								</td>
							</tr>
						</table>
					</div>
					<div class="col-md-3"></div>
				</div>
			<br>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>
				<div class="col-md-3">
					<button class="btn btn-outline-secondary" onclick="location.href='admin.ad?admin=board/faqList'">목록</button>
					<button class="btn btn-outline-warning" type="submit" onclick="fModify();">수정</button>
					<button class="btn btn-outline-danger" type="submit" data-toggle="modal" data-target="#staticModal">삭제</button>
				</div>
				<div class="col-md-2"></div>
			</div>
	<div class="modal fade" id="staticModal" tabindex="-1" role="dialog"aria-labelledby="staticModalLabel" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>[     ] FaQ를 정말 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-primary" onclick="fDelete()">Confirm</button>
				</div>
			</div>
		</div>
	</div>
			<script>
				function fModify(){
					var num=$("input[name='qno']").val();
					console.log(num);
					location.href="admin.ad?admin=board/faqModify";
				}
				function fDelete(){
					var num=$("input[name='qno']").val();
					console.log(num);
				}
			</script>
		</div>
	</div>
</div>
</section>
<jsp:include page="../common/footer.jsp"/>
