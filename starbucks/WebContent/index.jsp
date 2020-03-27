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
        <div class="site-blocks-cover main-banner" style="" data-aos="fade">
            <div class="container">
                <div class="row align-items-start align-items-md-center justify-content-end">

                    <div class="col-md-5 text-center text-md-left pt-5 pt-md-0 img-area">
                        <img src="images/product/20_spring_bean.png" alt="">
                    </div>
                    
                    <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
                        <h1 class="mb-2">Iced Spring Peach Green Tea</h1>
                        <div class="intro-text text-center text-md-left">
                            <p class="mb-4">달콤한 국내산 복숭아와 은은한 자스민향이 완벽하게 어우러진 스프링 피치 그린 티와 함께 따뜻한 봄의 기운을 느껴보세요!</p>
                            <p>
                                <a href="#" class="btn btn-sm btn-primary">Shop Now</a>
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
                                <div class="block-4 text-center">
                                    <figure class="block-4-image">
                                        <img src="./fileFolder/<%=vo.getItem_thumbnailimg() %>" alt="Image placeholder" class="img-fluid">
                                    </figure>
                                    <div class="block-4-text p-4">
                                        <h3><a href="#"><%=vo.getItem_title() %></a></h3>
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
                                <div class="block-4 text-center">
                                    <figure class="block-4-image">
                                        <img src="./fileFolder/<%=vo.getItem_thumbnailimg() %>" alt="Image placeholder" class="img-fluid">
                                    </figure>
                                    <div class="block-4-text p-4">
                                        <h3><a href="#"><%=vo.getItem_title() %></a></h3>
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
        <%@include file="./layout/footer.jsp" %>