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
            <img id='imgView' src="/starbucks/fileFolder/${vo.item_thumbnailimg }" alt="Image" class="target img-fluid" data-zoom="3" />
            </div>
            <div class='row'>
            <br />
            
            <img id='img1' src="/starbucks/fileFolder/${vo.item_thumbnailimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(1)' />
            <img id='img2'  src="/starbucks/fileFolder/${vo.item_mainimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(2)' />
            <img id='img3'  src="/starbucks/fileFolder/${vo.item_contentimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(3)' />

            </div>
          </div>
          <div class="offset-1 col-md-6">

            <h2 class="text-black">${vo.item_title }</h2>
            <p>${vo.item_content }</p>
            <p class="mb-4">사이즈 : ${vo.item_size }</p>
            <p class="mb-4">재고 : ${vo.item_num }</p>
<%--             <p class="mb-4">적립금 : ${vo.item_savedmoney }원</p> --%>
            <p><strong id='price'class="text-primary h4">${vo.item_price }</strong><strong class='text-primary h4'>원</strong></p>


            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
              <div class="input-group-prepend">
                <button id='minus'class="btn btn-outline-primary js-btn-minus" type="button" onclick='priceminus()'>&minus;</button>
              </div>
              
              <input id='itemEa' name="itemEa" type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
              
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
				    <p><a href="#" id="btnAddToCart" onclick="" class="buy-now btn btn-sm btn-primary">장바구니</a></p>
				<%}%>
				    
				<%if(session.getAttribute("mId") == null){ %> 
				      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary offset-1">구매하기</a></p>
				<%}%>
				
				<%if(session.getAttribute("mId") != null){ %> 
				    <p><a href="#" id='btnOrder' onclick="cart_go('singleOrder')" class="buy-now btn btn-sm btn-primary  offset-1">구매하기</a></p>
				<%}%>
				
					<p><a href="listPage.pl" onclick='' class="buy-now btn btn-sm btn-primary offset-3">목록</a></p>
				</div>

          </div>
        </div>
      </div>
    </div>
           	<input type="hidden" name="itemTitle" value="${vo.item_title }" />
	        <input type="hidden" name="fileName" value="${vo.item_thumbnailimg }" />
            <input type="hidden" name="mId" value="${mId }" />
            <input type="hidden" id="oriPrice" name='oriPrice' value='${vo.item_price }' />
            <input type="hidden" id="totPrice" value='' />
            <input type="hidden" name="item_code" value='${vo.item_code }' />
            <input type="hidden" name="review_postnum" id="review_postnum" />
			<input type="hidden" name="nowPage" id="nowPage" />
			<input type='hidden' name='pd_findStr' id='pd_findStr' value='${page.findStr }'/>
</form>

</c:forEach>

<div class="container">
<h3>리뷰</h3><br />
<table class="table table-stripped col-10 text-center" id="reviews">
    <thead>
        <tr>
            <th>평점</th> <!-- 평점 -->
            <th>제목</th>
            <th>아이디</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>

    
        <c:forEach var="rVo" items="${listR }">
            <!-- 평점 기준 별표시 출력 -->
            <tr  onclick="review_view('${rVo.review_postnum}')">
                <td>${rVo.review_like }/5</td>
                <td>${rVo.review_title }</td>
                <td>${rVo.member_id }</td>
                <td>${rVo.review_regdate }</td>
                <td>${rVo.reivew_view }</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</div>
    <div class="row">
	      <div class="col-md-12 text-center">
	          <div class="site-block-27">
	              <ul>
	             	  <c:if test="${page.nowPage >1}">
						  <li onclick='goPageR(${page.nowPage }-1)'><a href="#">&lt;</a></li>
					  </c:if>
					  
					  <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		                  <li id='here' onclick='goPageR(${i })' ${(i==page.nowPage)? "class='active'":""}><a href="#">${i }</a></li>
					  </c:forEach>		
	                  
	                  <c:if test="${page.nowPage<page.totPage }">
		                  <li onclick='goPageR(${page.nowPage }+1)'><a href="#">&gt;</a></li>
					  </c:if>
	              </ul>
	          </div>
	      </div>
	  </div>


<script>
let review_view=function(review_postnum){
	$('#review_postnum').val(review_postnum);
	$('#view_frm').attr('action','review_view.uk').submit();
}
let goPageR=function(nowPage){
	$('#nowPage').val(nowPage);
	$('#view_frm').attr('action','item_view.pl').submit();
}

</script>






<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="/starbucks/js/productlist.js"></script>
<script>
let cart_go = function(page){
	$('#view_frm').attr('action','/starbucks/my/'+page+'.my').submit();
}
$(function(){
	
	var mId = view_frm.mId.value;
	
	$("#totPrice").val($("#price").html());
	$("#btnAddToCart").click(function () {
        cart_go('cart');
    });
})
</script>


<c:if test="${result == 1}">
	<!-- 장바구니 추가 성공 -->
	<script>
	    //장바구니 담기 버튼 클릭 이벤트
	    //if ($("#btnAddToCart") != null) {
	        
	
	   // $("#btnAddToCart").click(function () {
	        const swalWithBootstrapButtons = Swal.mixin({
	            customClass: {
	                confirmButton: 'swal2-confirm btn btn-primary mb-2',
	                cancelButton: 'swal2-cancel btn btn-outline-primary mr-2 mb-2'
	            },
	            buttonsStyling: false
	        })
	
	        swalWithBootstrapButtons.fire({
	                title: 'Add To Cart!',
	                text: "해당 상품이 장바구니에 추가되었습니다!",
	                icon: 'success',
	                showCancelButton: true,
	                confirmButtonText: '장바구니 확인하기 ',
	                cancelButtonText: '쇼핑 계속하기 ',
	                reverseButtons: true
	            }).then((result) => {
	                if (result.value) {
	
	                    // $("#view_frm").attr("action", "cart.my").submit();
	                    //location.href = '/starbucks/my/cart.my';
	                    cart_go('cart');
	                } else(
	                    /* Read more about handling dismissals below */
	                    // $("#view_frm").attr("action", "cart.my").submit();
	                    result.dismiss === Swal.DismissReason.cancel;
	                    history.back();
	                )
	            }) // swal end
	
	   		//}) // click end
	//} // if end
	</script>
	
	</c:if>
	
	<c:if test="${result == 0 }">
	<script>
	
	    Swal.fire({
	        icon: 'info',
	        title: 'Oops...',
	        text: '이미 존재하는 상품입니다!'
	    }).then((result) => {
            history.back();
        }) // swal end
	
	</script>
	
	</c:if>
    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>