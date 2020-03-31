<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Breadcrumb -->
<!DOCTYPE html>



<div class="container">
<h3>리뷰</h3>
<table class="table table-stripped col-10 text-center" id="reviews">
    <thead>
        <tr>
            <th>평점</th> <!-- 평점 -->
            <th>제목</th>
            <th>아이디</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>

    
        <c:forEach var="rVo" items="${listR }">
            <!-- 평점 기준 별표시 출력 -->
            <tr  onclick="review_view('${rVo.review_postnum}')">
                <td>${rVo.review_like }/5</td>
                <td>${rVo.review_title }</td>
                <td>${rVo.member_id }</td>
                <td>${rVo.review_regdate }</td>
                <td>${rVo.reivew_view }</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<form id='review' method='post' >
	<input type="hidden" name="review_postnum" id="review_postnum" />
	<input type="hidden" name="nowPage" id="nowPage" />
	<input type='hidden' name='pd_findStr' id='pd_findStr'/>
</form>
</div>
    <div class="row">
	      <div class="col-md-12 text-center">
	          <div class="site-block-27">
	              <ul>
	             	  <c:if test="${page.nowPage >1}">
						  <li onclick='goPageR(${page.nowPage }-1)'><a href="#">&lt;</a></li>
					  </c:if>
					  
					  <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		                  <li id='here' onclick='goPageR(${i })' ${(i==page.nowPage)? "class='active'":""}><a href="#">${i }</a></li>
					  </c:forEach>		
	                  
	                  <c:if test="${page.nowPage<page.totPage }">
		                  <li onclick='goPageR(${page.nowPage }+1)'><a href="#">&gt;</a></li>
					  </c:if>
	              </ul>
	          </div>
	      </div>
	  </div>


<script>
let review_view=function(review_postnum){
	$('#review_postnum').val(review_postnum);
	$('#review').attr('action','review_view.uk').submit();
}
let goPageR=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#review').attr('action','item_view.pl').submit();
}

</script>

 
    
