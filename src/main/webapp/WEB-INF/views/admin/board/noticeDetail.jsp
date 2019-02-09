<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
									${notice.boardTitle }
									<input type="hidden" name="boardNo" value="${notice.boardNo }">
								</p></li>
							<li class="member-li"><span>분류</span>
								<p>
									<c:choose>
										<c:when test="${notice.boardCate==1 }">
											<td>[안내]</td>
										</c:when>
										<c:when test="${notice.boardCate==2 }">
											<td>[공지]</td>
										</c:when>
										<c:when test="${notice.boardCate==3 }">
											<td>[경고]</td>
										</c:when>
										<c:otherwise>
											<td>[이벤트]</td>
										</c:otherwise>
									</c:choose>	
								</p></li>
							<!-- <li class="member-li"><span>첨부파일</span><p><input type="file" class="form-control" id="nFile" name="nFile"></p></li> -->
							<li class="member-li"><span>작성일</span><p>${notice.boardDate }</p><span>조회수</span><p>${notice.boardCount }</p></li>
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
									${notice.boardContent }
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
					<button class="btn btn-outline-secondary" onclick="location.href='noticeList.ad?'">목록</button>
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
		function nModify() {
			var num=$("input[name='nno']").val();
			console.log(num);
			location.href="admin.ad?admin=board/noticeModify";
		}
		function nDelete(){
			var num=$("input[name='nno']").val();
			console.log(num);
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
