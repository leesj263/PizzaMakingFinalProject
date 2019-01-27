<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp"/>
<style>
	#toppingMod{
		text-align:center;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>modTopping.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">토핑 수정</h3>
			</div>
			<div class="card-body">
				<!-- 토핑 정보 영역 -->
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
						<table class="table table-striped" id="toppingMod">
							<thead>
								<tr>
									<th colspan="2">매입 가격 (1kg)</th>
									<td colspan="2"><input type="text" name="getPrice"></td>
								</tr>
								<tr>
									<th colspan="2">도매 가격 (500g)</th>
									<td colspan="2"><input type="text" name="sellerPrice"></td>
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
									<td><input type="text" name="sWeight"></td>
									<!-- <td rowspan="3">5,000</td>
									<td rowspan="3">6,500</td> -->
									<td><input type="text" name="sPrice"></td>
								</tr>
								<tr>
									<th scope="row" colspan="2">M</th>
									<td><input type="text" name="mWeight"></td>
									<!-- <td>3</td>
									<td>3,000</td> -->
									<td><input type="text" name="mPrice"></td>
								</tr>
								<tr>
									<th scope="row" colspan="2">L</th>
									<td><input type="text" name="lWeight"></td>
									<!-- <td>2</td>
									<td>3,000</td> -->
									<td><input type="text" name="lPrice"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div>
					<div class="col-md-2"></div>
					<div class="col-md-6"></div>	
					<div class="col-md-4">
						<button class="btn btn-outline-secondary" onclick="location.href='admin.ad?admin=sales/menu/toppingList'">목록으로</button>
						<button class="btn btn-outline-warning" onclick="modTopping">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function modTopping(){
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			var num=$("input[name='tno']").val();
			console.log(num);
			location.href="admin.ad?admin=sales/menu/modTopping";
		}
	</script>
</section>
<jsp:include page="../../common/footer.jsp"/>