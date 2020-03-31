<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-3 order-1 mb-5 mb-md-0">
    <div class="border p-4 rounded mb-4">
        <h3 class="mb-3 h6 text-uppercase d-block"><a href="my.my?mId2=${mId }" class=" text-black">MyPage</a></h3>
        <ul class="list-unstyled mb-0">
            <li class="mb-1"><a href="cart.my?mId2=${mId }" class="d-flex"><span>장바구니</span></a></li>
            <li class="mb-1"><a href="orderList.my?mId2=${mId }" class="d-flex"><span>주문내역</span></a></li>
            <li class="mb-1"><a href="account.my?mId2=${mId }" class="d-flex"><span>회원정보 수정</span></a></li>
            <li class="mb-1"><a href="out.my?mId2=${mId }" class="d-flex"><span>회원탈퇴</span></a></li>
        </ul>
    </div>
</div>