<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />


<style>
#main {
   padding: 50px;
}

.tableBtnDiv {
   align: right;
   margin-left: 750px;
}
</style>
<section>
   <div id="main">

      

      <!-- -------------------------쿠폰 검색---------------------------------- -->
      
      <div class="card-body col-lg-10">
      <div class="card">
               <div class="justify-content-md-cente">
                   <h3>쿠폰 발급하기</h3> 
               </div><hr>
         <table class="table table-bordered">
            <thead>
               <tr>
                  <th scope="col" style="background-color: rgba(0, 0, 0, .03);">
							<div style=" margin-bottom: 10%;">검색조건</div>
				  </th>
                  <th scope="col">
                     <div class="col-12 col-md-3">
                        <select name="select" id="select" class="form-control">
                           <option value="0">이름 검색</option>
                           <option value="1">내용 검색</option>
                        </select>
                     </div>

                     <div class="row form-group">
                        <div class="col-12 col-md-10">
                           <input type="text" id="text-input" name="text-input"
                              placeholder="내용을 입력하세요" class="form-control">
                        </div>
                     </div>
                  </th>
               </tr>
            </thead>
         </table>

         <div class="row justify-content-md-center">
            <button type="button" class="btn btn-outline-secondary btn-lg">
               <i class="fa fa-search"></i>&nbsp;검색
            </button>
         </div>
         </div>
      </div>


      <!-- ------------------------------------------------------------ -->
   <!--    <div class="col-lg-10">
         <div class="card">
            <div class="card-header">
               <strong class="card-title">쿠폰 검색</strong>
            </div>
            <div class="card-body">

               <div class="col-12 col-md-3">
                  <select name="select" id="select" class="form-control">
                     <option value="0">이름 검색</option>
                     <option value="1">내용 검색</option>
                  </select>
               </div>

               <div class="row form-group">
                  <div class="col-12 col-md-10">
                     <input type="text" id="text-input" name="text-input"
                        placeholder="내용을 입력하세요" class="form-control">
                  </div>
               </div>
               <div class="row justify-content-md-center">
                  <button type="button" class="btn btn-outline-secondary btn-lg">
                     <i class="fa fa-search"></i>&nbsp;검색
                  </button>
               </div>
            </div>
         </div>
      </div>
 -->

      <!-- -------------------------발급된 쿠폰 조회----------------------------------- -->

      <div class="col-lg-10" style="margin-top: 100px">
         <div class="card">
             <div class="justify-content-md-cente">
                   <h3>발급된 쿠폰 조회</h3> 
               </div><hr>
            <div class="card-body">
               <table class="table table-striped" width="700px">
                  <thead>
                     <tr>
                        <th scope="col"></th>
                        <th scope="col">쿠폰코드</th>
                        <th scope="col">쿠폰명</th>
                        <th scope="col">할인</th>
                        <th scope="col">생성일</th>
                        <th scope="col">유효기간</th>
                        <th scope="col">발급일</th>
                        <th scope="col">상태</th>

                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th scope="row">1</th>
                        <td>CP00001</td>
                        <td>회원가입쿠폰</td>
                        <td>30%</td>
                        <td>20180115</td>
                        <td>20180120</td>
                        <td>20180118</td>
                        <td>E</td>
                     </tr>
                     <tr>
                        <th scope="row">2</th>
                        <td>CP00005</td>
                        <td>로그인쿠폰</td>
                        <td>50%</td>
                        <td>20190110</td>
                        <td>20190115</td>
                        <td>20190215</td>
                        <td>D</td>
                     </tr>
                     <tr>
                        <th scope="row">3</th>
                        <td>CP00004</td>
                        <td>회원가입쿠폰</td>
                        <td>25%</td>
                        <td>20190415</td>
                        <td>20190523</td>
                        <td>20190514</td>
                        <td>E</td>
                     </tr>
                  </tbody>
               </table>
               <div class="tableBtnDiv">
                  
                  &nbsp;&nbsp;
                  <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal"
							data-target="#delModal">
                     <i class="fa fa-magic"></i>&nbsp; 삭제
                  </button>
               </div>
            </div>
         </div>
      </div>

	<!-- -------------------------삭제버튼 클릭 시 모달 -------------------------------------------->
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p>정말로 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary">예</button>
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>

   </div>
</section>
<jsp:include page="../common/footer.jsp" />

