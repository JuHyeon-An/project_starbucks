<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../layout/header.jsp" %>

    <!-- Breadcrumb -->
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb END -->
    
	<!-- Content -->
	<div class="site-section">
		<div class="container">
			<div class="row mb-5" id='target'>
                <div class="col-md-12 order-1 mb-5 mb-md-0">
                	<jsp:include page="${param.main }"></jsp:include> 
                </div>
			</div>
		</div>	
	</div>
	<!-- Content END-->    
<%@include file="../../../layout/footer.jsp" %>