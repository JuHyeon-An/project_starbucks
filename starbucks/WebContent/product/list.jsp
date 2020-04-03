<%@ page language="java" contentType="text/html; charset=UTF-8"


    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Breadcrumb -->
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/starbucks/index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong>
                </div>
            </div>
        </div>
        
    </div>

	<div class="site-section">
	    
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

<!-- 필터 메뉴  -->
            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Shop</h2></div>
                <div class="d-flex">
            
                  <div class="dropdown mr-1 ml-md-auto">

                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Reference</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                      <a class="dropdown-item" href="#" onclick="categories('${pd_findStr}',1)"  >Name, A to Z</a>
                       <a class="dropdown-item" href="#"  onclick="categories('${pd_findStr}',2)">Name, Z to A</a>
<!--                       <a class="dropdown-item" href="#"  onclick="categories('all',2)">Name, Z to A</a> -->
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#" onclick="categories('${pd_findStr}',3)"  >Price, low to high</a>
                      <a class="dropdown-item" href="#"  onclick="categories('${pd_findStr}',4)">Price, high to low</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
   
<!-- 필터메뉴 끝      -->
            
            <div class="row mb-5">


<!-- 	상품 표시 시작 -->

              <c:forEach var='vo' items='${list }'>
               <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up" onclick="item_view('${vo.item_code}')">
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="#" ><img src="/starbucks/fileFolder/${vo.item_mainimg }" alt="Image placeholder" class="img-fluid"></a>
                    
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="#">${vo.item_title}</a></h3>
                    <p class="mb-0">${vo.item_size }</p>
                    <p class="text-primary font-weight-bold">${vo.item_price}원</p>
                  </div>
                </div>
              </div>
              </c:forEach>
              
<!-- 상품표시 끝 -->
           
<!-- 페이징 -->

          </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
             
                <div class="site-block-27">
                  <ul>
                  
                  <c:if test='${p.nowPage > p.blockSize }'>
                 	 <input type="button" class='btn btn-default btn-arraw-left' value ='이전' onclick='pd_goPage(1,""${p.findStr }"")'/>
                  </c:if>
                  <c:forEach var='i' begin='${p.startPage }' end='${p.endPage }'>
                  	 <input type="button" class=<c:if test='${ i == p.nowPage }'>'btn btn-primary btn-arraw-left'</c:if> 
										<c:if test='${ i != p.nowPage }'>'btn btn-default btn-arraw-left'</c:if>
							value ='${ i }' onclick='pd_goPage("${i}","${p.findStr }")'/>
                  </c:forEach>
                  <c:if test="${p.nowPage < p.totPage }">
					<input type="button" class='btn btn-default btn-arraw-left' value ='다음' onclick='pd_goPage(${p.nowPage+1},"${p.findStr }")'/>
				 </c:if>

                  </ul>
                </div>
              </div>
            </div>
          </div>

<!-- 페이징 끝-->

<!-- 좌측 메뉴 시작 -->
          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="#" onclick="categories('MG')" class="d-flex"><span>머그</span> <span class="text-black ml-auto"></span></a></li>
                <li class="mb-1"><a href="#" onclick="categories('GL')" class="d-flex"><span>글라스</span> <span class="text-black ml-auto"></span></a></li>
                <li class="mb-1"><a href="#" onclick="categories('TB')" class="d-flex"><span>텀블러</span> <span class="text-black ml-auto"></span></a></li>
                <li class="mb-1"><a href="#" onclick="categories('TM')" class="d-flex"><span>보온병</span> <span class="text-black ml-auto"></span></a></li>
                <li class="mb-1"><a href="#" onclick="categories('AC')" class="d-flex"><span>액세서리</span> <span class="text-black ml-auto"></span></a></li>
                <li class="mb-1"><a href="#" onclick="categories('CO')" class="d-flex"><span>커피용품/원두</span> <span class="text-black ml-auto"></span></a></li>
              </ul>
              <br></br>
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Theme</h3>
              <ul class="list-unstyled mb-0">
              
<!--               테마 리스트 생성 -->
              <c:forEach var='vo2' items='${listTheme }'>
                <li class="mb-1"><a href="#" class="d-flex"  onclick="categories('${vo2.item_theme}')" ><span>${vo2.item_theme }</span> <span class="text-black ml-auto"></span></a></li>
              

              
               </c:forEach>
<!--               테마 리스트 끝 -->           
              </ul>
            </div>

            
          </div>
<!--           좌측메뉴 끝 -->
          
        </div>
      </div>
      
      <form id='pd_frm' name='pd_frm' method='post'>
      	<input type="hidden" name="nowPage" id='nowPage' value='${ empty param.nowPage? 1 : param.nowPage }'/>
      	<input type="hidden" name="pd_findStr" id='pd_findStr' value=''/>
      	<input type="hidden" name='pd_sort' id='pd_sort' value='${ empty sort? 1 : sort }'/>
      </form>

     </div>
<script>

let pd_goPage = function(nowPage, findStr){
	$('#nowPage').val(nowPage);
	$('#pd_findStr').val(findStr);
	$('#pd_frm').attr('method', 'post');
	$('#pd_frm').attr('action', 'listCategories.pl').submit();
}
let categories = function(findStr, sort){
   $('#pd_findStr').val(findStr);
	$('#nowPage').val('1');
	 $('#pd_sort').val(sort);
   $('#pd_frm').attr('method', 'post');
   $('#pd_frm').attr('action', 'listCategories.pl').submit();
}

let item_view = function(findStr){
   $('#pd_findStr').val(findStr);
   $('#pd_frm').attr('method', 'post');
   $('#pd_frm').attr('action', 'item_view.pl').submit();
} 

</script>

    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>