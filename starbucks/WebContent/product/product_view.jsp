<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Breadcrumb -->
    <style>
    .wrap {
    position: relative;
    width: 500px;
    margin: 0 auto;
	}
	/* 확대될 타겟이미지*/
	.target {
	    display: block;
	    width: 100%;
	}
	/* 돋보기 */
	.magnifier {
	    width: 120px;
	    height: 120px;
	    position: absolute;
	    border-radius: 100%;
	    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
	    display: none;
	}
 
    </style>
    
    <c:forEach var='vo' items='${list }'>
 <form id='view_frm' name='view_frm' method='post'>  
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/starbucks/index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a href="listPage.pl">ALL Product</a> 
                    <span class="mx-2 mb-0">/</span><strong class="text-black">${vo.item_title }</strong>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
        

          <div class="wrap col-md-5 ">
          	<div class='row'>
            <img id='imgView' src="./fileFolder/${vo.item_thumbnailimg }" alt="Image" class="target img-fluid" data-zoom="3" />
            </div>
            <div class='row'>
            <br />
            
            <img id='img1' src="./fileFolder/${vo.item_thumbnailimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(1)' />
            <img id='img2'  src="./fileFolder/${vo.item_mainimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(2)' />
            <img id='img3'  src="./fileFolder/${vo.item_contentimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(3)' />

            </div>
          </div>
          <div class="offset-1 col-md-6">

            <h2 class="text-black">${vo.item_title }</h2>
            <p>${vo.item_content }</p>
            <p class="mb-4">용량 : ${vo.item_size }</p>
            <p class="mb-4">재고 : ${vo.item_num }</p>
            <p class="mb-4">적립금 : ${vo.item_savedmoney }원</p>
            <p><strong id='price'class="text-primary h4">${vo.item_price }</strong><strong class='text-primary h4'>원</strong></p>


            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
              <div class="input-group-prepend">
                <button id='minus'class="btn btn-outline-primary js-btn-minus" type="button" onclick='priceminus()'>&minus;</button>
              </div>
              
              <input id='itemEa' type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
              
              <div class="input-group-append">
                <button id='plus' class="btn btn-outline-primary js-btn-plus" type="button" onclick='priceplus()'>&plus;</button>
              </div>
            </div>

            </div>
            
            <!-- 로그인 확인해서 장바구니, 주문하기 버튼 다르게 생성해줌 -->
			    <div class='mb-5 form-inline'>     
				<%if(session.getAttribute("mId") == null){ %> 
				      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary">장바구니</a></p>
				<%}%>
				
				<%if(session.getAttribute("mId") != null){ %> 
				    <p><a href="#" onclick="cart_go('cart')" class="buy-now btn btn-sm btn-primary">장바구니</a></p>
				<%}%>
				    
				<%if(session.getAttribute("mId") == null){ %> 
				      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary offset-1">구매하기</a></p>
				<%}%>
				
				<%if(session.getAttribute("mId") != null){ %> 
				    <p><a href="#" id='btnOrder' onclick="cart_go('order')" class="buy-now btn btn-sm btn-primary  offset-1">구매하기</a></p>
				<%}%>
				
					<p><a href="listPage.pl" onclick='' class="buy-now btn btn-sm btn-primary offset-3">목록</a></p>
				</div>

          </div>
        </div>
      </div>
    </div>
           	
	        <input type="hidden" id="oriPrice" name='oriPrice' value='${vo.item_price }' />
            <input type="hidden" id="totPrice" value='' />
            <input type="hidden" name="item_code" value='${item_code }'/>

</form>
            
            


</c:forEach>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="/starbucks/js/productlist.js"></script>
<script>
let cart_go = function(page){
	$('#view_frm').attr('action','/starbucks/my/'+page+'.my').submit();
}

</script>



    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>