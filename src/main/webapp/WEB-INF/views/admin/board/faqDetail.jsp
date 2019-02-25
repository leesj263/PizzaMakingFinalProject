<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<jsp:include page="../common/header.jsp"/>

<section>
	<div class="right-panel">
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
								<p>
									<c:choose>
										<c:when test="${faq.boardCate==1 }">
											<td>[결제]</td>
										</c:when>
										<c:when test="${faq.boardCate==2 }">
											<td>[주문]</td>
										</c:when>
										<c:when test="${faq.boardCate==3 }">
											<td>[공유 / 후기 / 질문답변]</td>
										</c:when>
										<c:otherwise>
											<td>[이벤트]</td>
										</c:otherwise>
									</c:choose>	
								</p>
							</li>
							<li class="member-li"><input type="hidden" name="boardNo" value="${faq.boardNo }">
								<span>제목</span>
								<p>${faq.boardTitle }</p>
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
									<% pageContext.setAttribute("newLineChar", "\n"); %>
									${fn:replace(faq.boardContent, newLineChar, "<br/>")}
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
					<button class="btn btn-outline-secondary" onclick="location.href='faqList.ad'">목록</button>
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
					var num=$("input[name='boardNo']").val();
					console.log(num);
					location.href="faqModifyView.ad?num="+num;
				}
				function fDelete(){
					var num=$("input[name='boardNo']").val();
					console.log(num);
					location.href="faqDelete.ad?num="+num;
				}
			</script>
		</div>
	</div>
</div>
</section>
<jsp:include page="../common/footer.jsp"/>
