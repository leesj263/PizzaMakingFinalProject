<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../common/header.jsp"/>
<style>
	#menuDetail{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>menuDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">메뉴 상세보기</h3>
			</div>
			<div class="card-body">
			<c:if test="${menu.iNo>0}">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="mx-auto d-block">
									<%-- <img class="rounded-circle mx-auto d-block" src="${topping.iFilePath }${topping.iChangeName}" alt="${topping.mName }"> --%>
									<img class="rounded-circle mx-auto d-block" src="${menu.iFilePath.substring(41) }/${menu.iChangeName}" alt="${menu.mName }">
									<h5 class="text-sm-center mt-2 mb-1">${menu.mName } ${menu.mSize }</h5>
									<%-- <div class="location text-sm-center">
										<c:if test="${menu.mStatus=='Y' }">
											<i class="ti-unlock 2x"></i> 판매 중
										</c:if>
										<c:if test="${menu.mStatus=='N' }">
											<i class="ti-lock 2x"></i> 판매 중지
										</c:if>
									</div> --%>
								</div>
								<hr>
							</div>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</c:if>
				<!-- 토핑 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li">
								<span>피자 번호</span><p>${menu.bNo }</p><input type="hidden" name="bNo" value="${menu.bNo }">
							</li>
							<li class="member-li"><span>피자 명</span><p>${menu.bMenu } ${menu.bSize }</p></li>
							<li class="member-li"><span>도매 가격</span><p>${menu.bBuyPrice } 원</p></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>　</span><p>　</p></li>
							<li class="member-li"><span>크기</span><p>${menu.bSize }</p></li>
							<li class="member-li"><span>판매 가격</span><p>${menu.bSellPrice } 원</p></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-9">
						<table class="table table-striped" id="menuDetail">
							<thead>
								<tr>
									<th scope="row">토핑 번호</th>
									<th scope="row">토핑 이름</th>
									<th scope="row">도매 가격</th>
									<th scope="row">판매 가격</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${menuDetail }" var="m">
									<tr>
										<td>${m.mNo }</td>
										<td>${m.mName }</td>
										<td>${m.mBuyPrice }</td>
										<td>${m.mSellPrice }</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<th colspan="2">총 액</th>
								<th id="totalBuyPrice">${menu.bBuyPrice }</th>
								<th id="totalSellPrice">${menu.bSellPrice }</th>
							</tr>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div> -->
				<div>
					<div class="col-md-2"></div>
					<div class="col-md-5"></div>	
					<div class="col-md-5">
						<button class="btn btn-outline-secondary" onclick="location.href='menuList.ad'">목록으로</button>
						<button class="btn btn-outline-warning" onclick="location.href='menuModifyView.ad?basicNo=${menu.bNo}'">수정</button>
						<%-- <c:if test="${topping.mStatus=='Y' }">
							<button class="btn btn-outline-danger" data-toggle="modal" data-target="#staticModal">판매 중지</button>
						</c:if>
						<c:if test="${topping.mStatus=='N' }">
							<button class="btn btn-outline-danger" data-toggle="modal" data-target="#staticModal">재판매</button>
						</c:if> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%-- <div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true"data-backdrop="static">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<c:if test="${topping.mStatus=='Y' }">
							<p>${topping.mName } ${topping.mSize } 토핑을 정말 판매중지 하시겠습니까?</p>
						</c:if>
						<c:if test="${topping.mStatus=='N' }">
							<p>${topping.mName } ${topping.mSize } 토핑을 정말 재판매 하시겠습니까?</p>
						</c:if>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
						<c:if test="${topping.mStatus=='Y' }">
							<button type="button" class="btn btn-outline-primary" onclick="location.href='deleteTopping.ad?materialNo=${topping.mNo}'">Confirm</button>
						</c:if>
						<c:if test="${topping.mStatus=='N' }">
							<button type="button" class="btn btn-outline-primary" onclick="location.href='resellTopping.ad?materialNo=${topping.mNo}'">Confirm</button>
						</c:if>
					</div>
				</div>
			</div>
		</div> --%>
</section>
<jsp:include page="../../common/footer.jsp"/>