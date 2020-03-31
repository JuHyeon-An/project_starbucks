<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- left side menu -->
	<%@include file="./left.jsp" %>
<div class="col-md-9 order-2">
    <div class="row">
        <div class="col-md-12 mb-3">
            <h2 class="h3 mb-3 text-black">구매내역</h2>
        </div>
        <form class="col-md-12" name="" >
        	<input type="hidden" name="mId2" value="${mId }"  />
            <div class="float-md-left">
                <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        주문상태
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                        <a class="dropdown-item" href="#">입금확인</a>
                        <a class="dropdown-item" href="#">배송준비중</a>
                        <a class="dropdown-item" href="#">배송완료</a>
                    </div>
                </div>

            </div>
            <div class="d-flex">
                <div class="offset-md-6 col-md-6 col-12 mb-3 pr-0">
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
        </form>

    </div>

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
            	<c:forEach var="vo" items="${list }" varStatus="i"  >
	                <tr>
	                    <td class="">
	                        <span id="orderRegDate">${vo.orderregDate }</span>
	                    </td>
	                    <td class="product-thumbnail">
	                        <img src="./fileFolder/${vo.productImg }" alt="Image" class="img-fluid">
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
	                    	<input type="hidden" name="orderStatus_${i.index }" value="${vo.orderStatus }" />
	                    	<c:set var="status" value="${vo.orderStatus }" scope="page"/>
						    <c:if test="${status == 1}">
						        <button type="button" class="btn btn-primary btn-sm  disabled" id="btnCancle_${i.index }">
		                            승인대기
		                        </button>
						    </c:if>
						    <c:if test="${status == 2}">
						        <button type="button" class="btn btn-primary btn-sm" id="btnRegist_${i.index }">
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
    <div class="row">
        <div class="col-md-12 text-center">
            <div class="site-block-27">
                <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active"><span>1</span></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<form id=review name=review method=post>
	<input type='hidden' name='item_code' id='item_code' value='1'/><!-- 아이템번호 -->
	<input type='text' value='${msg }'/>
</form>

    <script>
        $(function () {
            // 취소 요청 alert
            $("#btnCancle").click(function () {
                Swal.fire({
                    title: '주문을 취소하시겠습니까?',
                    text: "확인 버튼을 누르시면 관리자 승인 후 주문 취소가 완료됩니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.value) {
                        Swal.fire(
                            'Deleted!',
                            '관리자에게 주문 취소 요청을 하였습니다.',
                            'success'
                        )
                    }
                })
            });
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
