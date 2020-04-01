<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script src="/starbucks/js/uk.js"></script> 


<form id='review' name='review' method="post" enctype="multipart/form-data">
  <div class="p-3 p-lg-5 border">
    <div class="form-group row">
      <div class="col-md-6">
      	<h2 class="text-black">${ydVo.item_title }</h2>
      	<span>${ydVo.item_content }</span>
      	<img src='/starbucks/fileFolder/${ydVo.item_mainimg }' style='max-width:300px; max-height:300px;'/>
      </div>
      <div class="col-md-6">
<!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 -->
        <header class='header text-center' id="reviewHeader">
    <h3 class="text-black">제품 리뷰를 등록해주세요.<span class="text-danger">*</span></h3>
  <p>귀하의 소중한 의견은 저희에게 매우 중요합니다. <b>Starbucks korea</b></p>
</header>
<section class='rating-widget'>
  <!-- Rating Stars Box -->
  <div class='rating-stars text-center'>
    <ul id='stars'>
      <li class='star' title='Poor' data-value='1' id='star1'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='Fair' data-value='2' id='star2'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='Good' data-value='3' id='star3'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='Excellent' data-value='4' id='star4'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='WOW!!!' data-value='5' id='star5'>
        <i class='fa fa-star fa-fw'></i>
      </li>
    </ul>
  </div>
  <div class='success-box p-3'>
    <div class='clearfix'></div>
    <img alt='tick image' width='32' src='data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0MjYuNjY3IDQyNi42NjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQyNi42NjcgNDI2LjY2NzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxwYXRoIHN0eWxlPSJmaWxsOiM2QUMyNTk7IiBkPSJNMjEzLjMzMywwQzk1LjUxOCwwLDAsOTUuNTE0LDAsMjEzLjMzM3M5NS41MTgsMjEzLjMzMywyMTMuMzMzLDIxMy4zMzMgIGMxMTcuODI4LDAsMjEzLjMzMy05NS41MTQsMjEzLjMzMy0yMTMuMzMzUzMzMS4xNTcsMCwyMTMuMzMzLDB6IE0xNzQuMTk5LDMyMi45MThsLTkzLjkzNS05My45MzFsMzEuMzA5LTMxLjMwOWw2Mi42MjYsNjIuNjIyICBsMTQwLjg5NC0xNDAuODk4bDMxLjMwOSwzMS4zMDlMMTc0LjE5OSwzMjIuOTE4eiIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K'/>
    <div class='text-message'></div>
    <div class='clearfix'></div>
  </div>
</section>
<!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 --><!-- 여기 -->
      </div>
    </div>
    <div class="form-group row">
      <div class="col-md-12">
        <label for="review_title" class="text-black">제목 <span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="review_title" name="review_title" oninvalid="alert('제목을 입력하세요!');" value='${vo.review_title }' >
      </div>
    </div>
    <div class="form-group row">
      <div class="col-md-12">
        <label for="review_content" class="text-black">본문 내용<span class="text-danger">*</span> </label>
        <textarea name="review_content" id="review_content" cols="30" rows="7" class="form-control" >${vo.review_content }</textarea>
      </div>
    </div>

    <div class="form-group row">
      <div class="col-md-12">
      <label for="review_content" class="text-black">Image</label>
        <div class="border p-3 " id='board' >
       		<c:set var="imgs" value="${vo.review_imgs }"/>
			<c:forEach var="img" items="${imgs.sys_imgs}" varStatus="i">
				<c:if test="${!empty img }">
					<input type='hidden' id='target' name='target' value='${img }'/>
					<input type='hidden' id='ggg' name='sys_img${i.count } value='${img }'/>
				</c:if>
			</c:forEach>
        </div>
      </div>
    </div>
    <div class="form-group row">
      <div class="col-lg-6">
        <input type="button" id='review_btnUpdate' class="btn btn-primary btn-lg btn-block" value="Update">
      </div>
      <div class="col-lg-6">
        <input type="button" id='review_btnSelect' class="btn btn-primary btn-lg btn-block" value="Cancel">
      </div>
    </div>
  </div>
  <input type='hidden' id='member_id' name='member_id' value='${mId }'/>
  <input type='hidden' id='review_like' name='review_like' value='${vo.review_like }'/> 
  <input type='hidden' id='item_code' name='item_code' value='MG200330-93'/>
  <input type='hidden' id='review_postnum' name='review_postnum' value='${vo.review_postnum}'/>
  <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'/>
  <input type='hidden' name='findStr' id='findStr' value='${param.findStr }'/>
</form>
<script>
modify_addImgs();
</script>