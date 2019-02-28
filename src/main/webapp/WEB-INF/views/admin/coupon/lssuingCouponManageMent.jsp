<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#main {
   padding: 50px;
}

.tableBtnDiv {
   align: right;
   margin-left: 750px;
}
</style>
<section>
   <div id="main">

      

      <!-- -------------------------쿠폰 검색---------------------------------- -->
      <form action="lssuingCouponSearch.co">
      <div class="card-body col-lg-10">
      <div class="card">
               <div class="justify-content-md-cente">
                   <h3>쿠폰 발급하기</h3> 
               </div><hr>
         <table class="table table-bordered">
            <thead>
               <tr>
                  <th scope="col" style="background-color: rgba(0, 0, 0, .03);">
							<div style=" margin-bottom: 10%;">검색조건</div>
				  </th>
                  <th scope="col">
                     <div class="col-12 col-md-3">
                        <select name="searchType" id="select" class="form-control">
                           <option value="0">코드 검색</option>
                           <option value="1">내용 검색</option>
                        </select>
                     </div>

                     <div class="row form-group">
                        <div class="col-12 col-md-10">
                           <input type="number" id="searchContentId" name="searchContent"
                              placeholder="내용을 입력하세요" class="form-control">
                        </div>
                     </div>
                  </th>
               </tr>
            </thead>
         </table>

         <div class="row justify-content-md-center">
            <button type="submit" class="btn btn-outline-secondary btn-lg" onclick="return searchBtn()">
               <i class="fa fa-search"></i>&nbsp;검색
            </button>
         </div>
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

      <!-- -------------------------발급된 쿠폰 조회----------------------------------- -->

      <div class="col-lg-10" style="margin-top: 100px">
         <div class="card">
             <div class="justify-content-md-cente">
                   <h3>발급된 쿠폰 조회</h3> 
               </div><hr>
            <div class="card-body">
               <table class="table table-striped" width="700px">
                  <thead>
                     <tr>
                        <th scope="col"></th>
                        <th scope="col">쿠폰코드</th>
                        <th scope="col">회원아이디</th>
                        <th scope="col">회원이름</th>
                        <th scope="col">쿠폰명</th>
                        <th scope="col">할인</th>
                        <th scope="col">생성일</th>
                        <th scope="col">발급일</th>
                        <th scope="col">만료일</th>
                        <th scope="col">상태</th>

                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="cList" items="${issuingCouponAllList}" varStatus="varStatus">
              
                     <tr class="listAreaTr">
                        <th scope="row">${varStatus.count }</th>
                        <td>${cList.issueNo}</td>
                        <td>${cList.memberId}</td>
                        <td>${cList.memberName }</td>
                        <td>${cList.couponName }</td>
                        <c:if test="${cList.couponCateg ==0}">								
						<td>${Math.round(cList.couponRdiscount *100)}%</td>
						</c:if>
						<c:if test="${cList.couponCateg ==1}">								
						<td>${cList.couponPdiscount }원</td>
						</c:if>
						<td>${cList.couponCdate }</td>
                        <td>${cList.issueCdate }</td>
						<td>${cList.couponEdate }</td>
                        <td>${cList.issueStatus }</td>
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
                  
                  &nbsp;&nbsp;
                  <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal"
							data-target="#delModal">
                     <i class="fa fa-magic"></i>&nbsp; 삭제
                  </button>
               </div>
            </div>
         </div>
      </div>

	<!-- -------------------------삭제버튼 클릭 시 모달 -------------------------------------------->
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>정말로 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary" id="deleteCouponBtn">예</button>
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">아니오</button>
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

$("#deleteCouponBtn").click(function(){
	console.log(couponNo);
});

function searchBtn(){
	var searchContentId =$("#searchContentId").val();
	console.log(searchContentId);
	if(searchContentId==""){
		//alert("b");
		swal("내용을 써주세요");
		return false;
	}
}

$("#select").click(function () {
	$("#select").attr("option","selected");
	
	if($("#select option:selected").val()==0){
		//swal("숫자만 입력하세요");
		$("#searchContentId").attr("type","number");
	}else{
		$("#searchContentId").attr("type","text");
	}
	
});


</script>
<jsp:include page="../common/footer.jsp" />

