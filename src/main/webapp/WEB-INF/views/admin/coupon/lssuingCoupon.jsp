<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
#main {
	padding: 50px;
}
</style>
<section>
	<div id="main">


		<div class="col-lg-10">
			<div class="card">
				<div class="justify-content-md-cente">
					<h3>쿠폰 발급하기</h3>
				</div>
				<hr>
				<div class="card-body card-block">
					<form action="issuingCoupon.co" method="post" class="form-horizontal"><!--  enctype="multipart/form-data" -->
						


						<div class="row form-group">
							<div class="col col-md-2">
								<label class=" form-control-label">회원 대상</label>
							</div>
							<div class="col col-md-9">
								<div class="form-check-inline form-check">
									<label for="inline-radio1" class="form-check-label "> <input
										type="radio" checked id="inline-radio1" name="AllMemberRadios"
										value="option1" class="form-check-input">모든 회원
									</label> &nbsp;&nbsp;&nbsp; <label for="inline-radio2"
										class="form-check-label "> <input type="radio" 
										id="inline-radio2" name="AllMemberRadios" value="option2"
										class="form-check-input">특정 회원
									</label> &nbsp;&nbsp;&nbsp;
									<div class="row form-group">
										<div class="col-3 col-md-12">
											<input type="text" id="memberIdSearch" name="memberId"
												placeholder="" class="form-control">
										</div>
									</div>
									&nbsp;&nbsp;&nbsp;
									<div onclick="return memberIdSearch()" class="btn btn-outline-secondary btn-sm">
										<i class="fa fa-magic"></i>&nbsp; 회원 아이디 조회
									</div>
								</div>

							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-2">
								<label for="selectSm" class=" form-control-label">쿠폰 이름</label>
							</div>
							<div class="col-12 col-md-9">
								<select name="selectSm" id="SelectLm"
									class="form-control-sm form-control">
									
									
									 <c:forEach var="cList" items="${list }">
										<c:if test="${param.couponNo == cList.couponNo }">
												<option value="${cList.couponNo }" selected>${cList.couponName }</option>
												
										</c:if>
										
										<c:if test="${param.couponNo != cList.couponNo}">
											<option value="${cList.couponNo }">${cList.couponName }</option>			
															
										
										</c:if>
									
									
									</c:forEach>
									
								<%-- 	<c:forEach var="cList" items="${list }">
										
											<option value="${cList.couponNo }">${cList.couponName }</option>								
										
									
									
									
									</c:forEach> --%>
									
								
									
								</select>
								
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col col-md-2">
								<label for="select" class=" form-control-label">유효기간</label>
							</div>
							<div class="col-12 col-md-9">
								<select name="issueEdate" id="select" class="form-control">
									<option value="1">30일</option>
									<option value="2">60일</option>
									<option value="3">90일</option>
									<option value="4">120일</option>
								</select>
							</div>
						</div>
					



						<div class="row form-group">
							<div class="col col-md-2">
								<label for="multiple-select" class=" form-control-label">회원
									목록</label>
							</div>

						
								<div class="col col-md-9"  id="AllMemberDiv">
								<select name="multiple-select" id="multiple-select" multiple=""
									class="form-control" style="height:300px">
									<option value="0">-------------------------------- 모든 회원입니다---------------------------------</option>
								</select>
							</div>
							
						<div class="col col-md-9" style="display: none;" id="specialMemberDiv">
								<select id="memberListStart" multiple=""  name="memberNameArr"
									class="form-control" style="height:300px">
									<option value="0">----------회원 목록 입니다.-----------</option>
								
								</select>
							</div> 

						</div>

						<div class="row justify-content-md-center">
							<button type="submit" class="btn btn-outline-secondary btn-lg" data-toggle="modal"
							data-target="#lssuingModal">
								<i class="fa fa-search"></i>&nbsp;쿠폰 발급하기
							</button>
						</div>



					</form>
				</div>

			</div>

		</div>



	</div>
	
	
	<!-- -------------------------쿠폰 발급하기 버튼 클릭 시 모달 -------------------------------------------->
	<div class="modal fade" id="lssuingModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>쿠폰 발급 되었습니다!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary" onclick="location.href='admin.ad?admin=coupon/lssuingCouponManageMent'">예</button>
				</div>
			</div>
		</div>
	</div>
	
</section>
	<script>
	//모든회원, 특정회원 
		$(document).ready(function(){
			$("input:radio[id=inline-radio2]").change(function(){
			console.log("클릭되닝");	
			$("#specialMemberDiv").toggle();
			$("#AllMemberDiv").toggle();
			})
			$("input:radio[id=inline-radio1]").change(function(){
				console.log("모든 회원 클릭");
				$("#specialMemberDiv").toggle();
				$("#AllMemberDiv").toggle();
			})
			
		});
	function memberIdSearch(){
		console.log("회원아이디조회");
		var memberId = $("#memberIdSearch").val();
		var memberListStart = $("#memberListStart");
		console.log(memberId);
		
		$.ajax({
			url:"memberIdSearch.co",
			type:"post",
			data:{"memberId":memberId},
			success:function(data){
				console.log(data);
				if(data.memberName==null){
					swal("아이디가 없듬");
				}else{
				swal("아이디가 있습니다!");
				memberListStart.append('<option value="'+data.memberNo+'" selected>'+data.memberName+'</option>');
				}
			},error:function(data){
				console.log("데이터 통신 실팽");
			}
		});
	}
	
	</script>

<jsp:include page="../common/footer.jsp" />

