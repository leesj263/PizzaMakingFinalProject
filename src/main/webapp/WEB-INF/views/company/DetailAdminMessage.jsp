<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#backBtn {
	position: relative;
	left: 800px
}
</style>
</head>
<body>
	<jsp:include page="companyMenubar.jsp"></jsp:include>

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>


		<div class="col-md-4" style="margin: 50px">
			<div class="card">
				<table style="background: white; width: 1000px;">
					<tr>
						<td colspan="6"
							style="font-size: 1.4em; padding-top: 10px; background: lightgray;"><div
								class="card-header">
								<strong class="card-title">${ detailMessage.boardTitle}</strong>
							</div></td>

					</tr>
					<tr style="height: 50px">
						<td width="7%" align="right"><b>분류</b>&nbsp;&nbsp;&nbsp;</td>
						<c:if test="${detailMessage.boardCateG == 1 }">
							<td width="10%">안내</td>
						</c:if>
						<c:if test="${detailMessage.boardCateG == 2 }">
							<td width="10%">공지</td>
						</c:if>
						<c:if test="${detailMessage.boardCateG == 3 }">
							<td width="10%">경고</td>
						</c:if>
						<c:if test="${detailMessage.boardCateG == 4 }">
							<td width="10%">이벤트</td>
						</c:if>

						
						<td width="7%" align="right"><b>게시일</b>&nbsp;&nbsp;&nbsp;</td>
						<td width="15%">${ detailMessage.boardDate}</td>
						<td width="7%" align="right"><b>작성자</b>&nbsp;&nbsp;&nbsp;</td>
						<td>관리자</td>
					</tr>
					<tr style="vertical-align: top">
						<td colspan="6"></td>
					</tr>
					<tr style="width: 90%; height: 500px; vertical-align: top;">
						<td colspan="6"><div class="card-body">
								<p class="card-text">
									<c:out value="${ detailMessage.boardContent}"></c:out>
								</p>
							</div></td>
					</tr>
				</table>


			</div>
			<button id="backBtn" type="button" class="btn btn-primary"
				onclick="location.href='goMain.com?memberNo=${sessionScope.loginUser.memberNo }'">
				<i class="fa fa-mail-forward"></i>&nbsp; 돌아가기
			</button>
		</div>


	</div>

</body>
</html>