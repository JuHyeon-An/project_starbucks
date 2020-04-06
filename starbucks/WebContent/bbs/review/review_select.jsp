<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
<div id='star_jax'>
<form name='review' id='review' method='post'> 
    <div class="row">
   		<div class="col-md-12 mb-3">
           	<h2 class="h3 mb-3 text-black">리뷰</h2>
        </div>
        <div class="col-md-12">
        <div class="float-md-left">
            		<div class="dropdown mr-1 ml-md-auto">
                		<button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                			<c:choose>
                				<c:when test="${param.item_code == ''|| param.sort == null}">카테고리</c:when>
                				<c:when test="${param.item_code == '1'}">머그</c:when>
                				<c:when test="${param.item_code == '2'}">글라스</c:when>
                				<c:when test="${param.item_code == '3'}">텀블러</c:when>
                				<c:when test="${param.item_code == '4'}">보온병</c:when>
                				<c:when test="${param.item_code == '5'}">액세서리</c:when>
                				<c:when test="${param.item_code == '6'}">커피용품/원두</c:when>
                			</c:choose>
                    	</button>
	                  	<div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
	                    	<a class="dropdown-item" href="#" onclick="kategorie()">전체</a>
	                    	<a class="dropdown-item" href="#" onclick="kategorie(1)">머그</a>
	                    	<a class="dropdown-item" href="#" onclick="kategorie(2)">글라스</a>
	                    	<a class="dropdown-item" href="#" onclick="kategorie(3)">텀블러</a>
	                    	<a class="dropdown-item" href="#" onclick="kategorie(4)">보온병</a>
	                    	<a class="dropdown-item" href="#" onclick="kategorie(5)">액세서리</a>
	                    	<a class="dropdown-item" href="#" onclick="kategorie(6)">커피용품/원두</a>
	                  </div>
                </div>
         	</div>
        		<div class="float-md-left">
            		<div class="dropdown mr-1 ml-md-auto">
                		<button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                				<c:choose>
                					<c:when test="${param.sort == ''||param.sort ==null}">최신 날짜 순</c:when>
                					<c:when test="${param.sort == 'review_view'}">조회순</c:when>
                					<c:when test="${param.sort == 'review_like'}">별점순</c:when>
                				</c:choose>
                    	</button>
	                  	<div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
	                    	<a class="dropdown-item" href="#" onclick="sort()">최신 날짜 순</a>
	                    	<a class="dropdown-item" href="#" onclick="sort('review_view')">조회순</a>
	                    	<a class="dropdown-item" href="#" onclick="sort('review_like')">별점순</a>
	                  </div>
                </div>
         	</div>
        		
             <div class="d-flex">
                <div class="offset-md-6 col-md-6 col-12 mb-3 pr-0">
                    <div class="input-group input-group-sm input-daterange">
                        <input type='text' class="form-control" name='findStr' value='${param.findStr }'/>
                        <div class="input-group-append">
						<input type='button' class="btn btn-primary btn-sm" name='review_btnSelect' id='review_btnSelect' value='검색'/>
                        </div>
                    </div>
                </div>
            </div>
         </div>
	</div> <!-- <div class="row"> -->
<input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'/>
<input type='hidden' name='review_postnum' id='review_postnum' value='${vo.review_postnum }'/>
<input type='hidden' name='item_code' id='item_code' value='${param.item_code }'/>
<input type='hidden' name='sort' id='sort' value='${param.sort }'/>
<input type='hidden' name='msg' id='msg' value='${msg }'/>


    <div class="site-blocks-table mb-3">
    <table class="table">
        <thead>
            <tr>
                <th class="product-no">no</th>
                <th class="product-img">사진</th>
                <th class="product-title">제목</th>
                <th class="product-like">평점</th>
                <th class="product-id">아이디</th>
                <th class="product-date">등록일</th>
                <th class="site-section">조회수</th>
            </tr>
        </thead>
        <tbody>
        	
        	<c:forEach var="vo" items="${list }" varStatus="i">
            <tr>
            <tr>
                <td class="">
                    <a onclick="review_view('${vo.review_postnum}','${vo.item_code }')" href="#">${vo.review_postnum }</a>
                </td>
                <td>
                	<!-- 사진-->
                	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner">
					    
				   	 	<c:set var="imgs" value="${vo.review_imgs }"/>
						<c:forEach var="img" items="${imgs.sys_imgs}">
							${(img==null)? "":"<div class='carousel-item'><img class='d-block ' src='/starbucks/review_img/"}${img }${(img==null)? "":"'/></div>"}
						</c:forEach>
					  <!-- 화살표 --> 
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					    <i class="fa fa-angle-left fa-3x text-gray"></i>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					   <i class="fa fa-angle-right fa-3x text-gray"></i>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
                	<!-- 사진 예전버전 -->
                	<%-- <c:set var="imgs" value="${vo.review_imgs }"/>
					<c:forEach var="img" items="${imgs.sys_imgs}">
						${(img==null)? "":"<img width='100px' height='100px' src='/starbucks/review_img/"}${img }${(img==null)? "":"'/>"}
					</c:forEach> --%>
                </td>
                <td class="product-name text-left">
                    <a onclick="review_view('${vo.review_postnum}','${vo.item_code }')" href="#">${vo.review_title }</a>
                    
                </td>
                
                <td>
					 <!-- Rating Stars Box -->
                	<input type='hidden' name='sc' value='${vo.review_like }'/>
					   <div class='rating-stars text-center select_star' > 
					    <ul id='starss' >
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
                </td>
                <td class="product-thumbnail">
                   <a onclick="review_view('${vo.review_postnum}','${vo.item_code }')" href="#">${vo.member_id }</a>
                </td>
                <td>
                    <a onclick="review_view('${vo.review_postnum}','${vo.item_code }')" href="#">${vo.review_regdate }</a>
                </td>
                <td>
                  	<a onclick="review_view('${vo.review_postnum}','${vo.item_code }')" href="#">${vo.reivew_view }</a>
                </td>
            </tr>
            	
            </c:forEach>
        </tbody>
    </table>		

</div>
    <div class="row">
	      <div class="col-md-12 text-center">
	          <div class="site-block-27">
	              <ul>
	             	  <c:if test="${page.nowPage >1}">
						  <li onclick='goPage2(${page.nowPage }-1)'><a href="#">&lt;</a></li>
					  </c:if>
					  
					  <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		                  <li id='here' onclick='goPage2(${i })' ${(i==page.nowPage)? "class='active'":""}><a href="#">${i }</a></li>
					  </c:forEach>		
	                  
	                  <c:if test="${page.nowPage<page.totPage }">
		                  <li onclick='goPage2(${page.nowPage }+1)'><a href="#">&gt;</a></li>
					  </c:if>
	              </ul>
	          </div>
	      </div>
	  </div>
</form>
</div>
<script>
$(function(){
	$(".carousel-item:first-child").addClass("active");
})
</script>
