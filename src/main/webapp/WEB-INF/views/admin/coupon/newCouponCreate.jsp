<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<!-- 시멘틱 UI -->
<link rel="stylesheet" type="text/css"
	href="/pmfp/resources/main/assets/js/semantic/semantic.min.css">
<script src="/pmfp/resources/main/assets/js/semantic/semantic.min.js"></script>

<style>
#main {
	padding: 50px;
}

td{
	width:150px;
}
</style>
<section>
	<div id="main">

		
		
			<div class="card">
				<div class="justify-content-md-cente">
                   <h3>쿠폰 생성하기</h3> 
               </div><hr>
				<div class="card-body card-block">
				
					<form action="newCouponCreate.co" method="post">
					<table align="center">
					<Tr>
						
						<td>
								<label for="text-input" class=" form-control-label"> 
								<strong>쿠폰 이름</strong></label>
						</td>
						<td>
								<input type="text" id="text-input" name="couponName" style="width:425px"
									placeholder="" class="form-control">
						</td>
					
					</Tr>
					<tr>
						<td style="height:10px">
						
						</td>
					</tr>
					<tr>
						
						
							
							<td>
								<label><strong>할인율 or 할인 금액</strong></label>
							</td>
							<td>
							<div class="ui form">
							<div class="inline fields">
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="couponCategStr" id="radioPercent" value="0">
										<label>쿠폰 할인율</label>
									</div>
								</div>
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="couponCategStr" id="radioWon" value="1"> 
										<label>쿠폰 할인금액</label>
									</div>
								</div>
							
							</div>
						</div>
						</td>
					</tr>

						<!-- 	<div class="inline field">
							<div class="ui toggle checkbox">
								<input type="checkbox" tabindex="0" class="hidden">
								 <label>쿠폰 할인</label>
								<input type="hidden" name="couponChangeNum" id="couponChangeNum" value="1">
							</div>
						</div> -->
					
					<tr id="percentTr">
						<div class="row form-group">
							<td>
								<label for="text-input" class=" form-control-label"><strong>
										할인율</strong></label>
							</td>
							&nbsp;&nbsp;&nbsp;
							<td>
								<input type="text" id="percent" name="couponRdiscountStr" style="width:425px"
									placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" class="form-control">&nbsp;&nbsp;
							</td>
							
						</div>
					</tr>
					
					<tr id="wonTr">
						<div class="row form-group">
							<td>
								<label for="text-input" class=" form-control-label"><strong>할인 금액</strong></label>
							</td>
							&nbsp;&nbsp;&nbsp;
							<td>
								<input type="text" id="won" name="couponPdiscountStr" style="width:425px"
									placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원" class="form-control">&nbsp;&nbsp;
							</td>
							
						</div>
					</tr>
					
					
					<tr>
						<div class="row form-group">
							<td>
								<label for="text-input" class=" form-control-label"><strong>쿠폰
										결제 금액</strong></label>
							</td>
							<td>
								<input type="text" id="text-input" name="couponConditionStr"
									placeholder="" class="form-control"><small
									class="form-text text-muted">원 이상 주문시 사용 가능</small>
							</td>
						</div>
					</tr>
					<tr>
						<div class="row form-group">
							<td>
								<label for="select" class=" form-control-label"><strong>유효기간</strong></label>
							</td>
							<td>
								<select name="couponEdateStr" id="select" class="form-control">
									<option value="1">30일</option>
									<option value="2">60일</option>
									<option value="3">90일</option>
									<option value="4">120일</option>
								</select>
							</td>
						</div>
					</tr>
					<tr>
						<td style="height:50px">
						
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<div class="row justify-content-md-center" align="center">
							<button type="submit" class="btn btn-outline-secondary btn-lg" data-toggle="modal"
							data-target="#createModal" style="width:200px; height:60px">
								<i class="fa fa-hand-o-right"></i>&nbsp;쿠폰 생성
							</button>
						</div>
						</td>
					</tr>
						</table>
					</form>
					
				</div>

			</div>
		



	</div>
	
		<!-- -------------------------쿠폰 생성하기 버튼 클릭 시 모달 -------------------------------------------->
	<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>쿠폰이 생성되었습니다!!!!!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary" onclick="location.href='searchCoupon.co'">예</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		
		$("#percentTr").hide();
		$("#wonTr").hide();
		
		//console.log($("input:checked[id='radioPercent']").click());
		$("#radioPercent").change(function(){
			$("#percentTr").show();
			$("#wonTr").hide();
		});
		$("#radioWon").change(function(){
			$("#wonTr").show();
			$("#percentTr").hide();
		});
		
	});
	
	</script>
	
</section>
<jsp:include page="../common/footer.jsp" />

