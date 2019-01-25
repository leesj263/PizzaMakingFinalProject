<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<style>
	.member-li > p{
		width:500px;
	}
	.form-control > textarea{
		width:85%;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>noticeWrite.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">공지사항 작성</h3>
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<ul class="member-ul">
						<li class="member-li"><span>제목</span><p><input type="text" class="form-control" placeholder="제목을 입력하세요"></p></li>
						<li class="member-li"><span>첨부파일</span><p><input type="file" class="form-control"></p></li>
					</ul> 
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" id="summernote">
					<textarea rows="15" cols="60" class="form-control" placeholder="내용을 입력하세요"></textarea>
				</div>				
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"></div>
				<div class="col-md-2"></div>
			</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>