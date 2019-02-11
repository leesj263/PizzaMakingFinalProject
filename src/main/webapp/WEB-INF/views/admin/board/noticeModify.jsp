<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"/>
<style>
	.member-ul .member-li{
		padding:0px;
	}
	.member-li > p{
		width:500px;
	}
</style>
<section>
	<div class="right-panel">
	
		<p>noticeModify.jsp</p>
		<div class="card">
			<div class="card-header col-md-12">
				<h3 class="menu-title">공지사항 수정</h3>
			</div>
			<div class="card-body">
			<form id="noticeModify" action="noticeModify.ad" method="post">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<ul class="member-ul">
							<li class="member-li"><span>분류</span>
								<p>
									<select name="boardType" onChange="showCategory(this.options[this.selectedIndex].value);">
										<option>분류</option>
										<option value="4" <c:if test="${notice.boardType==4}">selected</c:if>>업체공지</option>
										<option value="5" <c:if test="${notice.boardType==5}">selected</c:if>>고객공지</option>
									</select> 
									<select name="boardCate" style="display:;">
										<option value="1" <c:if test="${notice.boardCate==1}">selected</c:if>>안내</option>
										<option value="2" <c:if test="${notice.boardCate==2}">selected</c:if>>공지</option>
										<option value="3" <c:if test="${notice.boardCate==3}">selected</c:if>>경고</option>
										<option value="4" <c:if test="${notice.boardCate==4}">selected</c:if>>이벤트</option>
									</select>
								</p>
							</li>
							<li class="member-li">
								<span>제목</span>
								<input type="hidden" name="boardNo" value="${notice.boardNo }">
								<p>
									<input type="text" name="boardTitle" id="nTitle" class="form-control" value="${notice.boardTitle }">
								</p>
							</li>
							<!-- <li class="member-li"><span>첨부파일</span><p><input type="file" class="form-control" id="nFile" name="nFile"></p></li> -->
						</ul>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-7" id="summernote">
						<textarea rows="15" cols="60" style="resize: none;" class="form-control" id="nContents" name="boardContent">${notice.boardContent}</textarea>
					</div>
					<div class="col-md-3"></div>
				</div>
				
			<br>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>
				<div class="col-md-3">
					<button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#staticModal">목록</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-outline-warning" type="submit" onclick="nModify();">수정</button>
				</form>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
	
	<div class="modal fade" id="staticModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>공지사항 수정 중입니다. 페이지를 이동합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-outline-primary" onclick="nList()">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function showCategory(obj) {
			var category1 = [ "안내", "공지", "경고", "이벤트" ];
			var cateVal=[1, 2, 3, 4];
			var category2 = [ "공지사항", "이벤트" ];
			var $target = $("select[name='boardCate']");
			var data;

			if (obj == 4) {
				data = category1;
			} else if (obj == 5) {
				data = category2;
			}

			$target.empty();
			for (x in data) {
				for(y in cateVal){
					if(x==y){
					var option = "<option value='"+cateVal[y]+"'>" + data[x] + "</option>";
					$target.append(option);
					}
				}
			}
			$target.css("display", "");
		}
		$(function(){
			$("select[name='boardType'] > option").each(function(){
				if(this.val==${notice.boardType}){
					console.log("1");
				 	$(this).attr("selected","selected");
				}
			});
		});
		function nModify() {
			var num=$("input[name='boardNo']").val();
			console.log(num);
		}
		function nList(){
			location.href="noticeList.ad";
		}
	</script>
</section>
<jsp:include page="../common/footer.jsp"/>
