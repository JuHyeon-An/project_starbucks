<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name='notice' id='notice' method='post'>

    <div class="row">
   		<div class="col-md-12 mb-3">
           	<h2 class="h3 mb-3 text-black">공지사항</h2>
        </div>
        <div class="col-md-12">
        		<div class="float-md-left">
            		<div class="dropdown mr-1 ml-md-auto">
                		<button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							공지사항
                    	</button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                    	<a class="dropdown-item" href="review_select.uk?nowPage=1">리뷰</a>
                  </div>
                </div>
         	</div>
             <div class="d-flex">
                <div class="offset-md-6 col-md-6 col-12 mb-3 pr-0">
                    <div class="input-group input-group-sm input-daterange">
                        <input type='text' class="form-control" name='findStr' value='${param.findStr }'/>
                        <div class="input-group-append">
						<input type='button' class="btn btn-primary btn-sm" name='btnSelect' id='btnSelect' value='검색'/>
                        </div>
                    </div>
                </div>
            </div>
         </div>
	</div> <!-- <div class="row"> -->
<input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'/>
<input type='hidden' name='noticeTitle' id='noticeTitle' />
<input type='hidden' name='memberName' id='memberName'/>
<input type='hidden' name='noticeContent' id='noticeContent'/>	
<input type='hidden' name='noticeRegDate' id='noticeRegDate'/>
    <div class="site-blocks-table mb-3">
    <table class="table">
        <thead>
            <tr>
                <th class="">no</th>
                <th class="product-thumbnail">아이디</th>
                <th class="product-name"></th>
                <th class="product-price">제목</th>
                <th class="product-quantity">등록일</th>
                <th class="product-total">조회수</th>
                <th class="product-remove">-</th> 
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="vo" items="${list }">
            <tr onclick="notice_view('${vo.noticeTitle}','${vo.noticeContent }','${vo.noticeRegDate } ')">
                <td class="">
                    <span>${vo.noticePostNum }</span>
                </td>
                <td class="product-thumbnail">
                   <span>${vo.memberId }</span>
                </td>
                <td class="product-name text-left">
                    <span></span>
                </td>
                <td>
                    <span>${vo.noticeTitle }</span>
                </td>
                <td>
                    <span>${vo.noticeRegDate }</span>
                </td>
                <td>
                  	<span>${vo.noticeView }</span>
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
						  <li onclick='goPage(${page.nowPage }-1)'><a href="#">&lt;</a></li>
					  </c:if>
					  
					  <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		                  <li id='here' onclick='goPage(${i })' ${(i==page.nowPage)? "class='active'":""}><a href="#">${i }</a></li>
					  </c:forEach>	
	                  
	                  <c:if test="${page.nowPage<page.totPage }">
		                  <li onclick='goPage(${page.nowPage }+1)'><a href="#">&gt;</a></li>
					  </c:if>
	              </ul>
	          </div>
	      </div>
	  </div>
</form>
