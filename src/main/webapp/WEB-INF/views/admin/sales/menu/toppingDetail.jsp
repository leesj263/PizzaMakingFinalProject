<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp"/>
<style>
	#toppingDetail{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>toppingDetail.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">토핑 상세보기</h3>
			</div>
			<div class="card-body">
				<!-- 주문 정보 영역 -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li">
								<span>토핑 번호</span><p>2521</p>
								<input type="hidden" name="tno" value="2521">
							</li>
							<li class="member-li"><span></span></li>
						</ul> 
					</div>
					<div class="col-md-4">
						<ul class="member-ul">
							<li class="member-li"><span>토핑 명</span><p>페퍼로니</p></li>
							<li class="member-li"><span></span></li>
						</ul>
					</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-9">
						<table class="table table-striped" id="toppingDetail">
							<thead>
								<tr>
									<th colspan="2">매입 가격 (1kg)</th>
									<td colspan="2">28,500</td>
								</tr>
								<tr>
									<th colspan="2">도매 가격 (500g)</th>
									<td colspan="2">17,000</td>
								</tr>
								<tr>
									<th scope="col" colspan="2">판매 구분</th>
									<th scope="col">중량</th>
									<th scope="col">판매가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" colspan="2">S</th>
									<td>20g</td>
									<!-- <td rowspan="3">5,000</td>
									<td rowspan="3">6,500</td> -->
									<td>800</td>
								</tr>
								<tr>
									<th scope="row" colspan="2">M</th>
									<td>40g</td>
									<!-- <td>3</td>
									<td>3,000</td> -->
									<td>1,500</td>
								</tr>
								<tr>
									<th scope="row" colspan="2">L</th>
									<td>60g</td>
									<!-- <td>2</td>
									<td>3,000</td> -->
									<td>2,500</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div>
					<div class="col-md-2"></div>
					<div class="col-md-5"></div>	
					<div class="col-md-5">
						<button class="btn btn-outline-secondary" onclick="location.href='admin.ad?admin=sales/menu/toppingList'">목록으로</button>
						<button class="btn btn-outline-warning" onclick="modTopping()">수정</button>
						<button class="btn btn-outline-danger" data-toggle="modal" data-target="#staticModal">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true"data-backdrop="static">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<p>[     ] 토핑을 정말 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-outline-primary" onclick="deleteTopping()">Confirm</button>
					</div>
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