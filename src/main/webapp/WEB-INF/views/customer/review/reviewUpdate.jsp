<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script> -->
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<style>
#test{
	display: inline-block;
}
</style>




</head>
<body>
	 <%@ include file="/WEB-INF/views/main/menubar.jsp"%> 
	<%-- <% if(loginUser != null){%> --%>
	<div class="outer">
		<br>
		<h1 align="center">피자제작소 후기작성</h1>
		<br> <br>
		<div class="tableArea">
			<form action="<%-- <%= request.getContextPath() %>/insert.bo --%>"
				method="post">
				<table align="center">
					<tr>
						<td><b>제목</b></td>
						<td colspan="3"><input type="text" size="60" name="title">
						</td>				
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>	
					<div id="summernote">
					
					</div>
					<div align="center">
					<span>파일첨부</span>
					<input type="file" size="60" name="title" id="test">
					</div>
					
				<br>
				<div align="center">
					<button class="ui yellow button">등록하기</button>
					<button class="ui grey button">취소하기</button>
				</div>
			</form>
		</div>

	</div>
	<script type="text/javascript">
	$(document).ready(function() {
 		$('#summernote').summernote({
 			height: 300,    
 			width: 500,// set editor height
 			minHeight: null,             // set minimum height of editor
 			maxHeight: null,             // set maximum height of editor
 			focus: true
 			 // set focus to editable area after initializing summernote
 		});
  		$(".note-editor.note-frame.panel.panel-default").css("margin","auto");
	});			
	</script>


</body>
</html>