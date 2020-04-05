<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Starbucks Shop ADMIN</title>
    <link rel="shortcut icon" href="/starbucks/images/favicon.ico" type="image/ico">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="/starbucks/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="/starbucks/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="/starbucks/css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
	<link rel="stylesheet" href="/starbucks/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
	<link rel="stylesheet" href="/starbucks/css/custom.css" type="text/css" />
	 <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"/>
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
	<!-- choose a theme file -->
	<!-- 
	<link rel="stylesheet" href="../tablesorter-master/css/theme.default.css">
	 -->
	
    <script type='text/javascript' src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
	<script type='text/javascript' src="/starbucks/jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script type='text/javascript' src="<%=request.getContextPath() %>/js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script type='text/javascript' src="<%=request.getContextPath() %>/js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script type='text/javascript' src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script type='text/javascript' src="<%=request.getContextPath() %>/js/tooplate-scripts.js"></script>
    <script src="/starbucks/jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="<%=request.getContextPath() %>/js/admin_products.js"></script>
    
    <!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.10.5/dist/sweetalert2.all.min.js"></script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
<!-- exportExcel -->
<script src="../ExportExcel/src/jquery.table2excel.js"></script>

<!--  exportCSV -->
<script src='../CSVexport/jquery.TableCSVExport.js'></script>
	
	
</head>

<body id="reportsPage">
    <div class="" id="home"></div>
        <nav class="navbar navbar-expand-xl ">
            <div class="container h-100">
                <a class="navbar-brand" href="dashboard.stb">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a id="dashNav" class="nav-link" href="dashboard.stb">
                                <i class="fas fa-tachometer-alt"></i>
                                SUMMARY
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">

                            <a id="orderNav" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-file-alt"></i>
                                <span>
                                    		주문내역 <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="order.order">주문내역조회</a>
                                                           </div>
                        </li>

						<li class="nav-item dropdown">

                            <a id="proNav" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-shopping-cart"></i>
                                <span>상품관리<i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="./add_product.stb">상품 등록</a>
                                <a class="dropdown-item" href="./select_product.stb">상품 목록</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a id="accNav" class="nav-link dropdown-toggle"  href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                                <i class="far fa-user"></i>
                                <span>회원관리<i class="fas fa-angle-down"></i></span>
                            </a>
                           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="admin.adminmember">회원관리</a>
                               
                            </div>
                        </li>
                        
                        
                        
                        
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                <span>
                                    		설정 <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Profile</a>
                                <a class="dropdown-item" href="#">Billing</a>
                                <a class="dropdown-item" href="#">Customize</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
						<li class="nav-item">
                            <a class="nav-link d-block" href="/starbucks/">
                            	SHOP
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-block" href="login.jsp">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                        
                    </ul>
                </div>
            </div>

        </nav>
        