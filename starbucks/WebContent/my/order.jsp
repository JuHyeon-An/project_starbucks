<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%   request.setCharacterEncoding("UTF-8");  %>
        <!-- left side menu -->
        <%@include file="./left.jsp" %>
        <div class="col-md-9 order-2">
            <div class="row mb-5">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">주문하기</h2>
                </div>
            </div>
            
            <form action="" name="prodOrderFrm" id="prodOrderFrm" class="row"  method="post">
                <div class="col-md-6 mb-5 mb-md-0">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h5 mb-3 text-black">배송지 정보</h2>
                            <!-- <label class="checkbox-btn">
                            <input type="checkbox">
                            <span class="btn btn-light">기본 배송지</span>
                        </label> -->
                            <div class="p-3 p-lg-5 border">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="getName" class="text-black">수령인 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="getName" name="getName" value="${vo.memberName }">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="getPhone" class="text-black">연락처 <span class="text-danger">*</span></label>
                                        <input type="tel" class="form-control" id="getPhone" name="getPhone" value="${vo.memberPhone }" pattern="[0-9]{3}-[0-9]{4}-[0-9]{3}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="zonecode" class="text-black">우편번호 <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="zonecode" name="zonecode" value="${vo.zone }" readonly>
                                            <div class="input-group-append">
                                                <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">우편번호 찾기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="address" class="text-black">주소 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="address" name="address" value="${vo.addr1 }" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="address_etc" class="text-black">상세주소 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="address2" value="${vo.addr2 }" name="address2">
                                    </div>
                                </div>


                                <div class="form-group row mb-5">
                                    <div class="col-md-12">
                                        <label for="memberEmail" class="text-black">이메일 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="memberEmail" value="${vo.memberEmail }" name="memberEmail">
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- row END-->
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h5 mb-3 text-black">적립금 안내</h2>
                            <div class="p-3 p-lg-5 border">
                                <div class="d-flex">
                                    <span class="text-black mb-3">보유 적립금</span>
                                    <span class="text-black ml-auto h5" id="memberSavedmoney">${vo.savedMoney }</span>
                                </div>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="savedMoney" placeholder="">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary btn-sm" type="button" id="btnUseSaveMoney">전액 사용</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- row END-->
                </div>
                <div class="col-md-6">


                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h5 mb-3 text-black">결제 금액</h2>
                            <div class="p-3 p-lg-5 border">
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                        <th>Product</th>
                                        <th>Total</th>
                                    </thead>
                                    <tbody>
                                    	<c:if test="${not empty list}">
                                    	
                                    	
                                        <c:forEach var="list" items="${list }" varStatus="i">
                                            <tr>
                                                <td>${list.itemTitle } <strong class="mx-2">x</strong>${list.itemEa }</td>
                                                <td>${list.totPrice }</td>
                                                
                                                <input type="hidden" name="itemCode_${i.index }" value="${list.itemCode }" />
                                                <input type="hidden" name="itemEa_${i.index }" value="${list.itemEa }" />
                                                <input type="hidden" name="price_${i.index }" value="${list.totPrice }" />
                                               	
                                            </tr>
                                        </c:forEach>
                                        </c:if>
                                        
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Point</strong></td>
                                            <td class="text-black" id="discountCash"><strong class="mx-2">-</strong></td>
                                        </tr>
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                            <td class="text-black font-weight-bold" id="orderTotPrice"><strong>${cartTotalPrice }</strong></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <!-- row END-->

                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h5 mb-3 text-black">결제 방식</h2>
                            <div class="p-3 p-lg-5 border">
                                <div class="form-group">
                                    <label class="custom-control custom-radio mb-3">
                                        <input class="custom-control-input" type="radio" name="payment" checked="">
                                        <div class="custom-control-label ml-2">무통장 입금</div>
                                    </label>
                                    <label class="custom-control custom-radio mb-3">
                                        <input class="custom-control-input" type="radio" name="payment">
                                        <div class="custom-control-label ml-2">계좌이체</div>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg py-3 btn-block" id="btnPay">결제하기</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- row END-->
                </div>
                <input type="hidden" name="mId" value="${mId }" />
                <input type="hidden" name="mName" value="${vo.memberName }" />
                <input type="hidden" name="memPhone" value="${vo.memberPhone }" />
                <input type="hidden" name="memEmail" value="${vo.memberEmail }" />

            </form>
            <!-- </form> -->
        </div>

        <script>
            $(function () {
            	btnClickEvent();
            	
            	
            	// 적립금 입력 
            	var savedMoney = Number($("#memberSavedmoney").html());	// 적립금 
            	
            	$( "#savedMoney" )
            	  .keyup(function() {
            	    var value = Number($( this ).val());
            	    console.log(value);
            	    
            	    if(savedMoney >= value){
            	    	$( "#memberSavedmoney" ).text( savedMoney - value );
            	    }else if(savedMoney < value){
            	    	$( this ).val(0);
            	    }
            		 // 적립금 계산 
                    $("#discountCash").html(${cartTotalPrice} - value);
                    // 주문 합계 - 적립금 
                    $("#orderTotPrice").html(${cartTotalPrice} - value);
            	  })
            	  .keyup();
            	
                $("#btnUseSaveMoney").on("click", function () {
            	    
                    $("#savedMoney").val($("#memberSavedmoney").html());
                    $( "#memberSavedmoney" ).text("0");
                    
                    // 적립금 계산 
                    $("#discountCash").html(${cartTotalPrice} - Number($("#savedMoney").val()));
                    // 주문 합계 - 적립금 
                    $("#orderTotPrice").html(${cartTotalPrice} - Number($("#savedMoney").val()));
                })


            })
        </script>