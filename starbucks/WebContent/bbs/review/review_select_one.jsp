<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    

<form name='review' id='review' method='post'> 
    <div class="row">
   		<div class="col-md-12 mb-3">
           	<h2 class="h3 mb-3 text-black">리뷰</h2>
        </div>
        <div class="col-md-12">
        		<div class="float-md-left">
            		<div class="dropdown mr-1 ml-md-auto">
                		<button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							리뷰
                    	</button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                    	<a class="dropdown-item" href="notice_select.uk?nowPage=1">공지사항</a>
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
<input type='text' name='nowPage' id='nowPage' value='${param.nowPage }'/>
<input type='text' name='review_postnum' id='review_postnum' value='${vo.review_postnum }'/>
<input type='text' name='msg' id='msg' value='${msg }'/>


    <div class="site-blocks-table mb-3">
    <table class="table">
        <thead>
            <tr>
                <th class="">no</th>
                <th class="product-thumbnail">아이디</th>
                <th class="product-name">제목</th>
                <th class="product-price">사진</th>
                <th class="product-quantity">등록일</th>
                <th class="product-total">평점</th>
                <th class="product-remove">-</th>
            </tr>
        </thead>
        <tbody>
        	
        	<c:forEach var="vo" items="${list }" varStatus="i">
            <tr>
            <tr onclick="review_view('${vo.review_postnum}')">
                <td class="">
                    <span>${vo.review_postnum }</span>
                </td>
                <td class="product-thumbnail">
                   <span>${vo.member_id }</span>
                </td>
                <td class="product-name text-left">
                    <span>${vo.review_title }</span>
                </td>
                <td>
                	<c:set var="imgs" value="${vo.review_imgs }"/>
					<c:forEach var="img" items="${imgs.sys_imgs}">
						${(img==null)? "":"<img width='100px' height='100px' src='/starbucks/review_img/"}${img }${(img==null)? "":"'/>"}
					</c:forEach>
                </td>
                <td>
                    <span>${vo.review_regdate }</span>
                </td>
                <td>
                  	<span>${vo.review_like }</span>
                </td>
                <td>
                  	<span>${vo.reivew_view }</span>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btn-sm" id="btnCancle">
                   	     삭제
                    </button>
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


