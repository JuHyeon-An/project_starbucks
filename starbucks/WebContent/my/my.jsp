<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- left side menu -->
	<%@include file="./left.jsp" %>
	
<div class="col-md-9 order-2">
    <div class="row mb-3">
        <div class="col-md-12">
            <h2 class="h3 text-black border-bottom pb-4 mb-4">MyPage</h2>
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-md-12">

            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-black">이름</span>
                </div>
                <div class="col-md-3">
                    <strong class="text-black">홍길동</strong>
                </div>
                <div class="col-md-3">
                    <span class="text-black">연락처</span>
                </div>
                <div class="col-md-3 text-right">
                    <strong class="text-black">010-0000-000</strong>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-black">이메일</span>
                </div>
                <div class="col-md-3">
                    <strong class="text-black">abc@domain.com</strong>
                </div>
                <div class="col-md-3">
                    <span class="text-black">주소</span>
                </div>
                <div class="col-md-3 text-right">
                    <strong class="text-black">서울특별시 종로구</strong>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-black">보유 포인트</span>
                </div>
                <div class="col-md-3">
                    <strong class="text-black" id="">34,530</strong>
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
                        <tr>
                            <td class="">
                                <span id="orderRegDate">2020-03-02</span>
                            </td>
                            <td class="product-thumbnail">
                                <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2020/02/[11104968]_20200219105812789.jpg" alt="Image" class="img-fluid">
                            </td>
                            <td class="product-name text-left">
                                <a href="" class="text-black" id="itemTitle">Top Up T-Shirt</a>
                            </td>
                            <td>
                                <span id="itemPrice">$49.00</span>
                            </td>
                            <td>
                                <span id="orderNum">2</span>
                            </td>
                            <td>
                                <span class="" id="orderPrice">$49.00</span>
                            </td>
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary btn-sm" id="btnCancle">
                                    취소요청
                                </button>

                            </td>
                        </tr>


                    </tbody>
                </table>
            </div>

        </div>
    </div>
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
</div>