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
                            <div class="col-md-8 offset-md-2">
                                <h2 class="h3 mb-3 text-black text-center">회원 탈퇴</h2>
                                <ul class="border px-5 py-4">
                                    <li><span class="text-black">탈퇴 후 회원정보가 모두 삭제됩니다.</span>
                                        <br> 메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
                                    <li><span class="text-black">탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</span>
                                        <br>각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.
                                        <br>삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.
                                        <br>(탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)</li>
                                </ul>
                                <p>탈퇴 후에는 게시판의 게시글은 삭제할 수 없으며, 위의 안내 내용에 동의합니다.</p>
                            </div>
                        </div>
                        <div class="col-md-6 offset-md-3">
                            <form class="form-group">
                                <label class="custom-control custom-checkbox mb-3" for="c_create_account" class="text-black" data-toggle="collapse" href="#create_an_account" role="button" aria-expanded="false" aria-controls="create_an_account">
                                    <input class="custom-control-input" type="checkbox" checked="">
                                    <div class="custom-control-label ml-2">안내사항을 모두 동의하며, 이의제기를 하지않습니다.</div>
                                </label>
                                <div class="collapse" id="create_an_account">
                                    <div class="py-2">
                                        <div class="form-group">
                                            <label for="userId" class="text-black">아이디 <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="userNm" name="userNm">
                                        </div>
                                        <div class="form-group">
                                            <label for="userPwd" class="text-black">비밀번호 <span class="text-danger">*</span></label>
                                            <input type="password" class="form-control" id="userId" name="userId">
                                        </div>
                                        <div class="form-group text-center">
                                            <button type="button" class="btn btn-primary min-width-125" id="btnConfirm">탈퇴하기</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Content END-->



        <%@include file="../layout/footer.jsp" %>