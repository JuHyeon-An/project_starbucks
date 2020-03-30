<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../layout/header.jsp" %>

    <!-- Breadcrumb -->
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">MyPage</strong>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb END -->

    <!-- Content -->
    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
            	
               	<!-- content -->
               	<jsp:include page="${param.my }"></jsp:include>
               	
            </div>
        </div>
    </div>
    <!-- Content END-->

	<script>
		$(function(){
			userInfoUpdate();
		})
		
	</script>
    <%@include file="../layout/footer.jsp" %>