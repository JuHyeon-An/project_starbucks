<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<div class="row border-bottom mb-3">
	<div class="site-section-heading pt-3">
		<h2 class="text-black">How We Started</h2>
	</div>
	<div class="col-md-12 px-0">
		<div class="float-md-left mb-4">
			<span class="" id="">${vo.review_regdate }</span>
		</div>
		<div class="d-flex">
			<span class="ml-md-auto" id="">조회수${vo.reivew_view }</span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<div class="row border-bottom mb-3">
			<div class="col-12 mb-3">img</div>
			<div class="col-12 mb-3">내용</div>
		</div>
	</div>	
	<div class="col-12">
		<div class="row mb-3">
			<div class="col-12 mb-3">
				<c:set var="imgs" value="${vo.review_imgs }"/>
					<c:forEach var="img" items="${imgs.sys_imgs}">
						${(img==null)? "":"<img width='100px' height='100px' src='/starbucks/review_img/"}${img }${(img==null)? "":"'/>"}
					</c:forEach>
			</div>
			<div class="col-12 mb-3">${vo.review_content }</div>
		</div>
	</div>
</div>
<div class="row border-bottom-bold mb-3">
	<div class="col-2">총 댓글</div>
	<div class="col-10"></div>
</div>
<div class="row border-bottom mb-3">
	<div class="col-12 mb-3">댓글을 다시오.</div>
</div>
<div class="row">
	<div class="col-12 text-right">
		<button id='btnModify' class="btn btn-outline-primary mr-2">수정</button>
		<button id='review_view_btnDelete' class="btn btn-outline-primary mr-2">삭제</button>
		<button id='review_btnSelect' class="btn btn-outline-primary">목록</button>
	</div>
</div>
<form id='review' name='review' method='post'>
	<input type='hidden' name='findStr' value='${param.findStr }' /> 
	<input type='text' name='nowPage' value='${param.nowPage }' />
	<input type='hidden' name='review_postnum' value='${vo.review_postnum }' /> 
</form>



