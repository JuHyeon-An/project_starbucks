<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
    
        <title>Starbucks shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
        
		<!-- datePicker 관련 css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <!-- datePicker 관련 js -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
    </head>
    

    <body>
     


        <div class="site-wrap">
            <header class="site-navbar" role="banner">
                <div class="site-navbar-top">
                    <div class="container">
                        <div class="row align-items-center">

                            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                                <form action="" class="site-block-top-search">
                                    <span class="icon icon-search2"></span>
                                    <input type="text" class="form-control border-0" placeholder="Search">
                                </form>
                            </div>

                            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                                <div class="site-logo">
                                    <a href="/starbucks/" class="js-logo-clone"><img src="/starbucks/images/logo.png" alt="" /></a>
                                </div>
                            </div>
<form id='frm' name='frm' method='post'></form>
                            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                                <div class="site-top-icons">
                                    <ul>
                                    	<li><a href="/starbucks/admin/">admin</a></li>
                                    	
                                    	<%if(session.getAttribute("admin") != null){ %> 
                                        		<li><a href="/starbucks/admin/">admin</a></li>
                                        <%}%>
<!--                                     	세션값에 따라 로그인 로그아웃 표시 -->
                                    	<%if(session.getAttribute("mId") == null){ %> 
                                        	<li><a href="/starbucks/member/login.jsp">login</a></li>
                                        <%}else{ %>
                                       		 <li><a href="/starbucks/member/logoutAction.jsp">logout</a></li>
                                        <%} %>
                                        
                                        <li><a href="#"><span class="icon icon-person"></span></a></li>
							
<!--                                         <li><a id='loginPage' href="#login" onclick='submitForm();'><span class="icon icon-person"></span></a></li> -->
                                        <li><a href="#"><span class="icon icon-heart-o"></span></a></li>
                                        <li>
                                            <a href="/starbucks/my/cart.jsp" class="site-cart">
                                                <span class="icon icon-shopping_cart"></span>
                                                <span class="count">2</span>
                                            </a>
                                        </li>
                                        <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <nav class="site-navigation text-right text-md-center" role="navigation">
                    <div class="container">
                        <ul class="site-menu js-clone-nav d-none d-md-block">
                            <li class="active"><a href="/starbucks/">HOME</a></li>
                            <li class="has-children">
<!--                                 <a href="/starbucks/product/list.jsp">All Product</a> -->
								<a href="list.pl">All Product</a>
                                <ul class="dropdown">
                                    <li><a href="/starbucks/product/list.jsp">머그</a></li>
                                    <li><a href="/starbucks/product/list.jsp">글라스</a></li>
                                    <li><a href="/starbucks/product/list.jsp">텀블러</a></li>
                                    <li><a href="/starbucks/product/list.jsp">원두</a></li>
                                    <li><a href="/starbucks/product/list.jsp">액세서리</a></li>
                                    <li><a href="/starbucks/product/list.jsp">기프티 카드</a></li>
                                    
                                </ul>
                            </li>
                            <li class="has-children">
                                <a href="./bbs/">Events</a>
                                <ul class="dropdown">
                                    <li><a href="/starbucks/bbs/">진행중인 이벤트</a></li>
                                    <li><a href="/starbucks/bbs/">종료된 이벤트</a></li>
                                    <li><a href="/starbucks/bbs/">당첨자 발표</a></li>
                                </ul>
                            <li class="has-children">
                                <a href="/starbucks/bbs/">Community</a>
                                <ul class="dropdown">
                                    <li><a href="/starbucks/bbs/">Review</a></li>
                                    <li><a href="#">Store Info</a></li>
                                </ul>
                            </li>
                            <li class="has-children">
                                <a href="notice_select.uk?nowPage=1">CS Center</a>
                                <ul class="dropdown">
                                    <li><a href="notice_select.uk?nowPage=1">Notice</a></li>
                                    <li><a href="review_select.uk?nowPage=1">Review</a></li>
                                </ul>
                        </ul>
                    </div>
                </nav>
            </header>
            
            