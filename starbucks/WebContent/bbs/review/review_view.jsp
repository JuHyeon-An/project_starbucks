<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="row border-bottom mb-3">
	<div class="site-section-heading pt-3">
		<h2 class="text-black">How We Started</h2>
	</div>
	<div class="col-md-12 px-0">
		<div class="float-md-left mb-4">
			<span class="" id="">2020-02-29</span>
		</div>
		<div class="d-flex">
			<span class="ml-md-auto" id="">5</span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<div class="col-12">img</div>
		<div class="col-12">내용</div>
	</div>
	<div class="col-12">
		<div class="row">
			<div class="col-12">img</div>
			<div class="col-12">내용</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12"></div>
	<div class="col-12"></div>
</div>
<div class="row">
	<div class="col-12 text-right">
		<button class="btn btn-outline-primary mr-2">수정</button>
		<button class="btn btn-outline-primary mr-2">삭제</button>
		<button id='btnSelect2' class="btn btn-outline-primary">목록</button>
	</div>
</div>
<form id='review' name='review' method='post'>
<input type='text' name='findStr' value='${param.findStr }' /> 
<input type='text' name='nowPage' value='${param.nowPage }' />
</form>
${param.review_postnum }
${param.member_id }
${param.item_code }
${param.review_title }
${param.review_content }
${param.review_like }
${param.review_regdate }
${param.reivew_view }
