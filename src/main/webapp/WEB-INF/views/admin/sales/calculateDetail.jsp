<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp"/>
<style>
	#calList{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">재료 주문 정보</h3>
			</div>
			<div class="card-body">
				<!-- 업체 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>지점명</span><p>${seller.comName }</p></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>개점일</span><p>${seller.comDate}</p></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<!-- 정산 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>정산 월</span>
								<p>${calOne.orderExpMonth.toString().substring(0,4)}년 ${calOne.orderExpMonth.toString().substring(5,7)}월</p>
							</li>
							<li class="member-li"><span>잔여 정산 금액</span><p>${total }</p></li>
							<li class="member-li"><span></span></li>
							<li class="member-li"><span>주문 내역</span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>정산 기한</span>
								<p id="endDate">${calOne.orderExpMonth }</p>
							</li>
							<li class="member-li"><span>정산 상태</span>
								<p>
									<c:choose>
										<c:when test="${calOne.orderCStatus=='Y' }">정산완료</c:when>
										<c:otherwise>미정산&nbsp; &nbsp;<button class="btn btn-sm btn-outline-warning" onclick="calYes(${calOne.orderExpNo}, ${calOne.comNo })">정산 완료</button></c:otherwise>
									</c:choose>
								</p>	
							</li>
							<li class="member-li"><span></span></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="calList">
					<thead>
						<tr>
							<!-- <th><input type="checkbox"></th> -->
							<th scope="col"></th>
							<th scope="col">주문일자</th>
							<th scope="col">주문내역</th>
							<th scope="col">진행상태</th>
							<th scope="col">금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${calList }" var="cal">
							<tr>
								<td><input type="hidden" name="comNo" value="${cal.comNo}">${cal.rn}</td>
								<td>${cal.orderMDate }</td>
								<td>${cal.orderList }</td>
								<c:choose>
									<c:when test="${cal.orderMStatus ==1}"><td>주문 완료</td></c:when>
									<c:when test="${cal.orderMStatus ==2}"><td>배송 완료</td></c:when>
									<c:otherwise><td>수령 완료</td></c:otherwise>
								</c:choose>
								<td id="price${cal.rn }">${cal.price }</td>
							</tr>
						</c:forEach>
						<tr>
							<th colspan="3">총 액</th>
							<th colspan="2" id="totalPrice"></th>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10"><button class="btn btn-outline-secondary" onclick="location.href='calculateList.ad'">목록</button></div>
	</div>

		<script>
		$(function(){
			var totalPrice=0;
			for(var i=1;i<=${calList.size()};i++){				
				totalPrice+=Number($("#price"+i).text());
			}
			$("#totalPrice").text(totalPrice);
			console.log(totalPrice);
			$("#calList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var orderMDate=$(this).parent().children().eq(1).text();
				var comNo=$(this).parent().children().eq(0).children().val();
				location.href="sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate;
				console.log("sellerOrderDetail.ad?comNo="+comNo+"&orderMDate="+orderMDate);
			});
			var endString=$("#endDate").text();
			var endDate=new Date(endString);
			endDate=new Date(endDate.getYear(), endDate.getMonth()+1, 0);
			$("#endDate").text((endDate.getFullYear()+1900)+"-"+(endDate.getMonth()+1)+"-"+endDate.getDate());
		});
			function calYes(num1, num2){
				$.ajax({
					url:"updateCalculate.ad",
					type:"get",
					async: false,
					data:{orderExpNo:num1,comNo:num2},
					success:function(data){
						console.log(data);
						if(data==1){
							console.log(data);
							alert("정산 처리가 완료되었습니다.");
							location.href='calculateDetail.ad?orderExpNo='+num1+"&comNo="+num2;
						}else{
							console.log(data);
							alert("정산 처리가 실패했습니다. 다시 시도해주세요.");
							location.href='calculateDetail.ad?orderExpNo='+num1+"&comNo="+num2;
						}
					},
					error:function(data){
						alert("통신 실패했습니다. 다시 시도해주세요.");
					}
				});
			}
		</script>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>