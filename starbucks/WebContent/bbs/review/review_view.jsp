<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<div class="row border-bottom mb-3">
	<div class="site-section-heading pt-3">
		<h2 class="text-black">${ydVo.item_title }</h2>
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
<div class="row  mb-3">
	<div class="col-12">
		<div class="row border-bottom mb-3">
			<div class="col-12 mb-3"><img src='/starbucks/fileFolder/${ydVo.item_mainimg }' style='max-width:300px; max-height:300px;'/></div>
			<div class="col-12 mb-3">${ydVo.item_content }</div>
		</div>
	</div>	
	<div class="col-12">
		<div class="row border-bottom mb-3">
			<div class="col-12 mb-3">
				<c:set var="imgs" value="${vo.review_imgs }"/>
					<c:forEach var="img" items="${imgs.sys_imgs}">
						${(img==null)? "":"<img width='180px' height='180px' src='/starbucks/review_img/"}${img }${(img==null)? "":"'/>"}
					</c:forEach>
			</div>
			<div class="col-12 mb-3">${vo.review_content }</div>
		</div>
	</div>
</div>
<div class="row  mb-3">
	<div class="col-12 text-right">
		<button id='btnModify' class="btn btn-outline-primary mr-2 noLogin">수정</button>
		<button id='review_view_btnDelete' class="btn btn-outline-primary mr-2 noLogin">삭제</button>
		<button id='review_btnSelect' class="btn btn-outline-primary">목록</button>
	</div>
</div>
<!-- <div class="row  mb-3">
	<div class="col-2">총 댓글</div>
	<div class="col-10"></div>
</div>
<div class="row  mb-3">
	<div class="col-12 mb-3">댓글을 다시오.</div>
</div> -->
<form id='review' name='review' method='post'>
	<input type='hidden' name='findStr' value='${param.findStr }' /> 
	<input type='hidden' name='nowPage' value='${param.nowPage }' />
	<input type='hidden' name='item_code' value='${param.item_code }' /> 
	<input type='hidden' name='review_postnum' value='${vo.review_postnum }' /> 
	<input type='hidden' name='mId' id='mId' value='${mId }' />
	<input type='hidden' name='member_id' id='member_id' value='${vo.member_id }' />
	<input type='hidden' name='sort' id='sort' value='${param.sort }'/>
</form>



