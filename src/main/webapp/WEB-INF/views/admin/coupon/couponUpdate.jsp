<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />


<style>
#main {
	padding: 50px;
}
</style>
<section>
	<div id="main">

		
		<div class="col-lg-9">
			<div class="card">
				<div class="justify-content-md-cente">
                   <h3>쿠폰 수정하기</h3> 
               </div><hr>
				<div class="card-body card-block">
					<form action="couponUpdateBtn.co" method="post" class="form-horizontal">
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label"> <strong>쿠폰
										제목</strong></label>
							</div>
							<div class="col-12 col-md-7">
								<input type="text" id="text-input" name="couponName"
									placeholder="" value="${coupon.couponName}" class="form-control">
							</div>
						</div>
					
						<c:if test="${coupon.couponRdiscount ==0}">
								<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label"><strong>쿠폰
										할인 금액</strong></label>
							</div>
							&nbsp;&nbsp;&nbsp;
								<input type="number" id="text-input" name="couponPdiscountStr" style="width:425px"
									placeholder="" value="${coupon.couponPdiscount }" class="form-control">&nbsp;&nbsp;
							
						</div>
						
						</c:if>
						
						<c:if test="${coupon.couponPdiscount ==0}">
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label"><strong>쿠폰
										할인율</strong></label>
							</div>
							&nbsp;&nbsp;&nbsp;
								<input type="number" id="text-input" name="couponRdiscountStr" style="width:425px"
									placeholder="" value="${Math.round(coupon.couponRdiscount *100)}" class="form-control">&nbsp;&nbsp;
							
						</div>
						
						</c:if>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label"><strong>쿠폰
										결제 금액</strong></label>
							</div>
							<div class="col-12 col-md-7">
								<input type="number" id="text-input" name="couponConditionStr"
									placeholder="" class="form-control" value="${coupon.couponCondition }"><small
									class="form-text text-muted" >원 이상 주문시 사용 가능</small>
							</div>
						</div>
						<input type="hidden" value="${coupon.couponNo }" name="couponNo">
			
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label"><strong>유효기간</strong></label>
							</div>
							<div class="col-12 col-md-7">
								<select name="couponEdateStr" id="select" class="form-control">
									<option value="1">30일</option>
									<option value="2">60일</option>
									<option value="3">90일</option>
									<option value="4">120일</option>
								</select>
							</div>
						</div>

						<div class="row justify-content-md-center">
							<button type="submit" class="btn btn-outline-secondary btn-lg">
								<i class="fa fa-hand-o-right"></i>&nbsp;쿠폰 수정하기
							</button>
						</div>

					</form>
				</div>

			</div>
		</div>



	</div>
	
		<!-- -------------------------쿠폰 생성하기 버튼 클릭 시 모달 -------------------------------------------->
<!-- 	<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>쿠폰이 수정되었습니다!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary" onclick="location.href='admin.ad?admin=coupon/searchCoupon'">예</button>
				</div>
			</div>
		</div>
	</div> -->
	
</section>
<jsp:include page="../common/footer.jsp" />

