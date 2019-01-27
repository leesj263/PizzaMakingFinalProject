<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />


<style>
#main {
	padding: 50px;
}

.tableBtnDiv {
	align: right;
	margin-left: 600px;
}
</style>
<section>
	<div id="main">


		<!-- -------------------------쿠폰 검색---------------------------------- --->

		<div class="card-body col-lg-10">
			<div class="justify-content-md-cente">
				<h3>쿠폰 검색</h3>
			</div>
			<hr>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col" style="background-color: rgba(0, 0, 0, .03);">
							<div style=" margin-bottom: 10%;">검색조건</div>
						</th>
						<th scope="col">
							<div class="col-12 col-md-3">
								<select name="select" id="select" class="form-control">
									<option value="0">이름 검색</option>
									<option value="1">내용 검색</option>
								</select>
							</div>

							<div class="row form-group">
								<div class="col-12 col-md-10">
									<input type="text" id="text-input" name="text-input"
										placeholder="내용을 입력하세요" class="form-control">
								</div>
							</div>
						</th>
					</tr>
				</thead>
			</table>

			<div class="row justify-content-md-center">
				<button type="button" class="btn btn-outline-secondary btn-lg">
					<i class="fa fa-search"></i>&nbsp;검색
				</button>
			</div>
		</div>


		<!-- ------------------------------------------------------------ -->
		<!--    <div class="col-lg-10">
         <div class="card">
            <div class="card-header">
               <strong class="card-title">쿠폰 검색</strong>
            </div>
            <div class="card-body">

               <div class="col-12 col-md-3">
                  <select name="select" id="select" class="form-control">
                     <option value="0">이름 검색</option>
                     <option value="1">내용 검색</option>
                  </select>
               </div>

               <div class="row form-group">
                  <div class="col-12 col-md-10">
                     <input type="text" id="text-input" name="text-input"
                        placeholder="내용을 입력하세요" class="form-control">
                  </div>
               </div>
               <div class="row justify-content-md-center">
                  <button type="button" class="btn btn-outline-secondary btn-lg">
                     <i class="fa fa-search"></i>&nbsp;검색
                  </button>
               </div>
            </div>
         </div>
      </div>
 -->

		<!-- -------------------------생성된 쿠폰 조회----------------------------------- -->

		<div class="col-lg-10" style="margin-top: 100px">
			<div class="card">
				<div class="justify-content-md-cente">
					<h3>생성된 쿠폰 조회</h3>
				</div>
				<hr>
				<div class="card-body">
					<table class="table table-striped" width="700px">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">쿠폰코드</th>
								<th scope="col">쿠폰명</th>
								<th scope="col">할인</th>
								<th scope="col">생성일</th>
								<th scope="col">유효기간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>CP00001</td>
								<td>회원가입 쿠폰</td>
								<td>30% 할인</td>
								<td>20190115</td>
								<td>20190222</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>CP00002</td>
								<td>50% 쿠폰</td>
								<td>50% 할인</td>
								<td>20190111</td>
								<td>20190655</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>CP00011</td>
								<td>이벤트 쿠폰</td>
								<td>10% 할인</td>
								<td>20190215</td>
								<td>20190523</td>
							</tr>
						</tbody>
					</table>
					<div class="tableBtnDiv">
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='admin.ad?admin=coupon/lssuingCoupon'">
							<i class="fa fa-lightbulb-o"></i>&nbsp; 발급
						</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-outline-secondary btn-sm"  onclick="location.href='admin.ad?admin=coupon/couponUpdate'">
							<i class="fa fa-magic"></i>&nbsp; 수정
						</button>
					</div>
				</div>
			</div>
		</div>



	</div>
</section>
<jsp:include page="../common/footer.jsp" />

