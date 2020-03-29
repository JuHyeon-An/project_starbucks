<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- left side menu -->
	<%@include file="./left.jsp" %>
<div class="col-md-9 order-2">
    <div class="row">
        <div class="col-md-12 mb-3">
            <h2 class="h3 mb-3 text-black">구매내역</h2>
        </div>
        <div class="col-md-12">
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
                        <button type="button" class="btn btn-primary btn-sm" id="btnCancle">
                            취소요청
                        </button>
                        <button type="button" class="btn btn-primary btn-sm" id="btnWriteReview">
                            리뷰작성
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
