<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- (주문)결제 성공  --> 
<c:if test="${result == 1}">
	<div class="col-12">
	<!-- 
	<form class="col-md-6 offset-md-3">
	    <h2 class="h3 mb-3 text-black">주문내역</h2>
	    <div class="p-3 p-lg-5 border">
	        <table class="table site-block-order-table mb-5">
	            <thead>
	                <tr>
	                	<th>Product</th>
	                	<th>Total</th>
	            	</tr>
	            </thead>
	            <tbody>
	                <c:forEach var="vo" items="${param.list }" varStatus="i">
	                    <tr class="">
	                        <td>${vo.itemTitle } <strong class="mx-2">x</strong>${vo.orderNum }</td>
	                        <td>${vo.orderPrice }</td>
	                        <input type="hidden" name="serial_${i.index }" value="${vo.serial}" />
	                        <input type="hidden" name="itemCode_${i.index }" value="${vo.itemCode }" />
	                        <input type="hidden" name="itemEa_${i.index }" value="${vo.orderNum }" />
	                        <input type="hidden" name="price_${i.index }" value="${vo.orderPrice }" />
	                       	
	                    </tr>
	                </c:forEach>
	                <input type="hidden" name="itemSize" id="itemSize" />
	                       
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
	
	        <div class="border p-3 mb-3">
	            <h3 class="h6 mb-0"><a class="d-block collapsed" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>
	
	            <div class="collapse" id="collapsebank" style="">
	                <div class="py-2">
	                    <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
	                </div>
	            </div>
	        </div>
	
	        <div class="border p-3 mb-3">
	            <h3 class="h6 mb-0"><a class="d-block collapsed" data-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>
	
	            <div class="collapse" id="collapsecheque" style="">
	                <div class="py-2">
	                    <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
	                </div>
	            </div>
	        </div>
	
	        <div class="border p-3 mb-5">
	            <h3 class="h6 mb-0"><a class="d-block collapsed" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Paypal</a></h3>
	
	            <div class="collapse" id="collapsepaypal" style="">
	                <div class="py-2">
	                    <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
	                </div>
	            </div>
	        </div>
	
	        <div class="form-group">
	            <button class="btn btn-primary btn-lg py-3 btn-block" onclick="window.location='thankyou.html'">Place Order</button>
	        </div>
	
	    </div>
	</form>
	 -->
	
	    <div class="col-md-12 text-center">
	        <span class="icon-check_circle display-3 text-success"></span>
	        <h2 class="display-3 text-black">Thank you!</h2>
	        <p class="lead mb-5">You order was successfuly completed.</p>
	        <p><a href="../product/list.jsp" class="btn btn-sm btn-primary">Back to shop</a></p>
	    </div>
	</div>
	
</c:if>

<!-- (주문)결제 실패  --> 
<c:if test="${result == 0}">
	<script>
		$(function(){
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: '주문처리중 오류가 발생하였습니다.' 
			}).then((result) => {
			  	if (result.value) {
			  		history.back();
			  	}
			});
		})
	</script>
</c:if>