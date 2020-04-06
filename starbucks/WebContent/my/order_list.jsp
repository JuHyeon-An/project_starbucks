<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- left side menu -->
	<%@include file="./left.jsp" %>
<div class="col-md-9 order-2">
    <div class="row">
        <div class="col-md-12 mb-3">
            <h2 class="h3 mb-3 text-black">주문내역</h2>
        </div>
        <form class="col-md-12" name="review" id='review' method='post' >
        	<input type="hidden" name="mId2" id="mId" value="${mId }"  />
        	<input type="hidden" name="selectedStatus" id="selectedStatus" value="0" />
            <div class="float-md-left">
                <div class="dropdown mr-1 ml-md-auto mb-3">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle btnOrderSort" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <c:choose>
                        	<c:when test="${param.selectedStatus == 0 }">전체</c:when>
                        	<c:when test="${param.selectedStatus == 1 }">주문취소</c:when>
                        	<c:when test="${param.selectedStatus == 2 }">승인대기</c:when>
                        	<c:when test="${param.selectedStatus == 3 }">주문완료</c:when>
                        </c:choose> 
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                        <a class="dropdown-item" id="status00" href="#" onclick="orderListSort('0');">전체</a>
                        <a class="dropdown-item" id="status01" href="#" onclick="orderListSort('1');">주문취소</a>
                        <a class="dropdown-item" id="status02" href="#" onclick="orderListSort('2');">승인대기</a>
                        <a class="dropdown-item" id="status03" href="#" onclick="orderListSort('3');">주문완료</a>
                    </div>
                </div>

            </div>
            <div class="d-flex">
                <div class="offset-md-6 col-md-6 col-12 mb-3 pr-0 d-none">
                    <div class="input-group input-group-sm input-daterange">
                        <input type="text" class="form-control" value="">
                        <div class="input-group-text py-0">to</div>
                        <input type="text" class="form-control" value="">
                        <div class="input-group-append">
                            <button class="btn btn-primary btn-sm" type="button" id="button-addon2">검색</button>
                        </div>
                    </div>
                </div>
            </div>
			<input type="hidden" name="cancleSerial" id="cancleSerial" />
			<input type='hidden' id='msg' name='msg' value='${msg }'/>
			<input type='hidden' id='reviewItemCode' name='reviewItemCode'/>
			<input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'/>
        </form>

    </div>

    <div class="site-blocks-table mb-3">
        <table class="table table-bordered">
            <thead>
                <tr>
                	<th class="">주문번호</th>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-total">Total</th>
                    <th class="product-remove">-</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="vo" items="${list }" varStatus="i"  >
	                <tr>
	                	<td class="">
	                        <span id="orderNum_${i.index }">${vo.orderNumber }</span>
	                    </td>
	                    <td class="product-thumbnail">
	                        <img src="/starbucks/fileFolder/${vo.productImg }" alt="Image" class="img-fluid">
	                    </td>
	                    <td class="product-name text-left">
	                        <a href="" class="text-black" id="itemTitle">${vo.itemTitle }</a>
	                    </td>
	                    <td>
	                        <span id="itemPrice">${vo.price }</span>
	                    </td>
	                    <td>
	                        <span id="orderNum">${vo.orderNum }</span>
	                    </td>
	                    <td>
	                        <span class="" id="orderPrice">${vo.orderPrice }</span>
	                    </td>
	                    <td>
	                    	<input type="hidden" name="serial_${i.index }" id="serial_${i.index }" value="${vo.serial }" />
	                    	<input type="hidden" name="orderStatus_${i.index }" value="${vo.orderStatus }" />
	                    	<input type='hidden' name='itemCode' id='itemCode' value='${vo.itemCode }'/>
	                    	<input type='hidden' name='cnt' id='cnt' value='${vo.itemCode }'/>
	                    	<c:set var="status" value="${vo.orderStatus }" scope="page"/>
						    <c:if test="${status == 1}">
						        <button type="button" class="btn btn-primary btn-sm  disabled" id="btnCancle_${i.index }">
		                            승인대기
		                        </button>
						    </c:if>
						    <c:if test="${status == 2}">
						        <button type="button" class="btn btn-primary btn-sm" id="btnCancle_${i.index }" name='' onclick="orderCancle(${i.index});">
		                            취소요청
		                        </button>
						    </c:if>
						    <c:if test="${status == 3}">
						        <button type="button" class="btn btn-primary btn-sm" id="btnWrite" name="btnWrite">
                                              리뷰작성
		                        </button>
						    </c:if>
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
					<li onclick='orderListPageNav(${page.nowPage }-1)'><a href="#">&lt;</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
					<li id='here' onclick='orderListPageNav(${i }, "${mId }")' ${(i==page.nowPage)? "class='active'":""}><a href="#">${i }</a></li>
					</c:forEach>		
					
					<c:if test="${page.nowPage<page.totPage }">
					<li onclick='orderListPageNav(${page.nowPage }+1)'><a href="#">&gt;</a></li>
					</c:if>
	        	</ul>
            </div>
        </div>
    </div>
</div>

    <script>
        $(function () {
            // datepicker
            $('.input-daterange input').each(function () {
                //$(this).datepicker('clearDates');
                $(this).datepicker({
                    zIndexOffset: '2000'
                });

                //zIndexOffset
            });
        });
        
        
        
        
    	
    </script>
