<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	#sellerSalesList, #sellerOrderList{
		text-align:center;
	}
	.member-ul .member-li > span{
		width : 120px !important;
	}
</style>
<section>
	<div class="right-panel">
		<p>sellerDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">업체 정보</h3>
			</div>
			<div class="card-body">
				<!-- 업체 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>지점명</span><p>${seller.comName }</p></li>
							<li class="member-li"><span>이메일</span><p>${seller.memberEmail }</p></li>
							<li class="member-li"><span>영업 상태</span>
								<p>
									<c:choose>
										<c:when test="${seller.comStatus.equals('Y') }">영업중</c:when>
										<c:when test="${seller.comStatus.equals('S') }">영업 정지</c:when>
										<c:when test="${seller.comStatus.equals('W') }">개점준비중</c:when>
										<c:otherwise>영업 종료</c:otherwise>
									</c:choose>
								</p>
							</li>
							<li class="member-li"><span></span></li>
							<c:if test="${seller.comConfirm=='Y'}"><li class="member-li"><span>매출</span></li></c:if>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>아이디</span><p>${seller.memberId }</p></li>
							<li class="member-li"><span>가입일</span><p>${seller.memberEnroll }</p></li>
							<li class="member-li"><span>개점일</span>
								<p>
									<c:if test="${empty seller.comDate}">미정</c:if>
									<c:if test="${not empty seller.comDate}">${seller.comDate}</c:if>
								</p>
							</li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
			<c:if test="${seller.comConfirm=='Y'}">
				
				<!-- 승인 상태일 때 불러오는 것 -->
				<div class="row">
					<div class="col-md-2"></div>
					<!-- 매출 영역 -->
					<table class="table table-striped col-md-8" id="sellerSalesList">
						<thead>
							<tr>
								<th scope="col">매출번호</th>
								<th scope="col">집계기간</th>
								<th scope="col">매출액</th>
								<th scope="col">주문건</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>2018-12</td>
								<td>11,125,110</td>
								<td>45</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>2018-11</td>
								<td>13,551,181</td>
								<td>62</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>2018-10</td>
								<td>12,458,820</td>
								<td>56</td>
							</tr>
						</tbody>
					</table>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-6"></div>
					<div class="dataTables_paginate paging_simple_numbers col-md-4" id="bootstrap-data-table_paginate">
						<ul class="pagination">
							<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link"><i class="ti-angle-left"></i></a></li>
							<li class="paginate_button page-item active"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
							<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
							<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
							<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
							<li class="paginate_button page-item "><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
							<li class="paginate_button page-item next" id="bootstrap-data-table_next"><a href="#" aria-controls="bootstrap-data-table" data-dt-idx="7" tabindex="0" class="page-link"><i class="ti-angle-right"></i></a></li>
						</ul>
					</div>
					<div class="col-md-4"></div>
				</div>
				
				
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<c:if test="${seller.comConfirm=='Y'}"><li class="member-li"><span style="width:150px">재료 주문 내역</span></li></c:if>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>	
					<!-- 업체 주문 영역  -->
					<table class="table table-striped col-md-8" id="sellerOrderList">
						<thead>
							<tr>
								<th></th>
								<th scope="col">번호</th>
								<th scope="col">주문일자</th>
								<th scope="col">주문내용</th>
								<th scope="col">주문상태</th>
								<th scope="col">정산상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList }" var="order">
								<tr>
									<td><input type="hidden" name="orderNo" value="${order.comNo }">
									<td>${order.rn }</td>
									<td>${order.orderMDate }</td>
									<td>${order.orderList }</td>
									<c:choose>
										<c:when test="${order.orderMStatus ==1}">
											<td>주문 완료
											<button class="btn btn-sm btn-outline-warning" type="button" onclick="orderMStatus();">배송완료</button></td>
										</c:when>
										<c:when test="${order.orderMStatus ==2}">
											<td>배송 완료
											<button class="btn btn-sm btn-outline-warning" disabled type="button"onclick="orderMStatus();">수령 대기중</button></td>
										</c:when>
										<c:otherwise>
											<td>수령 완료</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${order.orderCal=='N' }">
											<td>미정산
											<button class="btn btn-sm btn-outline-warning" type="button" onclik="orderCal();">정산완료</button></td>
										</c:when>
										<c:otherwise>
											<td>정산완료</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-2"></div>
				</div>
				
				
				<!-- 주문 내역 선택 끝 -->
				<!-- 페이징 처리 div -->
				<div class="row">
					<div class="col-md-6"></div>
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
					<div class="col-md-2"></div>
				</div>
				<!-- 페이징 처리 끝 -->
			</c:if>
			<!-- 승인 대기중일 때 불러오는 것 -->
			<c:if test="${seller.comConfirm=='N'}">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
							<ul class="member-ul">
								<li class="member-li"><span>가입일자</span><p>${seller.memberEnroll }</p></li>
								<li class="member-li"><span>점  주</span><p>${seller.memberName }</p></li>
								<li class="member-li"><span>매장 주소</span><p>${seller.comAddress }</p></li>
								<li class="member-li"><span></span></li>
							</ul> 
						</div>
						<div class="col-md-4">
							<ul class="member-ul">
								<li class="member-li"><span>사업자번호</span><p>${seller.comLisenseNo }</p></li>
								<li class="member-li"><span>계약금</span><p>5,000,000</p></li>
								<li class="member-li"><span>계정승인상태</span>
									<p>
										<c:if test="${seller.comConfirm=='N'}">
										<button class="btn btn-outline-warning btn-sm" onclick="confirm()">계정 승인</button>
										</c:if>
									</p></li>
								<li class="member-li"><span></span></li>
							</ul>
						</div>
					<div class="col-sm-1"></div>
				</div>
			</c:if>
			<!-- 끝 -->
			<div class="row">
				<div class="col-md-4">
					<button class="btn btn-outline-secondary" onclick="location.href='sellerList.ad'">목록으로</button>
				</div>
				<div class="col-md-8"></div>	
			</div>
		</div>
	</div>
	</div>
	<!-- 매출 선택 함수 -->
	<script>
		$(function() {
			$("#sellerSalesList").find("td").mouseenter(function() {
				$(this).parent().css({"color" : "#9d9d9d","cursor" : "pointer"});
			}).mouseout(function() {
				$(this).parent().css({"color" : "#212529"});
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				console.log(num);
				location.href="admin.ad?admin=sales/statistics/statisticsDetail";
			});
			
			$("#sellerOrderList").find("td").mouseenter(function() {
				$(this).parent().css({"color" : "#9d9d9d","cursor" : "pointer"});
			}).mouseout(function() {
				$(this).parent().css({"color" : "#212529"});
			}).click(function() {
				var orderMDate=$(this).parent().children().eq(2).text();
				var comNo=$(this).parent().children().eq(0).children().val();
				console.log("sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate);
				location.href="sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate;
			});
		});
		
		function getLatLon(value){
			var geocode = "https://maps.googleapis.com/maps/api/geocode/json?address="+value+"&key=";
	        var tag = "";
	        jQuery.ajax({
	            url: geocode,
	            type: 'POST',
	            async:false,
	           	success: function(myJSONResult){
		            if(myJSONResult.status == 'OK') {
		                var i;
		                
		                for (i = 0; i < myJSONResult.results.length; i++) {
		                  tag += myJSONResult.results[i].geometry.location.lat+",";
		                  tag += myJSONResult.results[i].geometry.location.lng;
		                  
		                  flag="true";
		                }
		            }else{
		            	console.log(myJSONResult);
		            }
		        }
	        }); 
	        return tag;
		}
		
		function confirm(){
			var latlon=getLatLon("${seller.comAddress}");
			var comLL=latlon.split(",");
			var comLat=Number(comLL[1]);
			var comLon=Number(comLL[0]);
			console.log(comLat+"/"+comLon);
			location.href='confirmSeller.ad?comNo='+${seller.comNo}+'&comLat='+comLat+'&comLon='+comLon;
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
