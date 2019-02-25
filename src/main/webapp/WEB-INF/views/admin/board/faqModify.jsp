<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">FAQ 수정</h3>
			</div>
			<div class="card-body">
			<form action="faqModify.ad" method="post">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span><input type="hidden" name="boardType" value="2">분류</span>
								<p>
									<select name="boardCate">
										<option value="1" <c:if test="${faq.boardCate==1}">selected</c:if>>결제</option>
										<option value="2" <c:if test="${faq.boardCate==2}">selected</c:if>>주문</option>
										<option value="3" <c:if test="${faq.boardCate==3}">selected</c:if>>공유/후기/질문답변</option>
										<option value="4" <c:if test="${faq.boardCate==4}">selected</c:if>>이벤트</option>
									</select>
								</p>
							</li>
							<li class="member-li">
								<span>제목</span>
								<input type="hidden" name="boardNo" value="${faq.boardNo }">
								<p>
									<input type="text" name="boardTitle" id="fTitle" class="form-control" value="${faq.boardTitle }">
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
						<textarea rows="15" cols="60" style="resize: none;" class="form-control" id="fContents" name="boardContent">${faq.boardContent }</textarea>
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
					<button class="btn btn-outline-warning" type="submit" onclick="fModify();">수정</button>
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
		$(function(){
			
		});
		function fModify() {
			var num=$("input[name='boardNo']").val();
			console.log(num);
		}
		function fList(){
			location.href="faqList.ad";
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
