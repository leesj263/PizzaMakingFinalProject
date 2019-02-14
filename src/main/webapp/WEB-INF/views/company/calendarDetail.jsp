<!doctype html>
<%@page import="com.kh.pmfp.company.model.vo.CompanyBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@   taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="companyMenubar.jsp"></jsp:include>

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="companyHeader.jsp"></jsp:include>

		<div class="col-lg-6">
			<div class="card">
				<div class="card-header">
					<strong>Validation states</strong> with optional icons<em>(deprecated)</em>
				</div>
				<div class="card-body card-block">
					<div class="has-success form-group">
						<label for="inputSuccess2i" class=" form-control-label">Input
							with success</label><input type="text" id="inputSuccess2i"
							class="form-control-success form-control">
					</div>
					<div class="has-warning form-group">
						<label for="inputWarning2i" class=" form-control-label">Input
							with warning</label><input type="text" id="inputWarning2i"
							class="form-control-warning form-control">
					</div>
					<div class="has-danger has-feedback form-group">
						<label for="inputError2i" class=" form-control-label">Input
							with error</label><input type="text" id="inputError2i"
							class="form-control-danger form-control">
					</div>
				</div>
			</div>
		</div>

	</div>

	<script
		src="${contextPath }/resources/companyCss/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="${contextPath }/resources/companyCss/vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>
</body>
</html>