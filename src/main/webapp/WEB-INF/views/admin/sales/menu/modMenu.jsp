<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../common/header.jsp"/>
<style>
	#toppingMod{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">토핑 수정</h3>
			</div>
			<div class="card-body">
			<c:if test="${topping.iNo>0}">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="mx-auto d-block">
									<%-- <img class="rounded-circle mx-auto d-block" src="${topping.iFilePath }${topping.iChangeName}" alt="${topping.mName }"> --%>
									<img class="rounded-circle mx-auto d-block" src="${topping.iFilePath.substring(41) }/${topping.iChangeName}" alt="${topping.mName }">
									<h5 class="text-sm-center mt-2 mb-1">${topping.mName }</h5>
									<!-- <div class="location text-sm-center"><i class="fa fa-map-marker"></i> California, United States</div> -->
								</div>
								<hr>
							</div>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</c:if>
				<!-- 토핑 정보 영역 -->
				<form id="modTopping" action="modTopping.ad" method="post">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li">
								<span>토핑 번호</span><p><input type="number" value="${topping.mNo }" disabled>
								<input type="hidden" name="mNo" value="${topping.mNo}"></p>
							</li>
							<li class="member-li"><span>분류</span>
								<p>
									<select name="mCate">
										<option <c:if test="${topping.mCate==1 }">selected</c:if> value="1">도우</option>
										<option <c:if test="${topping.mCate==2 }">selected</c:if> value="2" >엣지</option>
										<option <c:if test="${topping.mCate==3 }">selected</c:if> value="3">크러스트</option>
										<option <c:if test="${topping.mCate==4 }">selected</c:if> value="4">토핑</option>
										<option <c:if test="${topping.mCate==5 }">selected</c:if> value="5">사이드</option>
										<option <c:if test="${topping.mCate==6 }">selected</c:if> value="6">포장재</option>
									</select>
								</p>
							</li>
							<li class="member-li"><span>크기</span><p><input type="text" name="mSize" value="${topping.mSize }"></p></li>
							<li class="member-li"><span>도매 가격</span><p><input type="number" name="mBuyPrice" value="${topping.mBuyPrice }"> 원</p></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>토핑 명</span><p><input type="text" name="mName" value="${topping.mName }"></p></li>
							<li class="member-li"><span>상태</span>
								<p>
									<select name="mStatus">
										<option <c:if test="${topping.mStatus=='Y' }">selected</c:if> value="Y">판매중</option>
										<option <c:if test="${topping.mStatus='N' }">selected</c:if> value="N">판매중지</option>
									</select>
								</p>
							</li>
							<li class="member-li"><span>중량</span><p><input type="number" name="mWeight" value="${topping.mWeight}">g</p></li>
							<li class="member-li"><span>판매 가격</span><p><input type="number" name="mSellPrice" value="${topping.mSellPrice }"> 원</p></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-6"></div>	
					<div class="col-md-4">
						<button class="btn btn-outline-secondary" type="button"onclick="location.href='toppingList.ad'">목록으로</button>
						<button class="btn btn-outline-warning" type="submit">수정</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function modTopping(){
			var num=$("input[name='tno']").val();
			console.log(num);
			location.href="admin.ad?admin=sales/menu/modTopping";
		}
	</script>
</section>
<jsp:include page="../../common/footer.jsp"/>