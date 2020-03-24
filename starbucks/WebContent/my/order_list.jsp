<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../layout/header.jsp" %>
        <!-- Breadcrumb -->
        <div class="bg-light py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-0">
                        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">MyPage</strong>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb END -->

        <!-- Content -->
        <div class="site-section">
            <div class="container">
                <div class="row mb-5">
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
                                <h2 class="h3 mb-3 text-black">구매내역</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-md-6 col-md-6 col-12 mb-3">
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
                </div>
            </div>
        </div>
        <!-- Content END-->

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
                        confirmButtonText: '확인'
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
        <%@include file="../layout/footer.jsp" %>