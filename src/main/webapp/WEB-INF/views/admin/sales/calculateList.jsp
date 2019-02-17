<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#calculateList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<p>calculateList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12"><h3 class="menu-title">정산 목록</h3></div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-7"></div>
					<div class="col-md-3">
						<button class="btn btn-sm btn-link" disabled>선택한 내역을</button>
						<button class="btn btn-sm btn-outline-warning" onclick="selectCalYes()">정산완료</button>
					</div>
					<div class="col-md-2"></div>
				</div>
				<!-- 정산 목록 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<table class="table table-striped col-md-8" id="calculateList">
						<c:if test="${calList.size() > 0 }">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" onclick="checkAll();" name="checkAllRow"></th>
									<th scope="col">정산번호</th>
									<th scope="col">정산월</th>
									<th scope="col">지점</th>
									<th scope="col">주문횟수</th>
									<th scope="col">정산금액</th>
									<th scope="col">정산상태</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${calList }" var="cal">
									<tr>
										<th>
											<c:if test="${cal.orderCStatus=='Y' }"></c:if>
											<c:if test="${cal.orderCStatus=='N' }">
												<input type="checkbox" name="checkCal">
											</c:if>
										</th>
										<td>
											<input type="hidden" name="orderExpNo" value="${cal.orderExpNo }">
											<input type="hidden" name="comNo" value="${cal.comNo }">
											${fn:replace(cal.orderExpMonth, "-", "")}-00${cal.rn}00${cal.comNo }
										</td>
										<td>${cal.orderExpMonth.toString().substring(0,7) }</td>
										<td>${cal.comName }점</td>
										<td>${cal.times }</td>
										<td>${cal.price }</td>
										<c:if test="${cal.orderCStatus=='Y' }">
											<td>정산완료</td>
											<th></th>
										</c:if>
										<c:if test="${cal.orderCStatus=='N' }">
											<td>미정산</td>
											<th>
												<button class="btn btn-sm btn-outline-warning" onclick="calYes(${cal.orderExpNo}, ${cal.comNo})">정산완료</button>
											</th>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${calList.size()==0 }">
							<thead>
								<tr>
									<td colspan="5">주문 내역이 없습니다</td>
								</tr>
							</thead>
						</c:if>
					</table>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-5"></div>
	<!-- 검색 영역 -->
	<!-- 페이징 영역 -->
	<div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
		<ul class="pagination">
			<c:if test="${pi.currentPage >1}">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${pi.currentPage-1}"/>
				</c:url>
				<li class="paginate_button page-item previous" id="bootstrap-data-table_previous">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
				</li>
			</c:if>
			<c:if test="${pi.currentPage==1 }">
				<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a>
				</li>
			</c:if>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<li class="paginate_button page-item active disabled">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
				</li>
			</c:if>
				
			<c:if test = "${ p ne pi.currentPage }">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${ p }"/>
				</c:url>
				<li class="paginate_button page-item">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="${p }" tabindex="0" class="page-link">${p }</a>
				</li>
			</c:if>
		</c:forEach>
			<c:if test="${pi.currentPage <pi.maxPage}">
				<c:url var="btnList" value="${ addr }">
					<c:param name="currentPage" value="${pi.currentPage+1}"/>
				</c:url>
				<li class="paginate_button page-item next" id="bootstrap-data-table_next">
					<a href="${btnList }" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
				</li>
			</c:if>
			<c:if test="${pi.currentPage>=pi.maxPage }">
				<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
					<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="col-md-4"></div>
	<script>
		$(function(){
			$("#calculateList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var orderExpNo=$(this).parent().children().children().eq(1).val();
				var comNo=$(this).parent().children().children().eq(2).val();
				var times=$(this).parent().children().eq(4).text();
				console.log("orderExpNo="+orderExpNo+"&comNo="+comNo+"&times="+times);
				location.href="calculateDetail.ad?orderExpNo="+orderExpNo+"&comNo="+comNo;
			});
		});
		function calYes(num1, num2){
			console.log("updateCalculate.ad?orderExpNo="+num1+"&comNo="+num2);
			$.ajax({
				url:"updateCalculateList.ad",
				type:"get",
				async: false,
				data:{orderExpNo:num1,comNo:num2},
				success:function(data){
					if(data==1){
						alert("정산 처리가 완료되었습니다.");
						location.href='calculateList.ad';
					}else{
						alert("정산 처리가 실패했습니다. 다시 시도해주세요.");
						location.href='calculateList.ad';
					}
				},
				error:function(data){
					alert("통신 실패했습니다. 다시 시도해주세요.");
				}
			});
		}
		function checkAll(){
			if($("input[name='checkAllRow']").is(':checked')){
				$("input[name=checkCal]").prop("checked", true);
			}else{
				$("input[name=checkCal]").prop("checked", false);
			}
		}
		function selectCalYes(){
			var checkOrderExpNo = "";
			var checkComNo="";
			$( "input[name='checkCal']:checked").each(function (){
				checkOrderExpNo=checkOrderExpNo+$(this).parent().parent().children().children().eq(1).val()+",";
				checkComNo=checkComNo+$(this).parent().parent().children().children().eq(2).val()+",";
			});
			checkOrderExpNo = checkOrderExpNo.substring(0,checkOrderExpNo.lastIndexOf(","));
			checkComNo = checkComNo.substring(0,checkComNo.lastIndexOf(","));
			console.log(checkOrderExpNo);
			console.log(checkComNo);
			$.ajax({
				url:"updateSelectCalList.ad",
				type:"get",
				async: false,
				data:{orderExpNo:checkOrderExpNo,comNo:checkComNo},
				success:function(data){
					if(data==1){
						alert("정산 처리가 완료되었습니다.");
						location.href='calculateList.ad';
					}else{
						alert("정산 처리가 실패했습니다. 다시 시도해주세요.");
						location.href='calculateList.ad';
					}
				},
				error:function(data){
					alert("통신 실패했습니다. 다시 시도해주세요.");
				}
			});
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>