<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- left side menu -->
	<%@include file="./left.jsp" %>
	
<div class="col-md-9 order-2">
    <div class="row mb-3">
        <div class="col-md-12">
            <h2 class="h3 text-black border-bottom pb-4 mb-4">MyPage</h2>
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-md-12 word-keep-all">

            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-black">이름</span>
                </div>
                <div class="col-md-3">
                    <strong class="text-black">${vo.mName }</strong>
                </div>
                <div class="col-md-3">
                    <span class="text-black">연락처</span>
                </div>
                <div class="col-md-3 text-right">
                    <strong class="text-black">${vo.phone }</strong>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-black">이메일</span>
                </div>
                <div class="col-md-3">
                    <strong class="text-black">${vo.email }</strong>
                </div>
                <div class="col-md-3">
                    <span class="text-black">주소</span>
                </div>
                <div class="col-md-3 text-right">
                    <strong class="text-black">${vo.addr1 } ${vo.addr2 }</strong>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-black">보유 포인트</span>
                </div>
                <div class="col-md-3">
                    <strong class="text-black" id="">${vo.savedMoney }</strong>
                </div>
                <div class="col-md-3">
                    <span class="text-black">리뷰</span>
                </div>
                <div class="col-md-3 text-right">
                    <strong class="text-black"><a href="">5</a></strong>
                </div>
                <div class="col-12 border-bottom mt-5 mb-4"></div>
            </div>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-12">
            <h2 class="h3 text-black pb-4 mb-4">최근 구매내역</h2>
        </div>
        <form class="col-md-12" name="latestOrderList" id='latestOrderList' method='post' >
        	<input type="hidden" name="mId2" id="mId" value="${mId }"  />
        	<input type="hidden" name="selectedStatus" id="selectedStatus" value="0" />
			<input type="hidden" name="cancleSerial" id="cancleSerial" />
			<input type='hidden' id='msg' name='msg' value='${msg }'/>
			<input type='hidden' id='reviewItemCode' name='reviewItemCode'/>
			<input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'/>
        </form>
        <div class="col-md-12">
            <div class="site-blocks-table mb-3">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="">주문일자</th>
                            <th class="product-thumbnail">Image</th>
                            <th class="product-name">Product</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                            <th class="product-total">Total</th>
                            <th class="product-remove">-</th>
                        </tr>
                    </thead>
                    <tbody>
                         <c:forEach var="orderVo" items="${list }" varStatus="i" >
			                <tr>
			                    <td class="">
			                        <span id="orderRegDate_${i.index }">${orderVo.orderregDate }</span>
			                    </td>
			                    <td class="product-thumbnail">
			                        <img src="/starbucks/fileFolder/${orderVo.productImg }" alt="Image" class="img-fluid">
			                    </td>
			                    <td class="product-name text-left">
			                        <a href="" class="text-black" id="itemTitle_${i.index }">${orderVo.itemTitle }</a>
			                    </td>
			                    <td>
			                        <span id="itemPrice_${i.index }">${orderVo.price }</span>
			                    </td>
			                    <td>
			                        <span id="orderNum_${i.index }">${orderVo.orderNum }</span>
			                    </td>
			                    <td>
			                        <span class="" id="orderPrice_${i.index }">${orderVo.orderPrice }</span>
			                    </td>
			                    <td>
			                    	<input type="hidden" name="orderStatus_${i.index }" value="${orderVo.orderStatus }" />
			                    	<c:set var="status" value="${orderVo.orderStatus }" scope="page"/>
								    <c:if test="${status == 1 || status == 2}">
								        <button type="button" class="btn btn-primary btn-sm" id="btnCancle_${i.index }">
				                            취소요청
				                        </button>
								    </c:if>
								    <c:if test="${status == 3}">
								        <button type="button" class="btn btn-primary btn-sm" id="btnRegist_${i.index }">
				                            리뷰작성
				                        </button>
								    </c:if>
			                    </td>
			                </tr>
						</c:forEach>

                    </tbody>
                </table>
            </div>
            <!-- 
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
		     -->
        </div>
    </div>
    
    <!-- 
    <div class="row mb-3">
        <div class="col-md-12">
            <h2 class="h3 text-black pb-4 mb-4">내가 쓴 리뷰</h2>
        </div>
        <div class="col-md-12">
            <ul class="list-unstyled">
                <li></li>
            </ul>

        </div>
    </div>
     -->
    <form action="">
    	<input type="hidden" name="mId2" value="${mId }" />
    </form>
</div>