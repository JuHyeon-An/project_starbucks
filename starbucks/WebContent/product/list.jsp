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
                      <a class="dropdown-item" href="sort_title.pl">Name, A to Z</a>
                      <a class="dropdown-item" href="sort_title_desc.pl">Name, Z to A</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="sort_price.pl">Price, low to high</a>
                      <a class="dropdown-item" href="sort_price_desc.pl">Price, high to low</a>
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
                    <a href="#" ><img src="./fileFolder/${vo.item_thumnailimg }" alt="Image placeholder" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="shop-single.html">${vo.item_group}</a></h3>
                    <p class="mb-0">${vo.item_title }</p>
                    <p class="text-primary font-weight-bold">${vo.item_price}</p>
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
                 	 <input type="button" class='btn btn-default btn-arraw-left' value ='이전' onclick='pd_goPage(1)'/>
                  </c:if>
                  <c:forEach var='i' begin='${p.startPage }' end='${p.endPage }'>
                  	 <input type="button" class=<c:if test='${ i == p.nowPage }'>'btn btn-primary btn-arraw-left'</c:if> 
										<c:if test='${ i != p.nowPage }'>'btn btn-default btn-arraw-left'</c:if>
							value ='${ i }' onclick='pd_goPage(${i})'/>
                  </c:forEach>
                  <c:if test="${p.nowPage < p.totPage }">
					<input type="button" class='btn btn-default btn-arraw-left' value ='다음' onclick='pd_goPage(${p.nowPage+1})'/>
				 </c:if>

                  </ul>
                </div>
              </div>
            </div>
          </div>





<!-- 
          </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                  
                  <c:if test='${p.nowPage > p.blockSize }'>
                 	 <li><a onclick='pd_goPage(1)' >&lt;</a></li>
                  </c:if>
                  <c:forEach var='i' begin='${p.startPage }' end='${p.endPage }'>
                  	 <li><a href='pd_goPage(${i})' 
                  	 	<c:if test='${ i == p.nowPage }'>class='active'</c:if>   >${i }</a></li>      	 

                  </c:forEach>
                  <c:if test="${p.nowPage < p.totPage }">
					<li><a onclick='pd_goPage(${p.nowPage+1})' >&gt;</a></li>
				 </c:if>

                  </ul>
                </div>
              </div>
            </div>
          </div>



            </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><a href="#" >&lt;</a></li>
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
 -->
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
<!-- 
            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small (2,319)</span>
                </label>
                <label for="s_md" class="d-flex">
                  <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
                </label>
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
                </a>
              </div>

            </div>
            -->
            
          </div>
<!--           좌측메뉴 끝 -->
          
        </div>
      </div>
      <form id='pd_frm'>
      	<input type="hidden" name="nowPage" id='nowPage' value='${empty param.nowPage? 1 : param.nowPage}'/>
      	<input type="hidden" name="pd_findStr" id='pd_findStr' value=''/>
      </form>
      



   

    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>