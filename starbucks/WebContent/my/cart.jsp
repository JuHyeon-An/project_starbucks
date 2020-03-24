<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../layout/header.jsp" %>
        <!-- Breadcrumb -->
        <div class="bg-light py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-0">
                        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">MyPage </strong>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb END -->

        <!-- Content -->
        <div class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 order-1 mb-5 mb-md-0">
                        <div class="border p-4 rounded mb-4">
                            <h3 class="mb-3 h6 text-uppercase d-block"><a href="./" class=" text-black">MyPage</a></h3>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-1"><a href="./cart.jsp" class="d-flex"><span>장바구니</span></a></li>
                                <li class="mb-1"><a href="./order_list.jsp" class="d-flex"><span>구매내역</span></a></li>
                                <li class="mb-1"><a href="./account.jsp" class="d-flex"><span>회원정보 수정</span></a></li>
                                <li class="mb-1"><a href="./out.jsp" class="d-flex"><span>회원탈퇴</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9 order-2">
                       <div class="row mb-3">
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">장바구니</h2>
                            </div>
                        </div>
                        <div class="row mb-5">
                            <form class="col-md-12" method="post">
                                <div class="site-blocks-table">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="product-checkbox">-</th>
                                                <th class="product-thumbnail">Image</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-total">Total</th>
                                                <th class="product-remove">Remove</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product-checkbox">
                                                    <label class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" type="checkbox" checked="">
                                                        <div class="custom-control-label ml-2"></div>
                                                    </label>
                                                </td>
                                                <td class="product-thumbnail">
                                                    <img src="images/cloth_1.jpg" alt="Image" class="img-fluid">
                                                </td>
                                                <td class="product-name text-left">
                                                    <h2 class="h6 text-black"><a href="">Top Up T-Shirt</a></h2>
                                                </td>
                                                <td>$49.00</td>
                                                <td>
                                                    <div class="input-group input-group-sm" style="max-width: 120px;">
                                                        <div class="input-group-prepend">
                                                            <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                                        </div>
                                                        <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                                        </div>
                                                    </div>

                                                </td>
                                                <td>$49.00</td>
                                                <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                                            </tr>

                                            <tr>
                                                <td class="product-checkbox">
                                                    <label class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" type="checkbox" checked="">
                                                        <div class="custom-control-label ml-2"></div>
                                                    </label>
                                                </td>
                                                <td class="product-thumbnail">
                                                    <img src="images/cloth_1.jpg" alt="Image" class="img-fluid">
                                                </td>
                                                <td class="product-name text-left">
                                                    <h2 class="h6 text-black"><a href="">Top Up T-Shirt</a></h2>
                                                </td>
                                                <td>$49.00</td>
                                                <td>
                                                    <div class="input-group input-group-sm" style="max-width: 120px;">
                                                        <div class="input-group-prepend">
                                                            <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                                        </div>
                                                        <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                                        </div>
                                                    </div>

                                                </td>
                                                <td>$49.00</td>
                                                <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="row mb-5">

                                    <div class="col-12">
                                        <button class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</button>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-9 pl-5">
                                <div class="row justify-content-end">
                                    <div class="col-md-7">
                                        <div class="row">
                                            <div class="col-md-12 text-right border-bottom mb-5">
                                                <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <span class="text-black">Subtotal</span>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <strong class="text-black">$230.00</strong>
                                            </div>
                                        </div>
                                        <div class="row mb-5">
                                            <div class="col-md-6">
                                                <span class="text-black">Total</span>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <strong class="text-black">$230.00</strong>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <button class="btn btn-primary btn-lg py-3 btn-block font-weight-normal" onclick="window.location='./order.jsp'">주문하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- Content END-->

        <%@include file="../layout/footer.jsp" %>