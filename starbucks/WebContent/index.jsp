<%@page import="java.util.ArrayList"%>
<%@page import="bean.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDao_YD"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./layout/header.jsp" %>
    
    <%
    ProductDao_YD dao = new ProductDao_YD();
    List<ProductVo> list = new ArrayList<ProductVo>();
    
    %>
<script>


</script>


    
        <div class="site-blocks-cover main-banner" style="" data-aos="fade">
            <div class="container">
                <div class="row align-items-start align-items-md-center justify-content-end">

                    <div class="col-md-4 text-center text-md-left pt-5 pt-md-0 img-area">
                        <img src="images/product/20_spring_bean.png" alt="">
                    </div>
                    
                    <div class="col-md-6 text-center text-md-left pt-5 pt-md-0">
                        <h4 class="mb-2" style='color:#333;'>뚜렷한 특색의 4가지 원두를 블랜딩하여 </h4>
                        <h4 class="mb-2" style='color:#333;'>복합적인 풍미를 선사할 커피</h4>
                        <h1 class="mb-2">SPRING SEASON BLEND</h1>
                        <div class="intro-text text-center text-md-left">
						<span class="mb-4">풍부한 다크 체리의 풍미와 스파이시함, 입 안 가득 차는 풀 바디감을 느낄 수 있는
									다크 로스트 커피로, 숙성 수마트라, 썬드라이드 에티오피아, 파푸아뉴기니,
									콜롬비아 원두의 독특한 풍미를 경험해보세요.</span>
                            <p>
                                <a href="listPage.pl" class="btn btn-sm btn-primary">Shop Now</a>
                            </p>
                        </div>   
                    </div>

                </div>
            </div>
        </div>

<!--  신상품 표시 시작 -->
        <div class="site-section block-3 site-blocks-2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 site-section-heading text-center pt-4">
                        <h2>New Products  </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="nonloop-block-3 owl-carousel">
                           
                           <%
                           list = dao.mainSelect(1);
                           int i = 1;
                           for(ProductVo vo : list){
                        	   if(i<=6){
                           %>
                           
                            <div class="item">
                                <div class="block-4 text-center" onclick="item_view('<%=vo.getItem_code()%>')"  style="cursor:pointer">
                                    <figure class="block-4-image">
                                        <img src="./fileFolder/<%=vo.getItem_mainimg() %>" alt="Image placeholder" class="img-fluid">
                                    </figure>
                                    <div class="block-4-text p-4">
                                        <h3><a href="#" ><%=vo.getItem_title() %></a></h3>
                                        <p class="mb-0"><%=vo.getItem_size() %></p>
                                        <p class="text-primary font-weight-bold"><%=vo.getItem_price() %>원</p>
                                    </div>
                                </div>
                            </div>
							
							<%
                          i++;
                           }}
							%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
 <!-- 신상품 표시끝 -->
 <!-- 베스트 표시시작 -->       
        <div class="site-section block-3 site-blocks-2 bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 site-section-heading text-center pt-4">
                        <h2>BEST Products</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="nonloop-block-3 owl-carousel">
                                                   
                           <%
                           list = dao.mainSelect(2);
                           i = 1;
                           for(ProductVo vo : list){
                        	   if(i<=6){
                           %>
                            <div class="item">
                                <div class="block-4 text-center" onclick="item_view('<%=vo.getItem_code()%>')"  style="cursor:pointer">
                                    <figure class="block-4-image">
                                        <img src="./fileFolder/<%=vo.getItem_mainimg() %>" alt="Image placeholder" class="img-fluid">
                                    </figure>
                                    <div class="block-4-text p-4">
                                        <h3><a href="#" ><%=vo.getItem_title() %></a></h3>
                                        <p class="mb-0">><%=vo.getItem_size() %></p>
                                        <p class="text-primary font-weight-bold"><%=vo.getItem_price() %>원</p>
                                    </div>
                                </div>
                            </div>
                            				
							<%
	                          i++;
	                           }}
							%>
                          
                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- 베스트 표시끝 -->      
        <div class="site-section block-8">
            <div class="container">
                <div class="row justify-content-center  mb-5">
                    <div class="col-md-7 site-section-heading text-center pt-4">
                        <h2>EVENT</h2>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-12 col-lg-7 mb-5">
                        <a href="#"><img src="images/main/event.png" alt="Image placeholder" class="img-fluid rounded"></a>
                    </div>
                    <div class="col-md-12 col-lg-5 text-center pl-md-5">
                        <h2><a href="#">신세계면세점 이벤트</a></h2>
                        <p class="post-meta mb-4">2020-03-01 ~ 2020-04-30</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam iste dolor accusantium facere corporis ipsum animi deleniti fugiat. Ex, veniam?</p>
                        <p><a href="#" class="btn btn-primary btn-sm">more</a></p>
                    </div>
                </div>
            </div>
        </div>
                     <form id='pd_frm' name='pd_frm' method='post'>
                   	 	<input type="hidden" name="nowPage" id='nowPage' value='${ empty param.nowPage? 1 : param.nowPage }'/>
                   	 	<input type="hidden" name="pd_findStr" id='pd_findStr' value='' />
                    </form>

        <%@include file="./layout/footer.jsp" %>