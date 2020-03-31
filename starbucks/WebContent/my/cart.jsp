<%@page import="java.util.List"%>
<%@page import="bean.ShoppingCartDao"%>
<%@page import="bean.ShoppingCartVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- left side menu -->
	<%@include file="./left.jsp" %>
	
	<%
	/*String mId = (String)session.getAttribute("mId");
	//String itemCode = (String)request.getHeader("itemCode");
	
	//System.out.println("itemCode : " + itemCode);
	ShoppingCartDao dao = new ShoppingCartDao();
	
	List<ShoppingCartVo> list = dao.select(mId);
	
	pageContext.setAttribute("list", list);
	System.out.println("serial2" + request.getParameter("serial"));
	*/
	//String msg = dao.delete(itemCode);
	%>
<div class="col-md-9 order-2">
    <div class="row mb-3">
        <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">장바구니</h2>
        </div>
    </div>
    <div class="row mb-5">
        <form class="col-md-12" name="cartFrm" id="cartFrm" method="post">
            <input type="hidden" name="mId2" value="${mId }" />
            <div class="site-blocks-table">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="product-checkbox">
								<label class="custom-control custom-checkbox mb-3">
                                    <input class="custom-control-input" type="checkbox" id="checkAll" checked="">
                                    <div class="custom-control-label ml-2"></div>
                                </label>
							</th>
                            <th class="product-thumbnail">Image</th>
                            <th class="product-name">Product</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                            <th class="product-total">Total</th>
                            <th class="product-remove">Remove</th>
                        </tr>
                    </thead>
                    <tbody> 
                    	<c:forEach var="vo" items="${list }" varStatus="i"  >
	                        <tr>
	                            <td class="product-checkbox">
	                                <label class="custom-control custom-checkbox mb-3">
	                                    <input class="custom-control-input" type="checkbox" id="chkCnt_${i.index }" checked="" onclick="cartTotPrice()">
	                                    <div class="custom-control-label ml-2"></div>
	                                </label>
	                            </td>
	                            <td class="product-thumbnail">
	                                <img src="./fileFolder/${vo.fileName }" alt="상품이미지" class="img-fluid">
	                            </td>
	                            <td class="product-name text-left">
	                                <h2 class="h6 text-black"><a href="">${vo.itemTitle}</a></h2>
	                            </td>
	                            <td><span id="price_${i.index }">${vo.price }</span></td>
	                            <td>
	                                <div class="input-group input-group-sm mx-auto" style="max-width: 120px;">
	                                    <div class="input-group-prepend">
	                                        <button class="btn btn-outline-primary js-btn-minus" id="btnMinus_${i.index }" onclick="priceMinus('${i.index}');" type="button">&minus;</button>
	                                    </div>
	                                    <input type="button" class="form-control text-center itemEa" id="itemEa_${i.index }" name="itemEa_${i.index }" value="${vo.itemEa}" />
	                                    <div class="input-group-append">
	                                        <button class="btn btn-outline-primary js-btn-plus" id="btnPlus_${i.index }" onclick="pricePlus('${i.index}');" type="button">&plus;</button>
	                                    </div>
	                                </div>
	
	                            </td>
	                            <td><span id="totPrice_${i.index }">${vo.totPrice}</span>	</td> 
	                            <td>
	                            	<input type="hidden" name="serial_${i.index }" value="${vo.serial }" />
	                            	<a href="#" class="btn btn-primary btn-sm btnDelCartItem" id="btnDelCartItem_${vo.serial }" onclick="delCartList('${vo.serial }');">X</a>
                            	</td>
	                        </tr>
	                        <input type="hidden" name="itemTitle_${i.index }" value="${vo.itemTitle }" />
	                        <input type="hidden" name="itemEaVal_${i.index }" id="itemEaVal_${i.index }" value="${vo.itemEa }" />
	                        
	                        <input type="hidden" name="totPriceVal_${i.index }" id="totPriceVal_${i.index }" value="${vo.totPrice }" />
	                        <input type="hidden" name="mId" value="${mId }" />
	                        <input type="hidden" name="itemCode_${i.index }" value="${vo.itemCode }"  />
	                        <input type="hidden" name="chkFlag_${i.index }" id="chkFlag_${i.index }" value="" />
	                        <input type="hidden" name="mName_${i.index }" value="${vo.mName }" />
	                       
                        </c:forEach>
                        <input type="hidden" name="cartTotPriceHd" id="cartTotPriceHd" />
                        <input type="hidden" name="mId" value="${mId }" />
                        <input type="hidden" name="delSerial" id="delSerial" value="" />
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
                    
                    <div class="row mb-5">
                        <div class="col-md-6">
                            <span class="text-black">Total</span>
                        </div>
                        <div class="col-md-6 text-right">
                            <strong class="text-black" id="cartTotPrice"></strong>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-primary btn-lg py-3 btn-block font-weight-normal" id="btnCheckOut">주문하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${result == 1}">
	<script>
		$(function(){
			Swal.fire({
				icon: 'success',
				text: '"장바구니에서 해당 상품이 삭제되었습니다.' 
			}).then((result) => {
			  	if (result.value) {
			  		//history.back();
			  		location.href = './cart.my?mId2=${mId}';
			  	}
			});
		})
		
		
	</script>
</c:if>
<c:if test="${result == 0}">
   	<script>
   		$(function(){
   			Swal.fire({
   				icon: 'error',
   				text: '삭제중 오류가 발생했습니다.' 
   			})
   		})
		
	</script>
</c:if>
<script>
	$(function(){
		
		cartTotPrice();
		btnClickEvent();
		
		$("#checkAll").on("click", function(){
			var chk = $(this).is(":checked");//.attr('checked');
	        if(chk) $(".product-checkbox input").prop('checked', true);
	        else  $(".product-checkbox input").prop('checked', false);
	        cartTotPrice();
		});		
		
		
	});

	
	function delCartList(serial){
		$("#delSerial").val(serial);
		
		$("#cartFrm").attr("action", "delete.my").submit();
	}
	
</script>