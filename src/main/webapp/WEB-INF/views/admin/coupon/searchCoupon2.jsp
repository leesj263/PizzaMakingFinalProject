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

	<form action="searchTwoCoupon.co">
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
								<select name="searchType" id="select" class="form-control">
									<option value="0">번호 검색</option>
									<option value="1">내용 검색</option>
								</select>
							</div>

							<div class="row form-group">
								<div class="col-12 col-md-10">
									<input type="text" id="text-input" name="searchContent"
										placeholder="내용을 입력하세요" class="form-control">
								</div>
							</div>
						</th>
					</tr>
				</thead>
			</table>

			<div class="row justify-content-md-center">
				<button type="submit" class="btn btn-outline-secondary btn-lg">
					<i class="fa fa-search"></i>&nbsp;검색
				</button>
			</div>
		</div>
</form>

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
						<c:forEach var="cList" items="${searchCouponListAll}" varStatus="varStatus">
							<tr class="listAreaTr">
								<th scope="row">${varStatus.count }</th>
								<td>${cList.couponNo }</td>
								<td>${cList.couponName }</td>
								<c:if test="${cList.couponCateg ==0}">								
								<td>${cList.couponRdiscount *100}%</td>
								</c:if>
								<c:if test="${cList.couponCateg ==1}">								
								<td>${cList.couponPdiscount }원</td>
								</c:if>
								<td>${cList.couponCdate }</td>
								<td>${cList.couponEdate }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div align="center">
						<div class="dataTables_paginate paging_simple_numbers col-md-1"
							id="bootstrap-data-table_paginate">
							<ul class="pagination">
								<c:if test="${pi.currentPage >1}">
									<c:url var="btnList" value="${ addr }">
										<c:param name="currentPage" value="${pi.currentPage-1}" />
										<c:param name="searchContent" value="${searchContent }"/>
										<c:param name="searchType" value="${searchType }"/>
									</c:url>
									<li class="paginate_button page-item previous"
										id="bootstrap-data-table_previous"><a href="${btnList }"
										aria-controls="bootstrap-data-table" data-dt-idx="0"
										tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
									</li>
								</c:if>
								<c:if test="${pi.currentPage==1 }">
									<li class="paginate_button page-item previous disabled"
										id="bootstrap-data-table_previous"><a href="#"
										aria-controls="bootstrap-data-table" data-dt-idx="0"
										tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
									</li>
								</c:if>
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<li class="paginate_button page-item active disabled"><a
											href="#" aria-controls="bootstrap-data-table"
											data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
										</li>
									</c:if>

									<c:if test="${ p ne pi.currentPage }">
										<c:url var="btnList" value="${ addr }">
											<c:param name="currentPage" value="${ p }" />
											<c:param name="searchContent" value="${searchContent }"/>
											<c:param name="searchType" value="${searchType }"/>
										</c:url>
										<li class="paginate_button page-item"><a
											href="${btnList }" aria-controls="bootstrap-data-table"
											data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
										</li>
									</c:if>
								</c:forEach>
								<c:if test="${pi.currentPage <pi.maxPage}">
									<c:url var="btnList" value="${ addr }">
										<c:param name="currentPage" value="${pi.currentPage+1}" />
										<c:param name="searchContent" value="${searchContent }"/>
										<c:param name="searchType" value="${searchType }"/>
									</c:url>
									<li class="paginate_button page-item next"
										id="bootstrap-data-table_next"><a href="${btnList }"
										aria-controls="bootstrap-data-table" data-dt-idx="7"
										tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
									</li>
								</c:if>
								<c:if test="${pi.currentPage>=pi.maxPage }">
									<li class="paginate_button page-item next disabled"
										id="bootstrap-data-table_next"><a href="#"
										aria-controls="bootstrap-data-table" data-dt-idx="7"
										tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>

					<div class="tableBtnDiv">
						<!-- <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='admin.ad?admin=coupon/lssuingCoupon'" id=""> -->
						<button type="button" class="btn btn-outline-secondary btn-sm"  id="couponLissuingBtn">
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

<script>

	var couponNo=0;
		$(".listAreaTr").mouseenter(function(){
			$(this).children().css({"color" : "#9d9d9d","cursor" : "pointer"});
		}).mouseout(function(){
			$(this).children().css({"color" : "#212529"});
		}).click(function(){
			couponNo=$(this).children().eq(1).text();
		});
		
		$("#couponLissuingBtn").click(function(){
			console.log(couponNo);
			location.href='admin.ad?admin=coupon/lssuingCoupon&couponNo='+couponNo;
		});


</script>
<jsp:include page="../common/footer.jsp" />

