<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- left side menu -->
	<%@include file="./left.jsp" %>
<!-- 
	<div class="col-md-9 order-2">
        <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Thank you!</h2>
            <p class="lead mb-5">${msg }</p>
            <p><a href="../product/list.jsp" class="btn btn-sm btn-primary">Back to shop</a></p>
        </div>
    </div>
    
 -->
 <form action="" name="userInfoUpdateFrm">
 	<input type="hidden" name="mId2" id="mId2" value="${mId }" />
 </form>
<script>
	$(function(){
		
		Swal.fire({
			icon: 'success',
			title: 'SUCCESS!',
			text: '${msg }' 
		}).then((result) => {
		  	if (result.value) {
		  		//history.back();
		  		location.href = './account.my?mId2=${mId}';
		  	}
		});
		
	})
	
</script>