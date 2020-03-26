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
            <img id='imgView' src="./fileFolder/${vo.item_thumnailimg }" alt="Image" class="target img-fluid" data-zoom="3" />
            </div>
            <div class='row'>
            <br />
            <img id='img1' src="./fileFolder/${vo.item_thumnailimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(1)' />
            <img id='img2'  src="https://image.istarbucks.co.kr/upload/store/skuimg/2020/03/[9300000002364]_20200304165033804.jpg" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(2)' />
            <img id='img3'  src="https://image.istarbucks.co.kr/upload/store/skuimg/2019/04/[11100513]_20190429144456596.jpg" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(3)' />
            </div>
          </div>
          <div class="offset-1 col-md-6">

            <h2 class="text-black">${vo.item_title }</h2>
            <p>${vo.item_content }</p>
            <p class="mb-4">용량 : ${vo.item_size }</p>
            <p class="mb-4">재고 : ${vo.item_num }</p>
            <p class="mb-4">적립금 : ${vo.item_savedmoney }원</p>
            <p><strong id='price'class="text-primary h4">${vo.item_price }</strong><strong class='text-primary h4'>원</strong></p>
            <input type="hidden" id="oriprice" value='${vo.item_price }' />
            <input type="hidden" id="sumprice" value='' />
            <!-- 
            <div class="mb-1 d-flex">
              <label for="option-sm" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-sm" name="shop-sizes"></span> <span class="d-inline-block text-black">Small</span>
              </label>
              <label for="option-md" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-md" name="shop-sizes"></span> <span class="d-inline-block text-black">Medium</span>
              </label>
              <label for="option-lg" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-lg" name="shop-sizes"></span> <span class="d-inline-block text-black">Large</span>
              </label>
              <label for="option-xl" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-xl" name="shop-sizes"></span> <span class="d-inline-block text-black"> Extra Large</span>
              </label>
            </div>
             -->
            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
              <div class="input-group-prepend">
                <button id='minus'class="btn btn-outline-primary js-btn-minus" type="button" onclick='priceminus()'>&minus;</button>
              </div>
              <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
              <div class="input-group-append">
                <button id='plus' class="btn btn-outline-primary js-btn-plus" type="button" onclick='priceplus()'>&plus;</button>
              </div>
            </div>

            </div>
            
    <div class='mb-5 form-inline'>     
	<%if(session.getAttribute("mId") == null){ %> 
	      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary">장바구니</a></p>
	<%}%>
	
	<%if(session.getAttribute("mId") != null){ %> 
	    <p><a href="./my/cart.jsp" class="buy-now btn btn-sm btn-primary">장바구니</a></p>
	<%}%>
	    
	<%if(session.getAttribute("mId") == null){ %> 
	      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary offset-1">구매하기</a></p>
	<%}%>
	
	<%if(session.getAttribute("mId") != null){ %> 
	    <p><a href="./my/order.jsp" class="buy-now btn btn-sm btn-primary  offset-1">구매하기</a></p>
	<%}%>
	
		<p><a href="listPage.pl" class="buy-now btn btn-sm btn-primary offset-3">목록</a></p>
	</div>

          </div>
        </div>
      </div>
    </div>


<!-- 
    <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Featured Products</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="images/cloth_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Tank Top</a></h3>
                    <p class="mb-0">Finding perfect t-shirt</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Corater</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="images/cloth_2.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Polo Shirt</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="images/cloth_3.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">T-Shirt Mockup</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">Corater</a></h3>
                    <p class="mb-0">Finding perfect products</p>
                    <p class="text-primary font-weight-bold">$50</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 -->
 
</c:forEach>
<script src="/starbucks/js/productlist.js"></script>
<script>
let priceplus = function(){
	let price = parseInt($('#price').text());
	let oriprice = parseInt($('#oriprice').val());
	$('#price').text(price+oriprice);
	$('#sumprice').val(price+oriprice);
}
let priceminus = function(){
	let price = parseInt($('#price').text());
	let oriprice = parseInt($('#oriprice').val());
	$('#price').text(price-oriprice);
	$('#sumprice').val(price-oriprice);
}

let alert_login = function(){
	Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: '로그인 후 이용해주세요 !',
		  footer: "<a href='/starbucks/member/login.jsp'>로그인화면 이동</a>"
		})
}




let imgchang = function(num){
	
	$('#imgView').attr('src',$('#img'+num).attr('src'));
	zoom();
	
}
let zoom = function () {
	 
    var target = $('.target');
    //1
    var zoom = target.data('zoom');
 
    $(".wrap")
        .on('mousemove', magnify)
        .prepend("<div class='magnifier'></div>")
        .children('.magnifier').css({
            "background": "url('" + target.attr("src") + "') no-repeat",
            // 2
            "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
        });
 
    var magnifier = $('.magnifier');
 
    function magnify(e) {
 
        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;
 
        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
            magnifier.fadeIn(100);
        } else {
            magnifier.fadeOut(100);
        }
 
        //돋보기가 존재할 때
        if (magnifier.is(":visible")) {
 
            // 3
            var rx = -(mouseX * zoom - magnifier.width() /2 );
            var ry = -(mouseY * zoom - magnifier.height() /2 );
 
            //돋보기를 마우스 위치에 따라 움직인다.
            //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
            var px = mouseX - magnifier.width() / 2;
            var py = mouseY - magnifier.height() / 2;
 
            //적용
            magnifier.css({
                left: px,
                top: py,
                backgroundPosition: rx + "px " + ry + "px"
            });
        }
    }
};



$( function () {
	 
    var target = $('.target');
    //1
    var zoom = target.data('zoom');
 
    $(".wrap")
        .on('mousemove', magnify)
        .prepend("<div class='magnifier'></div>")
        .children('.magnifier').css({
            "background": "url('" + target.attr("src") + "') no-repeat",
            // 2
            "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
        });
 
    var magnifier = $('.magnifier');
 
    function magnify(e) {
 
        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;
 
        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
            magnifier.fadeIn(100);
        } else {
            magnifier.fadeOut(100);
        }
 
        //돋보기가 존재할 때
        if (magnifier.is(":visible")) {
 
            // 3
            var rx = -(mouseX * zoom - magnifier.width() /2 );
            var ry = -(mouseY * zoom - magnifier.height() /2 );
 
            //돋보기를 마우스 위치에 따라 움직인다.
            //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
            var px = mouseX - magnifier.width() / 2;
            var py = mouseY - magnifier.height() / 2;
 
            //적용
            magnifier.css({
                left: px,
                top: py,
                backgroundPosition: rx + "px " + ry + "px"
            });
        }
    }
});



</script>



    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>