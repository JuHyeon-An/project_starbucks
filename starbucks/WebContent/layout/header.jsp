<%@page import="bean.ShoppingCartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Starbucks shop</title>
        
		<link rel="shortcut icon" href="/starbucks/images/favicon.ico" type="image/ico">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
        <link rel="stylesheet" href="/starbucks/fonts/icomoon/style.css">

        <link rel="stylesheet" href="/starbucks/css/bootstrap.min.css">
        <link rel="stylesheet" href="/starbucks/css/magnific-popup.css">
        <link rel="stylesheet" href="/starbucks/css/jquery-ui.css">
        <link rel="stylesheet" href="/starbucks/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/starbucks/css/owl.theme.default.min.css">


        <link rel="stylesheet" href="/starbucks/css/aos.css">

        <link rel="stylesheet" href="/starbucks/css/style.css">
        <link rel="stylesheet" href="/starbucks/css/custom.css">
        <!-- 별 --><!-- 별 --><!-- 별 --><!-- 별 --><!-- 별 -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
		<!-- datePicker 관련 css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <!-- datePicker 관련 js -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
        
    </head>
    <script>
   	let pd_itmeFind = function(findStr){
	   $('#itmeFindStr').val(findStr);
	   $('#itmeFind').attr('method', 'post')
	   $('#itemFind').attr('action', 'itemFind.pl').submit();
	}
   </script>

    <%
    
    ShoppingCartDao cartdao = new ShoppingCartDao();
    String mId2 = session.getAttribute("mId")+"";
    int cnt = cartdao.cartcnt(mId2);
    
    %>

    <body>
     


        <div class="site-wrap">
            <header class="site-navbar " role="banner">
                <div class="site-navbar-top">
                    <div class="container">
                        <div class="row align-items-center">

                            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                                <form onsubmit='pd_itmeFind()' id='itemFind' class="site-block-top-search" method='post' >
                                    <span class="icon icon-search2"></span>
                                    <input type="text" id='itemFindStr' name='itmeFindStr' class="form-control border-0 basicAutoComplete"  autocomplete="off" placeholder="Search">
                                </form>
                            </div>

                            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                                <div class="site-logo">
                                    <a href="/starbucks/" class="js-logo-clone"><img src="/starbucks/images/logo.png" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                                <div class="site-top-icons">
                                    <ul>
<!--                                     	<li><a href="/starbucks/admin/">admin</a></li> -->
                                    	
                                    	<%if(session.getAttribute("admin") != null){ %> 
                                        		<li><a href="/starbucks/admin/">admin</a></li>
                                        <%}%>
<!--                                     	세션값에 따라 로그인 로그아웃 표시 -->
                                    	<%if(session.getAttribute("mId") == null){ %> 
                                        	<li><a href="/starbucks/member/login.jsp">login</a></li>
                                        	<li><a href="/starbucks/member/login.jsp"><span class="icon icon-person"></span></a></li>
                                       		 <li>
	                                            <a href="/starbucks/member/login.jsp" class="site-cart">
	                                                <span class="icon icon-shopping_cart"></span>
	                                            </a>
	                                        </li>
                                        <%}else{ %>
                                       		 <li><a href="/starbucks/member/logoutAction.jsp">logout</a></li>
                                       		 <li><a href="/starbucks/my/my.my?mId2=${mId }&&selectedStatus=0"><span class="icon icon-person"></span></a></li>
                                       		 <li>
	                                            <a href="/starbucks/my/cart.my?mId2=${mId }" class="site-cart">
	                                                <span class="icon icon-shopping_cart"></span>
	                                                <%if(cnt!=0){ %><span class="count"><%=cnt%></span>
	                                                <%} %>
	                                            </a>
	                                        </li>
                                        <%} %>
                                        
                                        
							
<!--                                         <li><a id='loginPage' href="#login" onclick='submitForm();'><span class="icon icon-person"></span></a></li> -->
                                        
                                        
                                        <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <nav id='navbar'class="site-navigation text-right text-md-center" role="navigation" '>
                    <div class="container">
                        <ul class="site-menu js-clone-nav d-none d-md-block">
                            <li class="active"><a href="/starbucks/">HOME</a></li>
                            <li class="has-children">
<!--                                 <a href="/starbucks/product/list.jsp">All Product</a> -->
								<a href="listCategories.pl">All Product</a>
                                <ul class="dropdown">
                                    <li><a href="#"  onclick="categories('MG')" >머그</a></li>
                                    <li><a href="#"  onclick="categories('GL')">글라스</a></li>
                                    <li><a href="#"  onclick="categories('TB')">텀블러</a></li>
                                    <li><a href="#"  onclick="categories('TM')">보온병</a></li>
                                    <li><a href="#"  onclick="categories('AC')">액세서리</a></li>
                                    <li><a href="#"  onclick="categories('CO')">커피용품/원두</a></li>
                                    
                                </ul>
                            </li>

                            <li class="has-children">
                                <a href="review_select.uk?nowPage=1">Community</a>
                                <ul class="dropdown">
                                    <li><a href="review_select.uk?nowPage=1">Review</a></li>
                                </ul>
                            </li>
                            <li class="has-children">
                                <a href="notice_select.uk?nowPage=1">CS Center</a>
                                <ul class="dropdown">
                                    <li><a href="notice_select.uk?nowPage=1">Notice</a></li>
                                </ul>
                                                          <li class="has-children">
                                <a href="/starbucks/infomation/map.jsp">Information</a>
                                <ul class="dropdown">
                               		<li><a href="/starbucks/infomation/map.jsp">매장찾기</a></li>
                                    <li><a href="/starbucks/infomation/privacy.jsp">개인정보처리방침</a></li>
                                    <li><a href="/starbucks/infomation/homePage.jsp">홈페이지이용약관</a></li>
                                    <li><a href="/starbucks/infomation/location.jsp">위치정보이용약관</a></li>
                                </ul>
                        </ul>
                    </div>

                </nav>
            </header>
         </div>
         

         