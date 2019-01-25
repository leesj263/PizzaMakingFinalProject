<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	div.card{
		border:0px;
	}
	div.card-header{
		background:#ffffff;
		border:0px;
	}
</style>
<section class="container">
	<div class="right-panel">
	<p>userList.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">회원목록</h3>
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-md-2"></div>
				<table class="table table-striped col-md-8" id="userList">
					<thead>
						<tr>
							<th scope="col">회원번호</th>
							<th scope="col">ID</th>
							<th scope="col">이름</th>
							<th scope="col">주문횟수</th>
							<th scope="col">최근 주문일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>1</td>
							<td>2018-12-12</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>3</td>
							<td>2018-12-06</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>15</td>
							<td>2019-01-20</td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
	<div class="form-inline col-md-8">
		<form class="search-form">
			<select class="form-control" name="searchUser">
				<option value="name">이름</option>
				<option value="userId">아이디</option>
				<option value="order">주문</option>
			</select> <input class="form-control mr-sm-2" type="text"
				name="searchUserValue" placeholder="Search ..." aria-label="Search">
		</form>
		<button class="search-trigger" onclick="searchUser();">
			<i class="fa fa-search"></i>
		</button>
	</div>
	<script>
		function searchUser() {
			var searchUser = $("select[name='searchUser']").val();
			var searchUserValue = $("input[name='searchUserValue']").val();
			console.log(searchUser + " / " + searchUserValue);
		}
		$(function(){
			$("#userList").find("td").mouseenter(function(){
				$(this).parent().css({"color":"#9d9d9d","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"color":"#212529"});
			}).click(function(){
				var num=$(this).parent().children().eq(0).text();
				console.log(num);
			});
		})
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
