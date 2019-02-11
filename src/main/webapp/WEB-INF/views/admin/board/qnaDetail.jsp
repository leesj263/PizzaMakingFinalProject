<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
								<p>
									<c:choose>
										<c:when test="${qna.boardCate==1 }">
											<td>[결제]</td>
										</c:when>
										<c:when test="${qna.boardCate==2 }">
											<td>[주문]</td>
										</c:when>
										<c:when test="${qna.boardCate==3 }">
											<td>[공유 / 후기 / 질문답변]</td>
										</c:when>
										<c:otherwise>
											<td>[이벤트]</td>
										</c:otherwise>
									</c:choose>	
								</p>
							</li>
							<li class="member-li"><span>제목</span>
								<p>쿠폰 사용 후 주문 취소를 했는데...
									<input type="hidden" name="qno" value="3">
								</p>
							</li>
							<li class="member-li">
								<span>작성자</span><p>${qna.memberNickname }</p>
								<span>작성일</span><p>${qna.boardDate }</p>
								<span>조회수</span><p>${qna.boardCount }</p>
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
									${fn:replace(qna.boardContent, newLineChar, "<br/>")}
								</td>
							</tr>
						</table>
					</div>
					<div class="col-md-3"></div>
				</div>
			<br>
			<div class="row">
				<div class="col-md-2"></div>
				<c:if test="${answer.boardContent ne null}">
				<div class="col-md-7" id="summernote">
					<table class="table"> 
						<tr>
							<td id="nContents">
								<% pageContext.setAttribute("newLineChar", "\n"); %>
								${fn:replace(answer.boardContent, newLineChar, "<br/>")}
							</td>
						</tr>
					</table>
				</div>
				</c:if>
				<c:if test="${answer.boardContent eq null }">
					<textarea cols="85" rows="4"></textarea>
				</c:if>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>
				<div class="col-md-3">
					<c:if test="${answer.boardContent eq null }">
						<button class="btn btn-outline-warning" type="submit" onclick="qWrite();">답변 등록</button>
					</c:if>
					<c:if test="${answer.boardContent ne null}">
					</c:if>
					<button class="btn btn-outline-secondary" onclick="location.href='qnaList.ad'">목록</button>
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